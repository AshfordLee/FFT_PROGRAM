%% 清除环境
clear;
clc;

%% 定义符号变量
syms x omega;
% 如有需要，可以添加单位根假设，例如: assume(omega^17 == 1);

%% 定义化简后的余式 val(x)
% val(x) = (omega + 1i*omega^13 - omega^16 - 1i*omega^4)
%        + x*( -1i*omega^12 - omega^14 + 1i*omega^5 + omega^3)
%        + x^2*( -1i*omega^2 - omega^8 + 1i*omega^15 + omega^9)
%        + x^3*( -1i*omega^6 - omega^7 + 1i*omega^11 + omega^10)
A0 = omega + 1i*omega^13 - omega^16 - 1i*omega^4;
A1 = -1i*omega^12 - omega^14 + 1i*omega^5 + omega^3;
A2 = -1i*omega^2 - omega^8 + 1i*omega^15 + omega^9;
A3 = -1i*omega^6 - omega^7 + 1i*omega^11 + omega^10;

%% 构造 x^4 - i 的伴随矩阵 C
% 对于 p(x)=x^4-i，其系数为 [1, 0, 0, 0, -i],
% 故伴随矩阵为：
%      [ 0   0   0   i ]
%      [ 1   0   0   0 ]
%      [ 0   1   0   0 ]
%      [ 0   0   1   0 ]
C = sym([0 0 0 1i;
         1 0 0 0;
         0 1 0 0;
         0 0 1 0]);

%% 计算 val(C)
% 由于 val(x)= A0 + A1*x + A2*x^2 + A3*x^3,
% 替换 x 为矩阵 C 得：
% val(C) = A0*I + A1*C + A2*C^2 + A3*C^3
I = sym(eye(4));  % 4x4 单位矩阵
valC = A0*I + A1*C + A2*(C^2) + A3*(C^3);

%% 显示结果
disp('val(C) = ');
pretty(valC)
