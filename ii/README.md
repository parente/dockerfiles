## ii in Docker

Runs http://tools.suckless.org/ii/ in a container with the in/out directory structure in a Docker volume. Makes it simple to write bots in containers that volume mount the ii container. Optionally supports SSL using stunnel.

## Example

Run the parente/ircit container to log into an IRC host and create the ii directory structure in /irc owned by user "nobody".

```
CID=$(docker run -d \
    -e IRC_SSL=1 \
    -e IRC_HOST=chat.freenode.net \
    -e IRC_PORT=7070 \
    -e IRC_NICKNAME=your_bot_name \
    parente/ircit)
```

Run a customer container that reads/writes to the ii directory structure via a volume mount of the first container.

```
docker run -d \
    --volumes-from $CID
    your_namespace/your_bot_feature
```