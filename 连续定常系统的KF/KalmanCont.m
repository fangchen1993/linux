function KalmanCont
clc; clear;
T = 1;
N = 100 / T;

X = zeros(4, N); %真实位置，速度
X(:,1) = [-100, 2, 200, 20]; %起始位置

Z = zeros(2, N); %传感器对位置的观测
Z(:,1) = [X(1,1), X(3,1)]; %观测初始化

%连续运动状态方程
Fc = [0 1 0 0
      0 0 0 0
      0 0 0 1
      0 0 0 0]; 
G = [T 0 0 0; 0 1 0 0; 0 0 T 0; 0 0 0 1]; %噪声驱动矩阵
H = [1 0 0 0; 0 0 1 0]; %观测矩阵
R = 100*eye(2); %观测噪声均值
delta_w = (0.1)*eye(4); 

F = [1 T 0 0; 0 1 0 0; 0 0 1 T; 0 0 0 1];%噪声均方差
%滤波
Xkf = zeros(4,N);
Xkf(:,1) = X(:,1); %滤波初始化
P0 = diag([100 10 100 10]);

%求得离散状态转移矩阵
Fk = StateDiscrete(Fc, T);
%求得离散噪声驱动矩阵
Qk = QDiscrete(delta_w, G, Fc, T);

for i = 2:N 
    X(:,i) = F*X(:,i-1) + sqrtm(Qk)*randn(4,1); %真实轨迹
    Z(:,i) = H*X(:,i) + sqrtm(R)*randn(2,1); %对目标的观测值
    %滤波求得估计值
    [Xkf(:,i), P0] = KalmanF(Fk, Qk, R, G, P0, H, Xkf(:,i-1), Z(:,i-1));
end

figure
hold on; box on;
plot (X(1,:),X(3,:),'-k');
plot (Z(1,:),Z(2,:),'-b.');
plot (Xkf(1,:),Xkf(3,:),'-r+');
legend('real', 'watch', 'Wave filtering');

end