# Mask_RCNN Docker Image

Docker ideal para utilização do Mask_RCNN.

## Como instalar

Primeiro você precisará buildar a imagem através do comando abaixo.
```
docker build -t guilhermecunha/maskrcnn .
```
Com a imagem pronta, você precisará iniciar um container utilizando esta imagem.
```
docker run -name maskrcnn -p 8888:8888 -it guilhermecunha/maskrcnn
```
Estando dentro do container, basta inicializar o Jupyter Notebook.
```
 jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root
```

## Como usar

Basta acessar o Jupyter Notebook através de qualquer navegador a url
```
http://localhost:8888/
```