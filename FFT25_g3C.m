%% 清除工作区和命令窗口
clear;
clc;

%% 定义符号变量（omega 作为参数）
syms omega

%% 定义多项式系数（已利用 omega^25=1 的周期性化简）
a0 = omega - 1i*omega^7 - omega^24 + 1i*omega^18;
a1 = 1i*omega^11 - omega^23 - 1i*omega^14 + omega^2;
a2 = 1i*omega^22 - omega^21 - 1i*omega^3 + omega^4;
a3 = 1i*omega^19 - omega^17 - 1i*omega^6 + omega^8;
a4 = 1i*omega^13 - omega^9 - 1i*omega^12 + omega^16;

%% 构造 x^5+i 的伴随矩阵 C
% 对于多项式 x^5 + i = 0，其伴随矩阵为
%      [0  1  0  0  0]
%      [0  0  1  0  0]
%      [0  0  0  1  0]
%      [0  0  0  0  1]
%      [-i 0  0  0  0]
C = sym([ 0  1  0  0  0;
          0  0  1  0  0;
          0  0  0  1  0;
          0  0  0  0  1;
         -1i 0  0  0  0]);

I = sym(eye(5));  % 5×5 单位矩阵

%% 计算 val(C)= a0*I + a1*C + a2*C^2 + a3*C^3 + a4*C^4
valC = a0*I + a1*C + a2*(C^2) + a3*(C^3) + a4*(C^4);

%% 显示结果
disp('val(C) = ');
pretty(valC)
