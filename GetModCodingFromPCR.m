function [ m,c ] = GetModCodingFromPCR(p_PCR_Covariate)
% Return modulation and coding scheme based on PCR covariate
%   Detailed explanation goes here
    if (p_PCR_Covariate < -0.2)
        m = '256-QAM';
        c = '7/8';
    elseif (p_PCR_Covariate >= -0.2 && p_PCR_Covariate < -1.0)
        m = '256-QAM';
        c = '3/4';
    elseif (p_PCR_Covariate >= -1.0 && p_PCR_Covariate < 0.0)
        m = '256-QAM';
        c = '1/2';
    elseif (p_PCR_Covariate >= 0.0 && p_PCR_Covariate < 0.5)
        m = '256-QAM';
        c = '1/4';
    elseif (p_PCR_Covariate >= 0.5 && p_PCR_Covariate < 1.0)
        m = '64-QAM';
        c = '7/8';
    elseif (p_PCR_Covariate >= 1.5 && p_PCR_Covariate < 2.0)
        m = '64-QAM';
        c = '3/4';
    elseif (p_PCR_Covariate >= 2.5 && p_PCR_Covariate < 3.0)
        m = '16-QAM';
        c = '1/2';
    elseif (p_PCR_Covariate >= 3.0 && p_PCR_Covariate < 3.5)
        m = '16-QAM';
        c = '1/4';
    elseif (p_PCR_Covariate >= 4.0 && p_PCR_Covariate < 4.5)
        m = 'QPSK';
        c = '1/2';
    elseif (p_PCR_Covariate >= 4.5 && p_PCR_Covariate < 5.0)
        m = 'QPSK';
        c = '1/4';
    else
        m = 'BPSK';
        c = '1/2';
    end


end

