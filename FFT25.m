clear;
clc;

omega=exp(2*pi*1i/25);

a=zeros(1,5);

for i=0:19
    exponent_mod=mod(2^i,25);
    sign_val=(-1)^floor(i/5);
    r=mod(i,5);
    a(r+1)=a(r+1)+sign_val*(omega^exponent_mod);
end

syms x
R = sym(0);
for r = 0:4
    R = R + a(r+1)*x^r;
end
