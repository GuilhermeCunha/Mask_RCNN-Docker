# Mask_RCNN Docker Image

Docker ideal para utilização do <a href="https://github.com/matterport/Mask_RCNN">Mask RCNN</a>.

## Primeira utilização

1) Colocar pasta da sua Mask RCNN na origem deste repositório, ou seja, em X:/path/to/Mask_RCNN-Docker/

2) Buildar a imagem.
```
docker build -t guilhermecunha/maskrcnn .
```
3) Com a imagem pronta, você precisará iniciar um container utilizando esta imagem.
```
docker run --name maskrcnn -p 8888:8888 -it guilhermecunha/maskrcnn
```

## Como usar

Basta acessar o Jupyter Notebook através de qualquer navegador a url
```
http://localhost:8888/
```