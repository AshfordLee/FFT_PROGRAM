% 定义 13 次单位根 omega
syms omega;

% 计算化简后的系数
A0 = omega + omega^8 + omega^12 + omega^5;
A1 = omega^10 + omega^11 + omega^3 + omega^2;
A2 = omega^7 + omega^9 + omega^6 + omega^4;

% 构造 x^3 - 1 的伴随矩阵
C = [0 0 1; 1 0 0; 0 1 0];

% 计算 C 的幂次
C2 = C^2;

% 计算 val(C) = A0*I + A1*C + A2*C^2
valC = A0 * eye(3) + A1 * C + A2 * C2;

% 显示结果
disp('val(C) = ');
disp(valC);
latex(valC)
