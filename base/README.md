# base

For arm64, we need an arm64 build of `builder-jammy-tiny`

```
export DOCKER_DEFAULT_PLATFORM=linux/arm64
docker buildx build --platform linux/arm64 \
  -t jonathank4/build-jammy-tiny-arm64 -f build.Dockerfile --push .
```

```
export DOCKER_DEFAULT_PLATFORM=linux/arm64
docker buildx build --platform linux/arm64 \
  -t jonathank4/run-jammy-tiny-arm64 -f run.Dockerfile --push .
```

```
cd ../node-engine
pack buildpack package jonathank4/node-engine-arm64:latest \
  --config ./package.toml \
  --publish
cd ../base
```


```
pack builder create jonathank4/builder-jammy-node-tiny-arm64 \
  --config builder.toml \
  --publish
```
