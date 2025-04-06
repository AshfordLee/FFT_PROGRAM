%% 清除环境
clear;
clc;

%% 定义符号变量
syms x omega;
% 如有需要，可以添加单位根假设，例如：assume(omega^17 == 1);

%% 定义余式 R(x)
% R(x) = (omega - omega^13 + omega^16 - omega^4)
%      + x*(-omega^12 + omega^14 - omega^5 + omega^3)
%      + x^2*(-omega^2 + omega^8 - omega^15 + omega^9)
%      + x^3*(-omega^6 + omega^7 - omega^11 + omega^10)
R = (omega - omega^13 + omega^16 - omega^4) + ...
    x*(-omega^12 + omega^14 - omega^5 + omega^3) + ...
    x^2*(-omega^2 + omega^8 - omega^15 + omega^9) + ...
    x^3*(-omega^6 + omega^7 - omega^11 + omega^10);

%% 构造 x^4+1 的伴随矩阵 C
% 对于多项式 p(x)=x^4+1，其伴随矩阵可定义为：
%    [ 0   0   0  -1 ]
%    [ 1   0   0   0 ]
%    [ 0   1   0   0 ]
%    [ 0   0   1   0 ]
C = sym([0 0 0 -1; 
         1 0 0  0; 
         0 1 0  0; 
         0 0 1  0]);

%% 计算 R(C)
% 将 R(x) 中的各项依次乘以 I, C, C^2, C^3（注意 R(x) 为 3 次多项式）
I = sym(eye(4));  % 4x4 单位矩阵
RC = (omega - omega^13 + omega^16 - omega^4)*I + ...
     (-omega^12 + omega^14 - omega^5 + omega^3)*C + ...
     (-omega^2 + omega^8 - omega^15 + omega^9)*C^2 + ...
     (-omega^6 + omega^7 - omega^11 + omega^10)*C^3;

%% 显示结果
disp('R(C) = ');
pretty(RC)
