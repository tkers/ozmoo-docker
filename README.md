# ozmoo-docker

Docker image for [Ozmoo](https://github.com/johanberntsson/ozmoo).

## Usage

Optionally pull the Docker image first:

```sh
docker pull tkers/ozmoo
```

And verify that it works:

```sh
docker run --rm tkers/ozmoo -v
```

In most cases you'll want to mount a volume to create an image from an existing z-machine story:

```sh
docker run --rm -v "$(PWD)":/data tkers/ozmoo dist/story.z3
```

This would create a `c64_game.d64` disk image from the game located at `dist/story.z3`.

## Building locally

You can build the `ozmoo` image locally:

```sh
docker build -t ozmoo .
```

Make sure to run it with the correct name:

```sh
docker run --rm ozmoo
```
