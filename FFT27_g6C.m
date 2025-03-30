clear;
clc;
syms x omega;
assumeAlso(omega^27 == 1);

%% 化简后的各系数
A0 = omega + omega^17 - omega^10 - omega^26;
A1 = omega^2 + omega^7 - omega^20 - omega^25;
A2 = omega^4 + omega^14 - omega^13 - omega^23;
A3 = omega^8 + omega^10 - omega^17 - omega^19;
A4 = omega^16 - omega^7 - omega^11 + omega^20;
A5 = omega^5 + omega^13 - omega^14 - omega^22;

%% 构造化简后的多项式 val(x)
val = A0 + A1*x + A2*x^2 + A3*x^3 + A4*x^4 + A5*x^5;
disp('化简后的多项式 val(x):');
pretty(val)

%% 定义多项式 p(x)=x^6 - x^3 + 1 的伴随矩阵
C = [0, 0, 0, 0, 0, -1;
     1, 0, 0, 0, 0,  0;
     0, 1, 0, 0, 0,  0;
     0, 0, 1, 0, 0,  1;  % 注意：-(-1)=1
     0, 0, 0, 1, 0,  0;
     0, 0, 0, 0, 1,  0];

%% 计算 val(C)
n = size(C,1);
valC = A0 * eye(n);  % 对应 x^0 项
coeffs = [A1, A2, A3, A4, A5];
for k = 1:5
    valC = valC + coeffs(k) * (C^k);
end

disp('val(C) = ');
pretty(valC)
