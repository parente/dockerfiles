IPython 2.x containerized and configured to run IPython Notebook server. Includes no additional libraries. They can be installed using pip from the notebook or via a Dockerfile that inherits from this repository.

To run the IPython Notebook without a password over HTTPS:

```
docker run -d -P parente/ipython
```

To run the IPython Notebook with a password of your choosing over HTTPS:

```
docker run -d -P -e PASSWORD=$( read -p "Password: " -s PASSWORD && echo $PASSWORD ) parente/ipython
```