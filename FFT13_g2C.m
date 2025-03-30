%% 使用符号变量定义 omega 和 x
syms omega x

% 定义化简后的系数 A0, A1, A2
A0 = omega - omega^8 + omega^12 - omega^5;
A1 = -omega^10 + omega^11 - omega^3 + omega^2;
A2 = -omega^7 + omega^9 - omega^6 + omega^4;

%% 定义多项式 f(x) = A0 + A1*x + A2*x^2
% 此处仅作参考，多项式本身已化简为上述形式

%% 定义 x^3+1 的伴随矩阵 C
C = sym([0 0 -1; 1 0 0; 0 1 0]);

%% 计算 C^2
C2 = C^2;

%% 计算 val(C) = A0*I + A1*C + A2*C^2
valC = A0*eye(3) + A1*C + A2*C2;

%% 展示结果（保留符号 omega）
disp('val(C) = ');
pretty(valC)

%% 如需生成 LaTeX 格式输出，可取消下面一行注释
% latex(valC)
