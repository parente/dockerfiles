[Pandoc](http://johnmacfarlane.net/pandoc/) containerized. Example usage:

```
docker run -t -i -v `pwd`:/host parente/pandoc -f INPUT_FORMAT -t OUTPUT_FORMAT -o /host/OUTPUT_FILENAME /host/INTPUT_FILENAME
```
