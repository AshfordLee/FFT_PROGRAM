syms x omega;

assumeAlso(omega^17==1);

f=sym(0);
for j=0:15
    f=f+omega^(3^j)*x^j;
end

divisor=x^4+1i;

[Q,R]=quorem(f,divisor,x);

R=simplify(R);

disp('f(x)除以x^4+1i的余式');
pretty(R);