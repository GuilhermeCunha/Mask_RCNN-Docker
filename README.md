# Mask_RCNN Docker Image

Docker ideal para utilização do <a href="https://github.com/matterport/Mask_RCNN">Mask RCNN</a>.

## Primeria utilização do container

1) Colocar pasta da sua Mask RCNN na origem deste repositório, ou seja, em X:/path/to/Mask_RCNN-Docker/

2) Abrir o prompt na pasta deste repositório.

3) Buildar a imagem.
```
docker build -t guilhermecunha/maskrcnn .
```
4) Com a imagem pronta, você precisará iniciar um container utilizando esta imagem.
```
docker run --name maskrcnn -p 8888:8888 -it guilhermecunha/maskrcnn
# caso apareça esta mensagem : 
#"the input device is not a TTY.  If you are using #mintty, try prefixing the command with 'winpty'"
#utilize o comando abaixo
winpty docker run --name maskrcnn -p 8888:8888 -it guilhermecunha/maskrcnn
```

## Como utilizar o Container

### Para iniciar o container
```
docker start maskrcnn
```

### Para parar o container
```
docker stop maskrcnn
```

## Como usar o Mask RCNN
Basta acessar o Jupyter Notebook através de qualquer navegador a url:
```
http://localhost:8888/
```