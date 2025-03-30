%% 清除工作区和命令窗口
clear;
clc;

%% 定义符号变量 omega（此处 omega 被视为形式变量）
syms omega;

%% 定义多项式各项系数（已利用 omega^25 = 1 的循环性化简）
A0 = omega   + omega^7 + omega^24 + omega^18;
A1 = omega^11+ omega^23+ omega^14+ omega^2;
A2 = omega^22+ omega^21+ omega^3 + omega^4;
A3 = omega^19+ omega^17+ omega^6 + omega^8;
A4 = omega^13+ omega^9 + omega^12+ omega^16;

%% 构造 x^5-1 的伴随矩阵 C
% 这里采用常用的伴随矩阵形式
C = sym([0 1 0 0 0;
         0 0 1 0 0;
         0 0 0 1 0;
         0 0 0 0 1;
         1 0 0 0 0]);

I = sym(eye(5));  % 5x5单位矩阵

%% 计算 val(C) = A0*I + A1*C + A2*C^2 + A3*C^3 + A4*C^4
valC = A0*I + A1*C + A2*(C^2) + A3*(C^3) + A4*(C^4);

%% 显示结果
disp('val(C) = ');
pretty(valC)
