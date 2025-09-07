# A small-but-not-crazy base (Jammy). You can slim this further later.
FROM --platform=$TARGETPLATFORM arm64v8/ubuntu:22.04

# Non-root user required by CNB images (UID/GID 1000 is standard)
RUN groupadd -g 1000 cnb && useradd -u 1000 -g 1000 -s /bin/bash -m cnb

# Set CNB spec env vars
ENV CNB_USER_ID=1000
ENV CNB_GROUP_ID=1000

# Minimal runtime deps for Node apps
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ca-certificates libc6 libstdc++6 tzdata \
  && rm -rf /var/lib/apt/lists/*

# CNB-required labels
LABEL io.buildpacks.stack.id="io.buildpacks.stacks.jammy.tiny"
# Mixins required by buildpacks at runtime (keep in sync with what your buildpacks expect)
LABEL io.buildpacks.stack.mixins='["ca-certificates","libc6","libstdc++","tzdata"]'

# Set a sensible default user
USER 1000:1000

WORKDIR /workspace

# Distroless-like: no shell entrypoint
