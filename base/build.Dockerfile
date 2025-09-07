FROM --platform=$TARGETPLATFORM arm64v8/ubuntu:22.04

# Build-time tools needed by Node buildpacks (curl/tar to fetch Node, etc.)
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      bash curl tar xz-utils git ca-certificates \
      libc6 libstdc++6 tzdata \
  && rm -rf /var/lib/apt/lists/*

# Same cnb user
RUN groupadd -g 1000 cnb && useradd -u 1000 -g 1000 -s /bin/bash -m cnb

# Set CNB spec env vars
ENV CNB_USER_ID=1000
ENV CNB_GROUP_ID=1000


# CNB labels must match the run image
LABEL io.buildpacks.stack.id="io.buildpacks.stacks.jammy.tiny"
LABEL io.buildpacks.stack.mixins='["ca-certificates","libc6","libstdc++","tzdata"]'

USER 1000:1000
WORKDIR /workspace
