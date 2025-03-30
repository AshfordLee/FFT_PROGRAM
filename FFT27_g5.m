clear;
clc;
syms x omega;
assumeAlso(omega^27 == 1);

% 构造 f(x)=sum_{j=0}^{17} omega^(2^j)*x^j
f = sym(0);
for j = 0:17
    f = f + omega^(2^j)*x^j;
end

% 定义除式 g(x)= x^6 + x^3 + 1
g = x^6 + x^3 + 1;

% 进行多项式除法，得到商 Q 和余式 R
[Q, R] = quorem(f, g, x);

% 显示余式（保留 ω 的符号形式）
disp('f(x) 除以 x^6+x^3+1 的余式为：');
pretty(R)
