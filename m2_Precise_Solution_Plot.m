%չʾ��ȷ��ͼ��
clear; close all; clc; 
a = 0:1:5;
b = 0:1:7;
[x, t] = meshgrid(a, b);
u = exp(x + t);
mesh(x, t, u)
title('���ƾ�ȷ��') 
xlabel('x')         
ylabel('t') 
zlabel('u')     
grid on