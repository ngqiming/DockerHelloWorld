#Obtain the base image windows server core
FROM mcr.microsoft.com/windows/servercore

#Set work directory
WORKDIR /helloapp

#Copy helloworld into helloapp folder 
COPY helloworld.exe /helloapp

#Add Visual C++ Redistribute Package for helloworld.exe 
ADD https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x86.exe

#Use powershell to install dll into the container
RUN powershell.exe -Command Start-Process c:\vc_redist_x86.exe -ArgumentList '/quiet' -Wait

#Execute helloworld.exe 
ENTRYPOINT [ "helloworld.exe" ]