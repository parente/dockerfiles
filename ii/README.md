## ii in Docker

Runs a patched version of http://tools.suckless.org/ii/ in a container with the in/out directory structure in a Docker volume with world readable/writable permissions. Makes it simple to write bots in containers that volume mount the ii container and write to its in/out channels on disk. Optionally supports SSL using stunnel.

## Example

Run the parente/ircit container to log into an IRC host and create the ii directory structure in /irc.

```
CID=$(docker run -d \
    -e IRC_SSL=1 \
    -e IRC_HOST=chat.freenode.net \
    -e IRC_PORT=7070 \
    -e IRC_NICKNAME=your_bot_name \
    parente/ircit)
```

Run a custom container that reads/writes to the ii directory structure via a volume mount of the first container. As a test, you can join a channel:

```
docker run -it --user nobody --rm \
    --volumes-from $CID \
    ubuntu:14.04 \
    /bin/bash -c 'echo "/join #mychannel" > /irc/ii/in'
```

and then message it:

```
docker run -it --user nobody --rm \
    --volumes-from $CID \
    ubuntu:14.04 \
    /bin/bash -c 'echo "hello world!" > /irc/ii/#mychannel/in'
```

as any user.