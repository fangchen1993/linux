%计算每一步的滤波算法
%F 状态转移矩阵
%Q 过程噪声Q
%R 观测噪声R
%G 系统干扰驱动矩阵G
%P0 上一步计算得到的协方差
%H 观测矩阵
%exV 上一步的估计实测值
%exZ 上一步的观测值
function [ex, P0] = KalmanF(F, Q, R, G, P0, H, exV, exZ)
Xn = F*exV; %预测值
P1= F*P0*F' + G*Q*G'; %预测误差协方差
%P1= F*P0*F' + Q; %预测误差协方差
K = P1*H'/(H*P1*H'+R); %增益
ex = Xn + K*(exZ-H*Xn); %状态更新
P0 = (eye(size(P0)) - K*H)*P1; %滤波误差协方差更新
end