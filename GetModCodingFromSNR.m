function [ m,c ] = GetModCodingFromSNR( p_SNR_Covariate )
% Return modulation and coding scheme based on SNR covariate
%   Detailed explanation goes here
    if (p_SNR_Covariate < -0.2)
        m = '256-QAM';
        c = '7/8';
    elseif (p_SNR_Covariate >= -0.2 && p_SNR_Covariate < -1.0)
        m = '256-QAM';
        c = '3/4';
    elseif (p_SNR_Covariate >= -1.0 && p_SNR_Covariate < 0.0)
        m = '256-QAM';
        c = '1/2';
    elseif (p_SNR_Covariate >= 0.0 && p_SNR_Covariate < 0.5)
        m = '256-QAM';
        c = '1/4';
    elseif (p_SNR_Covariate >= 0.5 && p_SNR_Covariate < 1.0)
        m = '64-QAM';
        c = '7/8';
    elseif (p_SNR_Covariate >= 1.5 && p_SNR_Covariate < 2.0)
        m = '64-QAM';
        c = '3/4';
    elseif (p_SNR_Covariate >= 2.5 && p_SNR_Covariate < 3.0)
        m = '16-QAM';
        c = '1/2';
    elseif (p_SNR_Covariate >= 3.0 && p_SNR_Covariate < 3.5)
        m = '16-QAM';
        c = '1/4';
    elseif (p_SNR_Covariate >= 4.0 && p_SNR_Covariate < 4.5)
        m = 'QPSK';
        c = '1/2';
    elseif (p_SNR_Covariate >= 4.5 && p_SNR_Covariate < 5.0)
        m = 'QPSK';
        c = '1/4';
    else
        m = 'BPSK';
        c = '1/2';
    end
end

