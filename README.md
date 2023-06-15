# v35_wagoQRENCODE
QR Code Generator for Codesys Visualizations

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/7f690c48-2fb4-4791-a08b-ed1efdb48518)

This repo uses qrencode running in a Docker Container to generate QR images, based on a string that it is given. This can then be saved in a location where it can be accessed within Codesys.Dynamic bitmap can be used to dynamically update the image

# Pull Docker Image
1. Enable or Install Docker on your device
```
docker pull mpsaltis/wago_qrencode
```
In the terminal, the following command can then be used to create QR code for www.google.com that is saved in the /home directory.

```
docker run --rm -t -v /home/:/tmp mpsaltis/wago_qrencode qrencode -l L -o /tmp/placeholderqr.bmp www.google.com
```

Note: The directory may be changed to /home/codesys_root/PlcLogic/visu to be used with an image pool in Codesys.


# Dynamically update the QR Code with Codesys v3.5

1. First run the following command in the shell of the PLC to generate a PNG QR code with the name palceholderqr in the home directory:
```  
docker run --rm -t -v /home/:/tmp wago/qrencode qrencode -l L -o /tmp/placeholderqr.bmp www.google.com
```
2. Then move this image from the PLC, to your PC to be later imported into Codesys. This can be done with a utility like WinSCP
   
4. Create an image pool in Codesys, and add the .png as embedded.

Note- The image must be a PNG to be updated dynamically

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/f804b011-7386-4f4c-b387-31a626e00a1b)

Create a POU with an FUExecuteCommand function block to pass the command to the shell from Codesys. 

sURL : variable for the URL address.
xUpdateImage : Used by the visualization to update the image when the value changes.

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/539130e6-5bb3-4d96-ad56-755758be98d0)


Add the image to a visualization, and assign the Bitmap ID variable as the name of the ImagePool bitmap. Set the Bitmap Version to a variable that is updated when a new QR code is generated.

![image](https://github.com/mpsaltis/v35_wagoQRENCODE/assets/90796089/b4c7251f-a50f-4687-8c6b-71dcde8e1c23)
