clear;
clc;
syms x omega;
assumeAlso(omega^27 == 1);

%% 定义化简后的各系数
A0 = omega - omega^10 + omega^26 - omega^17;
A1 = -omega^7 + omega^25 - omega^20 + omega^2;
A2 = -omega^14 + omega^23 - omega^13 + omega^4;
A3 = -omega^17 + omega^19 - omega^10 + omega^8;
A4 = -omega^7 + omega^11 - omega^20 + omega^16;
A5 = -omega^14 + omega^22 - omega^13 + omega^5;

%% 构造多项式 val(x)
val = A0 + A1*x + A2*x^2 + A3*x^3 + A4*x^4 + A5*x^5;

%% 定义 p(x) = x^6 + x^3 + 1 的伴随矩阵
% p(x)=x^6 + 0*x^5 + 0*x^4 + x^3 + 0*x^2 + 0*x + 1
C = [0, 0, 0, 0, 0, -1;
     1, 0, 0, 0, 0,  0;
     0, 1, 0, 0, 0,  0;
     0, 0, 1, 0, 0, -1;
     0, 0, 0, 1, 0,  0;
     0, 0, 0, 0, 1,  0];

%% 计算 val(C)
% 因为 val(x)=A0 + A1*x + ... + A5*x^5, 所以 val(C) = A0*I + A1*C + ... + A5*(C^5)
n = size(C,1);
valC = A0*eye(n);
coeffs = [A1, A2, A3, A4, A5];
for k = 1:5
    valC = valC + coeffs(k) * (C^k);
end

%% 显示结果
disp('化简后的多项式 val(x) 为:');
pretty(val)
disp('计算得到 val(C) = ');
pretty(valC)
