## WebDAV in Docker

Runs Apache configured as a WebDAV server. Exposes volume `/srv/webdav` at yourdomain.com/webdav for user "webdav" with a password of your choosing over HTTPS. I use it as a sync server for [OmniFocus](https://www.omnigroup.com/omnifocus), for example.

```
docker run -dP -e PASSWORD=$( read -p "Password: " -s PASSWORD && echo $PASSWORD ) parente/webdav
```