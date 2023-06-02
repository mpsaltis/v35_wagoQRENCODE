# v35_wagoQRENCODE
QR Code Generator for Codesys Visualizations

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/7f690c48-2fb4-4791-a08b-ed1efdb48518)

This repo uses qrencode running in a Docker Container to update QR Code imgages in Codesys. qrencode saves the images to directory in then PLC where Codesys can use a dynamic bitmap to update the image


1. mkdir qrencode // create qrencode dir in root
2. cd qrencode // enter qrencode dir
3. nano DockerFile // create Dockerfile

Create a file names Dockefile with the following: 

  FROM alpine:3.18.0

  # hadolint ignore=DL3018
  RUN apk --update --no-cache add libqrencode \
      && rm -rf /var/cache/apk/*

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/f9f1af7f-1be2-4752-be04-849f586b8e48)
4. 
![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/864f7573-08e2-4dd8-951c-73b2dfeba1b2)

