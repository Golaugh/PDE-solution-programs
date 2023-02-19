%加权隐式格式
%结合跳点法
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
k1 = (j1 / (h1^2));
k2 = (1 - 2 * (j1 / (h1 ^2)));
k3 = (j1 / (h1^2));
k4 = 1/4;
for t = 2:L_t1
    for x = 2:L_x1-1
        if mod(t + x + 1, 2) == 0 
            M(x,t) =  k1 * M(x+1, t-1) + k2 * M(x, t-1) + k3 * M(x-1, t-1);
        end
    end
    for x = 2:L_x1-1
        if mod(t + x + 1, 2) == 1
            M(x,t) =  k4 * (M(x-1, t-1) + M(x+1, t-1) + M(x-1, t) + M(x+1, t));
        end
    end
end
figure(1)
mesh((x_1)', (t_1)', M)
title('绘制数值解') 
xlabel('x')         
ylabel('t') 
zlabel('u') 
grid on
%生成精确解矩阵u，并计算误差，绘图
figure(2)
u = exp(x_1 + t_1);
v_error = u' - M;
mesh((x_1)', (t_1)', v_error)
title('绘制数值误差') 
xlabel('x') 
ylabel('t') 
zlabel('v\_error')  
grid on