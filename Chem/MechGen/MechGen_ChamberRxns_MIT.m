% MIT Chamber dependent reactions, without adjustable radical source
%
% 20241119 Added by Jia

YHONO = 0.5;         % Yield
k_NO2Loss = 0e-5;    % min-1
k_O3Loss = 2e-5;     % min-1
k_N2O5Loss = 0;      % min-1, turn off

SpeciesToAdd = {'C6F6','HCHOFlow','HONOFlow','H2O2Flow'};

AddSpecies

% Tracer for dilution
i=i+1;
Rnames{i} = 'C6F6 = C6F6';
k(:,i) = 0; 
Gstr{i,   1}='C6F6';
fC6F6(i)=fC6F6(i)-1.0;
fC6F6(i)=fC6F6(i)+1.0;

% HONO Off-Gasing
% Best fits to CO-air experiments .
i=i+1;
Rnames{i} = 'HONOFlow + HV = HONO'; 
k(:,i) = (JNO2_06);
Gstr{i,1} = 'HONOFlow';
fHONOFlow(i)=fHONOFlow(i)-1.0;
fHONO(i)=fHONO(i)+1.0;

% Unimolecular loss rate of NO2 to the walls;
% Based on results of NO2 decays carried out in this chamber.
% i=i+1;
% Rnames{i} = 'NO2 = YHONO * HONO'; 
% k(:,i) = k_NO2Loss;            
% Gstr{i,1} = 'NO2';
% fNO2(i)=fNO2(i)-1;
% fHONO(i)=fHONO(i)+YHONO;

% Unimolecular loss rate of O3 to the walls;
% Based on results of O3 decays carried out in this chamber.
i=i+1;
Rnames{i} = 'O3 = '; 
k(:,i) = k_O3Loss;           
Gstr{i,1} = 'O3';
fO3(i)=fO3(i)-1;

% % H2O2 continually enter the chamber
% i=i+1;
% Rnames{i} = 'H2O2Flow = H2O2'; 
% k(:,i) = 0;
% Gstr{i,1} = 'H2O2Flow';
% fH2O2Flow(i)=fH2O2Flow(i)-1.0; 
% fHO2H(i)=fHO2H(i)+1.0;
% 
% % ----------------------
% % Turn off
% % ----------------------
% % HCHO Off-Gasing
% % Best fits to CO-air xperiments .
% i=i+1;
% Rnames{i} = 'HCHOFlow + HV = HCHO'; 
% k(:,i) = (JNO2_06);          
% Gstr{i,1} = 'HCHOFlow';
% fHCHOFlow(i)=fHCHOFlow(i)-1.0;
% fHCHO(i)=fHCHO(i)+1.0;
% 
% % Humidity independent portion of the wall loss of N2O5;
% % Based on results of N2O5 decays carried out in this chamber.
% i=i+1;
% Rnames{i} = 'N2O5 = '; 
% k(:,i) = k_N2O5Loss;           
% Gstr{i,1} = 'N2O5';
% fN2O5(i)=fN2O5(i)-1;