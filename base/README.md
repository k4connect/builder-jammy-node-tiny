# base

For arm64, we need an arm64 build of `builder-jammy-tiny`

```
export DOCKER_DEFAULT_PLATFORM=linux/arm64
docker buildx build --platform linux/arm64 \
  -t localhost:5000/run-jammy-tiny-arm64 -f run.Dockerfile --push .
```

```
export DOCKER_DEFAULT_PLATFORM=linux/arm64
docker buildx build --platform linux/arm64 \
  -t localhost:5000/build-jammy-tiny-arm64 -f build.Dockerfile --push .
```

```
cd ../node-engine
pack buildpack package localhost:5000/node-engine-arm64-bp:1.0.0 \
  --config ./package.toml \
  --publish
cd ../base
```


```
pack builder create localhost:5000/builder-jammy-node-tiny-arm64 \
  --config builder.toml \
  --publish
```
