%对状态转移矩阵F进行离散化
%F为需要离散化的矩阵
%DiataA为离散的时间长度
function [Fk, F_DT, NJ] = StateDiscrete(F, DietaT)
[m,n]=size(F);
I = eye(m, n);
Fk = I;
F_DT = 1;
NJ = 1;

for k = 1 : 10
    F_DT = F_DT * F * DietaT;
    NJ = NJ * k;
    Fk = Fk + F_DT / NJ;
end
end 