%% 使用符号变量
syms omega x

%% 定义化简后的系数 A0, A1, A2（保留 omega 符号）
A0 = omega + 1i*omega^8 - omega^12 - 1i*omega^5;
A1 = -1i*omega^10 - omega^11 + 1i*omega^3 + omega^2;
A2 = -1i*omega^7 - omega^9 + 1i*omega^6 + omega^4;

%% 定义多项式 f(x)= A0 + A1*x + A2*x^2 （供参考）
% f(x) = A0 + A1*x + A2*x^2;

%% 定义 x^3 - i 的伴随矩阵 C
% 对于 x^3 - i = 0, 多项式系数为 [1, 0, 0, -i]
C = sym([0 0 1i; 1 0 0; 0 1 0]);

%% 计算 C^2
C2 = C^2;

%% 计算 val(C) = A0*I + A1*C + A2*C^2
valC = A0*eye(3) + A1*C + A2*C2;

%% 显示结果（以符号形式保留 omega）
disp('val(C) = ');
pretty(valC)

%% 如果需要以 LaTeX 格式输出结果，可以使用：
% latex(valC)
