%对系统噪声进行离散化
%Q 
function Qk = QDiscrete(Q, G, F, DietaT)
Qb = G*Q*G'; 
Dt_N = DietaT;
NJ = 1;
Xis = Qb;

Qk = Qb*DietaT;
for k = 2 : 20
    Dt_N = Dt_N * DietaT;
    Xis = F*Xis + (F*Xis)';
    NJ = NJ * k;
    
    Qk = Qk + Xis * Dt_N / NJ;
end
end