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
% In this file, we provide examples of how to plot some signals presented by this dataset. 
% The example has a menu where the user can indicate a specific signal to be visualized                                                
%                                                                                                                                  
% --------------------------------------------------------------------------------------------------

close all; clear all; clc; 
%Parameters that make up the dataset and their respective ranges or values 
%Menu content
fprintf("WELCOME TO THE GRAPHIC GENERATOR")
fprintf("\n")
fprintf("Remember that")
fprintf("\n")
fprintf("Participant: goes from 1 to 28")
fprintf("\n")
fprintf("Cycle: goes from 1 to 3")
fprintf("\n")
fprintf("- 1: cycle 1")
fprintf("\n")
fprintf("- 2: cycle 2")
fprintf("\n")
fprintf("- 3: cycle 3")
fprintf("\n")
fprintf("Sensor: goes from 1 to 4")
fprintf("\n")
fprintf("- 1: sensor 1")
fprintf("\n")
fprintf("- 2: sensor 2")
fprintf("\n")
fprintf("- 3: sensor 3")
fprintf("\n")
fprintf("- 4: sensor 4")
fprintf("\n")
fprintf("Movement: goes from 1 to 10")
fprintf("\n")
fprintf("- 1: Flexion")
fprintf("\n")
fprintf("- 2: Extension")
fprintf("\n")
fprintf("- 3: Ulnar deviation")
fprintf("\n")
fprintf("- 4: Radial deviation")
fprintf("\n")
fprintf("- 5: Hook grip")
fprintf("\n")
fprintf("- 6: Power grip")
fprintf("\n")
fprintf("- 7: Spherical grip")
fprintf("\n")
fprintf("- 8: Precision grip")
fprintf("\n")
fprintf("- 9: Lateral grip")
fprintf("\n")
fprintf("- 10: Pinch grip")
fprintf("\n")
fprintf("Forearm:")
fprintf("\n")
fprintf("- 1: Right")
fprintf("\n")
fprintf("- 2: Left")
fprintf("\n")
fprintf("Offset:")
fprintf("\n")
fprintf("- 1: With Offset")
fprintf("\n")
fprintf("- 2: Without Offset")
x1=1; x2=1; x3=1; x4=1; x5=1; x6=1; x7=1; x8=1;

while x1==1 %Directory selection
    fprintf("\n")
    fprintf("Please, select dataset folder")
    y= uigetdir("","");
    fprintf("\n")
    if y==0 %Validation of the directory selection
        fprintf("\n") 
        fprintf("You did not select a dataset folder") 
        fprintf("\n")
    else
        x1=0;
    end
end
while x2==1 %Participant selection
    fprintf("\n") 
    i = input("Enter the participant number of the sEMG signals that you want to display: ");
    fprintf("\n")
    if 1<=i && i<=28 %Validation of the participant selection
        x2=0;
    else
        fprintf("\n") 
        fprintf("The entered value is incorrect or out of range, try again") 
        fprintf("\n") 
    end
end
while x3==1 %Cycle selection
    fprintf("\n") 
    j=input("Enter the cycle number you want to display: ");
    fprintf("\n")
    if j>=1 && j<=3 %Validation of the cycle selection
        x3=0;
    else
        fprintf("\n") 
        fprintf("The entered value is incorrect or out of range, try again")
        fprintf("\n") 
    end
end
while x4==1 %Sensor number selection
    fprintf("\n") 
    k=input("Enter the sensor number you want to display: ");
    fprintf("\n")
    if k>=1 && k<=4 %Validation of the sensor number selection
        x4=0;
    else
        fprintf("\n") 
        fprintf("The entered value is incorrect or out of range, try again")
        fprintf("\n") 
    end
end
while x5==1 %Movement number selection
    fprintf("\n")
    l=input("Enter the movement number you want to display: ");
    fprintf("\n")
    if l>=1 && l<=10 %Validation of movement selection
        x5=0;
    else
        fprintf("\n") 
        fprintf("The entered value is incorrect or out of range, try again")
        fprintf("\n") 
    end
end
while x6==1 %Forearm selection
    fprintf("\n")
    m=input("Enter the forearm number you want to display (1-Right and 2-Left): ");
    fprintf("\n")
    if m==1 || m==2 %Validation of forearm selection
        x6=0;
    else
        fprintf("\n") 
        fprintf("The entered value is incorrect or out of range, try again")
        fprintf("\n") 
    end
end
while x7==1 %Selection of the type of signals to use 
    fprintf("\n")
    n=input("Enter an 1 to display the signal with offset and an 2 to display the signal without offset: ");
    fprintf("\n")
    if n==1 || n==2 %Validation of the type of signals implemented
        x7=0;
    else
        fprintf("\n") 
        fprintf("The entered value is incorrect, try again")
        fprintf("\n") 
    end
end 
file="P"+num2str(i)+"C"+num2str(j)+"S"+num2str(k)+"M"+num2str(l)+"F"+num2str(m)+"O"+num2str(n); %File name
fprintf("The next graphic correspond to the sEMG signals "+file)
fprintf("\n") 
input_graph = load (y+"\"+file); %Upload file
figure() %sEMG signal figure corresponding to the selected parameters
plot(input_graph)
title('sEMG Signal - '+file)
w=mean(abs(input_graph(1:100))); %Selection of the ylabel
if w<3
    ylabel('Voltage (V)')
else
    ylabel('Digital value')
end
xlabel('Samples')
grid on
fprintf("\n")  
