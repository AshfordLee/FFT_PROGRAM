%% 清除环境
clear;
clc;

%% 定义符号变量
syms x omega;
% 注意：omega 作为参数，这里没有对其作单位根性质的假设，
% 如果需要可以添加 assume(omega^25 == 1);

%% 定义多项式 val(x)
% val(x) = omega + x*(omega^23 - omega^14 - omega^11 + omega^2)
%        - x^2*(omega^22 - omega^21 - omega^4 + omega^3)
%        - x^3*(omega^19 - omega^17 - omega^8 + omega^6)
%        + x^4*(omega^16 - omega^13 - omega^12 + omega^9)
%        - omega^7 - omega^18 + omega^24
val_poly = omega ...
    + x*(omega^23 - omega^14 - omega^11 + omega^2) ...
    - x^2*(omega^22 - omega^21 - omega^4 + omega^3) ...
    - x^3*(omega^19 - omega^17 - omega^8 + omega^6) ...
    + x^4*(omega^16 - omega^13 - omega^12 + omega^9) ...
    - omega^7 - omega^18 + omega^24;

%% 构造 x^5+1 的伴随矩阵 C
% 对于多项式 x^5+1，其伴随矩阵可以定义为：
%    [ 0   1   0   0   0 ]
%    [ 0   0   1   0   0 ]
%    [ 0   0   0   1   0 ]
%    [ 0   0   0   0   1 ]
%    [-1   0   0   0   0 ]
C = sym([0 1 0 0 0; 
         0 0 1 0 0; 
         0 0 0 1 0; 
         0 0 0 0 1; 
        -1 0 0 0 0]);

%% 计算 val(C)
% 由于 val(x) 为 4 次多项式（不含 x^5 以上项），我们可按系数展开：
% 常数项：   omega - omega^7 - omega^18 + omega^24
% x 项系数： omega^23 - omega^14 - omega^11 + omega^2
% x^2 项系数: - (omega^22 - omega^21 - omega^4 + omega^3)
% x^3 项系数: - (omega^19 - omega^17 - omega^8 + omega^6)
% x^4 项系数:   omega^16 - omega^13 - omega^12 + omega^9
I = sym(eye(5));  % 5x5单位矩阵

valC = (omega - omega^7 - omega^18 + omega^24)*I ...
     + (omega^23 - omega^14 - omega^11 + omega^2)*C ...
     - (omega^22 - omega^21 - omega^4 + omega^3)*C^2 ...
     - (omega^19 - omega^17 - omega^8 + omega^6)*C^3 ...
     + (omega^16 - omega^13 - omega^12 + omega^9)*C^4;

%% 显示结果
disp('val(C) = ');
pretty(valC)
