% 定义符号变量
syms x omega;

assumeAlso(omega^13 == 1);


% 构造 f(x)=sum_{j=0}^{11} omega^(2^j)*x^j
f = sym(0);
for j = 0:11
    f = f + omega^(2^j) * x^j;
end

% 定义除式多项式
divisor = x^3 + 1;

% 计算 f(x) 除以 x^3-1 的余式
[Q, R] = quorem(f, divisor, x);

% 对结果进行化简并显示
R = simplify(R);
disp('f(x) 除以 x^3+1 的余式为：');
pretty(R)
