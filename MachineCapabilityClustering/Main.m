%% MD clustering algorithm
% 
%%
clear all; clc
tic;                              % Start stopwatch timer

% % 生成实例
% P_n = 100;
% M_n = 50;
% [T,Jm,M] = GenInstance(P_n,M_n,1);   

% % 样本实例1 10*10
% T=[29 78  9 36 49 11 62 56 44 21;
%    43 90 75 11 69 28 46 46 72 30;
%    91 85 39 74 90 10 12 89 45 33;
%    81 95 71 99  9 52 85 98 22 43;
%    14  6 22 61 26 69 21 49 72 53;
%    84  2 52 95 48 72 47 65  6 25;
%    46 37 61 13 32 21 32 89 30 55;
%    31 86 46 74 32 88 19 48 36 79;
%    76 69 76 51 85 11 40 89 26 74;
%    85 13 61  7 64 76 47 52 90 45];
% 
% Jm=[0 1 2 3 4 5 6 7 8 9;
%     0 2 4 9 3 1 6 5 7 8;
%     1 0 3 2 8 5 7 6 9 4;
%     1 2 0 4 6 8 7 3 9 5;
%     2 0 1 5 3 4 8 7 9 6;
%     2 1 5 3 8 9 0 6 4 7;
%     1 0 3 2 6 5 9 8 7 4;
%     2 0 1 5 4 6 8 9 7 3;
%     0 1 3 5 2 9 6 7 4 8;
%     1 0 2 6 8 9 5 3 4 7];
% 
% Jm=Jm+1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 机器加工能力聚类
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = path;
path(p, genpath(pwd));            % add the current folder to the search path

load('T.mat', 'T');
load('M.mat', 'M');
centerNum = 3;
[center,U,obj_fcn] = fcm(M,centerNum);

% Find the data points with highest grade of membership in each cluster
maxU = max(U);
Cluster = cell(centerNum);
for i = 1 : centerNum
    indTmp = find(U(i,:) == maxU);
    Cluster(i) = {indTmp};
end

path(p)                           % restore the previous search path   

toc                               % Read elapsed time from stopwatch                              