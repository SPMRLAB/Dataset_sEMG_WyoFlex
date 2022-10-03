% --------------------------------------------------------------------------------------------------
% Author: Gomez-Correa M., Ballesteros M., Salgado I., Cruz-Ortiz D.
% Gomez-Correa M. and Salgado I. are with Centro de Innovación y Desarrollo Tecnológico en Cómputo, 
% Instituto Politécnico Nacional.
% Ballesteros M. is with Centro de Innovación y Desarrollo Tecnológico en Cómputo, 
% Instituto Politécnico Nacional and with the Medical Robotics and Biosignal Processing Laboratory, 
% Unidad Profesional Interdisciplinaria de Biotecnología, Instituto Politécnico Nacional 
% Cruz-Ortiz D is with the Medical Robotics and Biosignal Processing Laboratory, 
% Unidad Profesional Interdisciplinaria de Biotecnología, Instituto Politécnico Nacional 
% 
%Corresponding author to: cuod.cruz.ortiz@gmail.com
% --------------------------------------------------------------------------------------------------
% --------------------------------------------------------------------------------------------------
%                                                                        
% In this file, we provide an example of how to form the input matrix used in the technical validation  
% to load the data to the toolbox Neuronal Net Pattern Recognition
%
% The example load the all the dataset signals for 6 movements, calculate local means of the Fast Fourier Transform of the 4 sensor,
% concatenate de previous vectors, create the output matrix and finally, display the one of the vectors used in the input matrix.                                           
%                                                                                                                                  
% --------------------------------------------------------------------------------------------------
clc; clear all; close all;
movements=[1 2 3 4 6 8]; %Movements implemented in the technical validation
%                         1 - Flexion   
%                         2 - Extension  
%                         3 - Ulnar deviation    
%                         4 - Radial deviation
%                         6 - Power grip
%                         8 - Lateral grip
X=[]; %Input matrix
Out=zeros(540,6); %Output matrix (matrix of 1s and 0s, a 1 placed in the column corresponding to the movement and 0 in the rest columns)
InputProm=zeros(1,50); %Vector for the local means of the Fast Fourier Transform for each sensor
cont=0;
InputTotal=[]; %Vector that contains the concatenation of the vectors with the local means
x1=1; x2=1;

while x1==1 %Directory selection
    fprintf("\n")
    fprintf("Please, select dataset folder")
    y= uigetdir("",""); %Command that opens the file explorer
    fprintf("\n")
    if y==0
        fprintf("\n") 
        fprintf("You did not select a dataset folder") %Validation of the directory selection
        fprintf("\n")
    else
        x1=0;
    end
end
while x2==1 %Selection of the type of signals to use (1 - signals with offset, 2 - signals without offset)
    fprintf("\n")
    b=input("Enter 1 to load the signal with offset and an 2 to display the signal without offset: ");
    fprintf("\n");
    if b==1 || b==2  %Validation of the directory selection
        x2=0;
    else
        fprintf("\n") 
        fprintf("The entered value is incorrect, try again")
        fprintf("\n") 
    end
end
for i=1:1:15                                % Participants 
    for j=1:1:3                             % Cycles
        for l=1:1:6                         % Movements
            for m=1:1:2                     % Forearm
                cont=cont+1;
                for k=1:1:4                 % Sensor
                    P = num2str(i);
                    C = num2str(j);
                    S = num2str(k);
                    M = num2str(movements(l));
                    F = num2str(m);
                    O = num2str(b);
                    file="P"+P+"C"+C+"S"+S+"M"+M+"F"+F+"O"+O;
                    input = load(y+"\"+file); %Load file
                    inicio=5; %The first 5 samples are not considered to eliminate the DC component of the transform 
                    final=130;
                    TF=abs(fft(input)); %Compute of the Fast Fourier Transform
                    for u=1:1:50
                        prom=mean(TF(inicio:final)); %Compute of local means (One value for every 10 Hz)
                        inicio=inicio+130;
                        final=final+130;
                        InputProm(1,u)=prom;
                    end
                    InputTotal=[InputTotal InputProm]; %Cocatenate vector with the local means vector for each sensor
                end
                Out(cont,l)=1; %Output matrix
                X=[X; InputTotal]; %Input matrix
                InputTotal=[];
            end
        end
    end
end
figure() %Example of the vectors that conform the input matrix
plot(X(1,:))
title('Example - VECTORS USED IN TECHNICAL VALIDATION')
xlabel("Samples")
ylabel("Amplitude")