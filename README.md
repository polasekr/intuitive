# Build image

`docker build -t interactive .`

# Run image

`docker run -d interactive tail -f /dev/null`

# Upload the image

```
docker tag interactive polasekr/interactive
docker push polasekr/interactive
```
