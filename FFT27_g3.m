% 定义符号变量 x 和 ω，并假设 ω^25 = 1
syms x omega;
assume(omega^27 == 1);

% 构造多项式 f(x)=∑_{j=0}^{17} ω^(2^j) x^j
f = sym(0);
for j = 0:17
    f = f + omega^(2^j) * x^j;
end

% 定义除式多项式 g(x)=x^2+x+1
g = x^2 + x + 1;

% 利用 quorem 进行多项式除法，得到商 q 和余式 r
[q, r] = quorem(f, g, x);

% 显示余式（保留 ω 的符号形式）
disp('f(x) 除以 x^2+x+1 的余式为:');
pretty(r)
