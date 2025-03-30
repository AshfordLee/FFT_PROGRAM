clear;
clc;
syms x omega;
assumeAlso(omega^27 == 1);

%% 定义化简后多项式的系数
A0 = omega - omega^4 - omega^5 + omega^8 + omega^10 - omega^13 - omega^14 + omega^17 + omega^19 - omega^22 - omega^23 + omega^26;
A1 = omega^2 - omega^4 - omega^5 + omega^7 + omega^11 - omega^13 - omega^14 + omega^16 + omega^20 - omega^22 - omega^23 + omega^25;

% 化简后的多项式：val = A0 + A1*x
val = A0 + A1*x;

%% 定义多项式 p(x)=x^2+x+1 的伴随矩阵
% 对于多项式 x^2+x+1, 标准伴随矩阵为：
C = [0, -1; 1, -1];

%% 计算 val(C)
% 因为 val(x)=A0 + A1*x, 所以 val(C)=A0*I + A1*C，其中 I 是 2x2 单位矩阵
valC = A0*eye(2) + A1*C;

%% 显示结果
disp('简化后的多项式 val:');
pretty(val)
disp('val(C) = A0*I + A1*C:');
disp(valC)
