# -*- coding: utf-8 -*-
"""
 --------------------------------------------------------------------------------------------------
 Author: Gomez-Correa M., Ballesteros M., Salgado I., Cruz-Ortiz D.
 Gomez-Correa M. and Salgado I. are with Centro de Innovación y Desarrollo Tecnológico en Cómputo, 
 Instituto Politécnico Nacional.
 Ballesteros M. is with Centro de Innovación y Desarrollo Tecnológico en Cómputo, 
 Instituto Politécnico Nacional and with the Medical Robotics and Biosignal Processing Laboratory, 
 Unidad Profesional Interdisciplinaria de Biotecnología, Instituto Politécnico Nacional 
 Cruz-Ortiz D is with the Medical Robotics and Biosignal Processing Laboratory, 
 Unidad Profesional Interdisciplinaria de Biotecnología, Instituto Politécnico Nacional 
 
Corresponding author to: cuod.cruz.ortiz@gmail.com
 --------------------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------------------
                                                                        
 In this file, we provide examples of how to plot some signals presented by this dataset. 
 The example has a menu where the user can indicate a specific signal to be visualized                                                
                                                                                                                                  
 --------------------------------------------------------------------------------------------------
"""
import os
import numpy as np
from tkinter import filedialog
import matplotlib.pyplot as plt
 
#Parameters that make up the dataset and their respective ranges or values 
#Menu content
os.system('cls')
print("WELCOME TO THE GRAPHIC GENERATOR")
print("Remember that")
print("Participant: goes from 1 to 28")
print("Cycle: goes from 1 to 3")
print("- 1: cycle 1")
print("- 2: cycle 2")
print("- 3: cycle 3")
print("Sensor: goes from 1 to 4")
print("- 1: sensor 1")
print("- 2: sensor 2")
print("- 3: sensor 3")
print("- 3: sensor 4")
print("Movement: goes from 1 to 10")
print("- 0: Flexion")
print("- 1: Extension")
print("- 2: Ulnar deviation")
print("- 3: Radial deviation")
print("- 4: Hook grip")
print("- 5: Power grip")
print("- 6: Spherical grip")
print("- 7: Precision grip")
print("- 8: Lateral grip")
print("- 9: Pinch grip")
print("Forearm:")
print("- 1: Right")
print("- 2: Left")
print("Offset:")
print("- 1: With Offset")
print("- 2: Without Offset")
x=1; x1=1; x2=1; x3=1; x4=1; x5=1; x6=1; x7=1; x8=1; prom=0;


while x1==1: #Directory selection
    print("\n")
    print("Please, select dataset folder")
    y= filedialog.askdirectory()
    print(y)
    if y=="": #Validation of the directory selection
        print("You did not select a dataset folder")
    else:
        x1=0;
while x2==1: #Participant selection
    i = int(input("Enter the participant number of the sEMG signals that you want to display: "))
    if i>=1 and i<=28: #Validation of the participant selection
        x2=0;
    else:
        print("The entered value is incorrect or out of range, try again")
while x3==1: #Cycle selection
    j= int(input("Enter the cycle number you want to display: "));
    if j>=1 and j<=3: #Validation of the cycle selection
        x3=0;
    else:
        print("The entered value is incorrect or out of range, try again")
while x4==1: #Sensor number selection
    k= int(input("Enter the sensor number you want to display: "));
    if k>=1 and k<=4: #Validation of the sensor number selection
        x4=0;
    else:
        print("The entered value is incorrect or out of range, try again")
while x5==1: #Movement number selection
    l= int(input("Enter the movement number you want to display: "));
    if l>=1 and l<=10: #Validation of movement selection
        x5=0;
    else: #Forearm selection
        print("The entered value is incorrect or out of range, try again")
while x6==1: #Validation of forearm selection
    m= int(input("Enter the forearm number you want to display (1-Right and 2-Left): "));
    if m==1 or m==2:
        x6=0;
    else:
        print("The entered value is incorrect or out of range, try again")
while x7==1: #Selection of the type of signals to use 
    n=int(input("Enter an 1 to display the signal with offset and an 2 to display the signal without offset: "));
    if n==1 or n==2: #Validation of the type of signals implemented
        x7=0;
    else:
        print("The entered value is incorrect, try again")
filename="P"+str(i)+"C"+str(j)+"S"+str(k)+"M"+str(l)+"F"+str(m)+"O"+str(n);
print("The next graphic correspond to the sEMG signals "+filename)
y=y+"/" 
y=y+filename
input_graph = np.loadtxt(y, delimiter=',',dtype="float"); #Upload file
fig=plt.figure()
plt.plot(input_graph) #sEMG signal figure corresponding to the selected parameters
plt.title('sEMG Signal - '+filename)
for g in range(100): #Selection of the ylabel
    prom=prom+abs(input_graph[g])
w=prom/100
if w<3:
    plt.ylabel('Voltage (V)')
else:
    plt.ylabel('Digital value')
plt.xlabel('Samples')
fig.show()



