%��ͬ������ֵ��ͼ��
%�����ҵ�׷�Ϸ���ʹ��Implicit�㷨
clear; close all; clc; 
h1 = 1/50;  j1 = 1/100;  L1 = 1; 
h1_f = input('��������򲽳�:');
j1_f = input('���������򲽳�:');
L1_f = input('������ʱ��㳤��:');
if h1_f
    h1 = h1_f;
end
if j1_f
    j1 = j1_f;
end
if L1_f
    L1 = L1_f;
end
L_x1 = 1 / h1;  L_t1 = L1 / j1;
a1 = h1:h1:1;  b1 = j1:j1:L1;
M = zeros(L_x1, L_t1);  [x_1, t_1] = meshgrid(a1, b1);
for i = 1:L_t1
    M(1,i) = exp((i * L1) / L_t1);
    M(L_x1,i) = exp(1+((i * L1) / L_t1));
end
for j = 1:L_x1
    M(j,1) = exp(j / L_x1);
end
a = - (j1 / h1^2);
b = 1 + (2*j1 / h1^2);
c = a;
beta = zeros(1, L_x1);
for i = 1:L_x1
    if i == 1
        beta(1, i) = c / b;
    else
        beta(1, i) = c / (b - a * beta(1, i-1));
    end
end
for t = 2:L_t1
    Y = zeros(1, L_x1);
    for j = 1:L_x1
        if j == 1
            Y(1, j) = M(1, t-1) / b;
        else
            Y(1, j) = (M(j, t-1) - (a * Y(1, j-1))) / (b - a * beta(1, j-1));
        end
    end
    % M(L_x1, t) = Y(1, L_x1);  �˲������ֵ�����Ѹ������ʲ������
    for k = 1:(L_x1-2)
        M(L_x1 - k, t) = Y(1, L_x1 - k) - beta(1, L_x1 - k) * M(L_x1 - k + 1, t);
    end
end
figure(1)
mesh((x_1)', (t_1)', M)
title('������ֵ��') 
xlabel('x')         
ylabel('t') 
zlabel('u')  
grid on
%���ɾ�ȷ�����u������������ͼ
figure(2)
u = exp(x_1 + t_1);
v_error = u' - M;
mesh((x_1)', (t_1)', v_error)
title('������ֵ���') 
xlabel('x') 
ylabel('t') 
zlabel('v\_error')  
grid on