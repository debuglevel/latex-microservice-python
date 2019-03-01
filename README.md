# \*TeX Microservice

This container offers a little http service that allows to compile various \*TeX sources without installing \*TeX into your application container.

## Usage

To start the container you can use the following command:
```
docker run -p 7000:7000 digilist/latex-microservice
```

The http service is now available under http://localhost:7000 and accepts your POST requests. You can specify your favorite tex compiler in the request path, e.g. http://localhost:7000/xelatex

Examples are given as curl commands.

### Simple TeX compiling
This example posts the tex source to the service and receives the compiled PDF.
```
curl -X POST -d "`cat test.tex`" -H "Content-Type: text/plain" -H "Accept: application/pdf" http://localhost:7000/
```

### JSON response with compiler output
By requesting JSON, the service will return the output of the compiler and the PDF as base64 encoded string.
```
curl -X POST -d "`cat test.tex`" -H "Content-Type: text/plain" -H "Accept: application/json" http://localhost:7000/
```

```json
{
    "status": "success",
    "compiler_output": "b\"This is pdfTeX, Version 3.14159265-2.6-1.40.16...",
    "pdf: "b'JVBER....'"
}
```

### Passing source as JSON
You can also POST a JSON object to the service. This allows you to pass further files (which need to be base64 encoded):
```
curl -X POST -d '{"tex_source": "XGRvY3VtZW50Y2xhc3N7YXJ0aWNsZX0KXGJlZ2lue2RvY3VtZW50fQpcaW5jbHVkZXt0ZXN0L3Rlc3R9ClxlbmR7ZG9jdW1lbnR9", "files": {"test/test.tex": "aGFsbG8gd2VsdA=="}}' -H "Content-Type: application/json" -H "Accept: application/json" http://localhost:7000/
```

# Contributors
* Original work by https://github.com/digilist/docker-latex-microservice
