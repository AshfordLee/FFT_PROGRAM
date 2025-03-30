%% 清除工作区和命令窗口
clear;
clc;

%% 定义符号变量 x 和 omega，并假定 omega^25 = 1
syms x omega;
assume(omega^25 == 1);

%% 构造多项式 f(x)= sum_{j=0}^{19} omega^(2^j)*x^j
f = sym(0);
for j = 0:19
    f = f + omega^(2^j) * x^j;
end

%% 定义除式：x^5 - 1
divisor = x^5 - 1;

%% 使用 quorem 计算 f(x) 除以 divisor 的商和余式
[quotient, remainder] = quorem(f, divisor, x);

%% 显示余式
disp('余式为：');
pretty(remainder)
