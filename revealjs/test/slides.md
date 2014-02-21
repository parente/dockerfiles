# Docker + reveal.js

### A reveal.js Docker Base Image with ONBUILD

---

## Write your slides

---

## Write a one-line Dockerfile

```bash
FROM parente/revealjs
```

---

## Build it

```bash
$ docker build -t myslides .
```

---

## Run it

```bash
$ docker run -d -P myslides
```

---

## View it

See http://mindtrove.info/a-reveal.js-docker-base-image-with-onbuild