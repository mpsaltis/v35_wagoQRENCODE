# v35_wagoQRENCODE
QR Code Generator for Codesys Visualizations

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/7f690c48-2fb4-4791-a08b-ed1efdb48518)

This repo uses qrencode running in a Docker Container to update QR Code imgages in Codesys. qrencode saves the images to directory in then PLC where Codesys can use a dynamic bitmap to update the image


1. mkdir qrencode // create qrencode dir in root
2. cd qrencode // enter qrencode dir
3. nano DockerFile // create Dockerfile

Create a file names Dockefile with the following: 

  FROM alpine:3.18.0

  // # hadolint ignore=DL3018
  RUN apk --update --no-cache add libqrencode \
      && rm -rf /var/cache/apk/*

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/f9f1af7f-1be2-4752-be04-849f586b8e48)

4. Docker build -t wago/qrencode

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/864f7573-08e2-4dd8-951c-73b2dfeba1b2)


The following command can then be used to create QR codes that are saved in the home directory.

  Note: The directory may be changed to /home/codesys_root/PlcLogic/visu to be used with an image pool in Codesys.

docker run --rm -t -v /home/:/tmp wago/qrencode qrencode -l L -o /tmp/placeholderqr.bmp www.google.com

# Dynamically update the QR Code with Codesys

First run the following command in the shell of the PLC to generate a QR code with the name palceholderqr in the home directory:
  docker run --rm -t -v /home/:/tmp wago/qrencode qrencode -l L -o /tmp/placeholderqr.bmp www.google.com
Then move this image from the PLC, to your PC to be later imported into Codesys. 
Create an image pool in Codesys, and add the .png as embeded
![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/f804b011-7386-4f4c-b387-31a626e00a1b)

Create a POU with an FUExecuteCommand function to pass the command to the shell from Codesys. 
sURL : variable for the URL address

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/539130e6-5bb3-4d96-ad56-755758be98d0)


Add the image to a visualization, and assign the Bitmap ID variable as the name of the ImagePool bitmap. Set the Bitmap Version to a variable that is updated when a new QR code is generated.

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/b4c7251f-a50f-4687-8c6b-71dcde8e1c23)
