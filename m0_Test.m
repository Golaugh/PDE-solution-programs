clear; close all; clc; 
h1 = 1/50;  j1 = 1/100;  L1 = 1; 
h1_f = input('请输入横向步长:');
j1_f = input('请输入纵向步长:');
L1_f = input('请输入时间层长度:');
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
A = zeros(L_x1);
k_a = - (j1 / h1^2);
k_b = 1 + (2 * j1 / (h1 ^2));
for i = 2:L_x1 - 1
    A(i, i-1) = k_a;
    A(i, i+1) = k_a;
    A(i, i) = k_b;
end
A(1,1) = k_b;
A(1,2) = k_a;
A(L_x1, L_x1-1) = k_a;
A(L_x1, L_x1) = k_b;
for t = 2:L_t1
    M(1,t-1) = exp(((t-1) * L1) / L_t1);
    M(L_x1,t-1) = exp(1+(((t-1) * L1) / L_t1));
    M(:, t) = (A^-1) * M(:, t-1);
end

mesh((x_1)', (t_1)', M)
title('绘制数值解') 
xlabel('x')         
ylabel('t') 
zlabel('u')  
view(62, 5)
grid on