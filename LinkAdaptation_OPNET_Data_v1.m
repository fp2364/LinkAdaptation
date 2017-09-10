% Link Adaptation using Cox proportional hazard model
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Observed Values %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Read in data
arrChannelData = csvread('TDMA_Data_CSV.csv');

% Get number of rows
szData = size(arrChannelData,1);

% This represents szData frames
arrObservationsOfHazardEvents = 1:szData;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Covariate Matrix - the measured values %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The covariate matrix. There are three columns.
% Column 1: Bit Error Rate (BER)
% Column 2: Received Power
% Column 3: Signal to Noise Ratio (SNR)
arrCovariates = arrChannelData(1:szData,2:4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% b is the matrix of the coefficient estimates  %%%%%%%%%%%%%
%%%%%%%%%%%%%%% H is the estimated baseline cumulative hazard %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% B will be a 3 by 1 matrix, having coefficient estimates
% for each of the covariates
%
% H will be a matrix, having the estimated baseline
% cumulative hazard for each observation
[b,logl,H,stats] = coxphfit(arrCovariates,arrObservationsOfHazardEvents);

% Based on the B and H values, decide which coding and modulation scheme
% should be used by the node
%
% My initial approach is to use the covariate (H value) with the highest 
% coefficient (B value) and recommend the coding and modulation scheme

% Get highest value and index of coefficient
[betaValue,betaIndex] = max(b);

% Based on betaIndex, identify which covariate (RSSI, PCR, SER, SINR)
% should be used
switch(betaIndex)
    case 1
        [modulation, coding] = GetModCodingFromBER(betaValue);
        disp('BER has most effect on hazard');
    case 2
        [modulation, coding] = GetModCodingFromRecdPower(betaValue);
        disp('Recd Power has most effect on hazard');
    case 3
        [modulation, coding] = GetModCodingFromSNR(betaValue);
        disp('SNR has most effect on hazard');
end

disp('Beta Values');
disp(b);

disp('Estimated baseline');
disp(H);

disp('Statistics');

disp('Covariance');
disp(stats.covb);

disp('Beta values');
disp(stats.beta);

disp('SE');
disp(stats.se);

disp('Z');
disp(stats.z);

disp('P');
disp(stats.p);

disp('Modulation');
disp(modulation);

disp('Coding');
disp(coding);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%   PLOT Hazard vs Time      %%%%%%%%%%%%%%%%%%%%%%%%%
figure;
stairs(H(:,1),H(:,2),'LineWidth',2)
xx = linspace(0,100);
xlabel('Time');
ylabel('Estimated Baseline Cumulative Hazard');
