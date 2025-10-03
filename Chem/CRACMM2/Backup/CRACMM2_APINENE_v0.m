% Only a-pinene reaction
% 20240501 created by Jia

SpeciesToAdd = {'N_API','N_APIP1','N_APIP2','N_APINP1','N_APINP2',...
                  'N_PINAL','N_PINALP','N_TRPN'};
AddSpecies


% -------------------------------------------------------------------------
% 103, <R087>, New
i=i+1;
Rnames{i} = 'API + HO = 0.97500*APIP1 +  0.02500*APIP2 ';
k(:,i) = (  1.2100E-11.*exp(  4.4000E+02./T) ); 
Gstr{i,   1}='N_API';Gstr{i,   2}='HO';
fN_API(i)=fN_API(i)-1.0;fHO(i)=fHO(i)-1.0;
fN_APIP1(i)=fN_APIP1(i)+0.9750;fN_APIP2(i)=fN_APIP2(i)+0.0250;

% 194, <R189>, New
i=i+1;
Rnames{i} = 'APIP1 + NO = 0.23*TRPN + 0.77*HO2 + 0.77*NO2 + 0.3*PINAL + 0.27*ALD + 0.09*ACT + 0.09*LIMAL + 0.21*HCHO + 0.11*OPB'; 
k(:,i) = (  2.7000E-12.*exp(  3.6000E+02./T) ); 
Gstr{i,   1}='N_APIP1';Gstr{i,   2}='NO';
fN_APIP1(i)=fN_APIP1(i)-1.0;fNO(i)=fNO(i)-1.0;
fN_TRPN(i)=fN_TRPN(i)+0.23;fHO2(i)=fHO2(i)+0.77;fNO2(i)=fNO2(i)+0.77;fN_PINAL(i)=fN_PINAL(i)+0.3;fALD(i)=fALD(i)+0.27;fACT(i)=fACT(i)+0.09;fLIMAL(i)=fLIMAL(i)+0.09;fHCHO(i)=fHCHO(i)+0.21;fOPB(i)=fOPB(i)+0.11;
fKET(i)=fKET(i);fDELTA_C(i)=fDELTA_C(i);

% 351, <R339>, New
i=i+1;
Rnames{i} = 'APIP1 + NO3 = NO2 + HO2 + 0.39*PINAL + 0.35*ALD + 0.12*ACT + 0.12*LIMAL + 0.27*HCHO + 0.14*OPB';
k(:,i) = (  2.3000E-12 ); 
Gstr{i,   1}='N_APIP1';Gstr{i,   2}='NO3';
fN_APIP1(i)=fN_APIP1(i)-1.0;fNO3(i)=fNO3(i)-1.0;
fNO2(i)=fNO2(i)+1.00;fHO2(i)=fHO2(i)+1.00;fN_PINAL(i)=fN_PINAL(i)+0.39;fALD(i)=fALD(i)+0.35;fACT(i)=fACT(i)+0.12;fLIMAL(i)=fLIMAL(i)+0.12;fHCHO(i)=fHCHO(i)+0.27;fOPB(i)=fOPB(i)+0.14;
fKET(i)=fKET(i);fDELTA_C(i)=fDELTA_C(i);

% 236, <R229>, New
i=i+1;
Rnames{i} = 'APIP1 + HO2 = 0.06*ACT + 0.06*LIMAL + 0.08*HCHO + 0.65*OPB + 0.48*HO2 + 0.29*PINAL + 0.35*HO'; 
k(:,i) = (  2.6000E-13.*exp(  1.3000E+03./T) ); 
Gstr{i,   1}='N_APIP1';Gstr{i,   2}='HO2';
fN_APIP1(i)=fN_APIP1(i)-1.0;fHO2(i)=fHO2(i)-1.0;
fACT(i)=fACT(i)+0.06;fLIMAL(i)=fLIMAL(i)+0.06;fHCHO(i)=fHCHO(i)+0.08;fOPB(i)=fOPB(i)+0.65;fHO2(i)=fHO2(i)+0.48;fN_PINAL(i)=fN_PINAL(i)+0.29;fHO(i)=fHO(i)+0.35;
fKET(i)=fKET(i);fDELTA_C(i)=fDELTA_C(i);

% 275, <R265>, New
i=i+1;
Rnames{i} = 'APIP1 + MO2 = 0.83*HCHO + 0.14*LIMAL + 0.42*PINAL + 0.2*ALD + 0.13*OPB + 0.17*MOH + 0.11*KET + 0.06*ACT + 1.16*HO2';
k(:,i) = (  2.0000E-12 ); 
Gstr{i,   1}='N_APIP1';Gstr{i,   2}='MO2';
fN_APIP1(i)=fN_APIP1(i)-1.0;fMO2(i)=fMO2(i)-1.0;
fHCHO(i)=fHCHO(i)+0.83;fLIMAL(i)=fLIMAL(i)+0.14;fN_PINAL(i)=fN_PINAL(i)+0.42;fALD(i)=fALD(i)+0.2;fOPB(i)=fOPB(i)+0.13;fMOH(i)=fMOH(i)+0.17;fKET(i)=fKET(i)+0.11;fACT(i)=fACT(i)+0.06;fHO2(i)=fHO2(i)+1.16;
fDELTA_C(i)=fDELTA_C(i);

% 312, <R301>, New
i=i+1;
Rnames{i} = 'APIP1 + ACO3 = 0.39*PINAL + 0.35*ALD + 0.14*OPB + 0.12*ACT + 0.12*LIMAL + 0.27*HCHO + HO2 + MO2';
k(:,i) = (  2.0000E-12.*exp(  5.0000E+02./T) ); 
Gstr{i,   1}='N_APIP1';Gstr{i,   2}='ACO3';
fN_APIP1(i)=fN_APIP1(i)-1.0;fACO3(i)=fACO3(i)-1.0;
fN_PINAL(i)=fN_PINAL(i)+0.39;fALD(i)=fALD(i)+0.35;fOPB(i)=fOPB(i)+0.14;fACT(i)=fACT(i)+0.12;fLIMAL(i)=fLIMAL(i)+0.12;fHCHO(i)=fHCHO(i)+0.27;fHO2(i)=fHO2(i)+1.00;fMO2(i)=fMO2(i)+1.00;
fKET(i)=fKET(i);fDELTA_C(i)=fDELTA_C(i);

% 195, <TRP13>
i=i+1;
Rnames{i} = 'APIP2 + NO = 0.82000*HO +  0.82000*NO2 + HOM  + 0.1800*DELTA_N';
k(:,i) = (  4.0000E-12 ); 
Gstr{i,   1}='N_APIP2';Gstr{i,   2}='NO';
fN_APIP2(i)=fN_APIP2(i)-1.0;fNO(i)=fNO(i)-1.0;
fHO(i)=fHO(i)+  0.8200;fNO2(i)=fNO2(i)+  0.8200;fHOM(i)=fHOM(i)+  1.0000;fDELTA_N(i)=fDELTA_N(i)+  0.1800;

% 237, <TRP21>
i=i+1;
Rnames{i} = 'APIP2 + HO2 = HOM ';
k(:,i) = (  1.5000E-11 ); 
Gstr{i,   1}='N_APIP2';Gstr{i,   2}='HO2';
fN_APIP2(i)=fN_APIP2(i)-1.0;fHO2(i)=fHO2(i)-1.0;
fHOM(i)=fHOM(i)+1.0000;

% 276, <TRP29>
i=i+1;
Rnames{i} = 'APIP2 + MO2 = HO2 +  0.75000*HCHO +  0.25000*MOH + HOM ';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='N_APIP2';Gstr{i,   2}='MO2';
fN_APIP2(i)=fN_APIP2(i)-1.0;fMO2(i)=fMO2(i)-1.0;
fHO2(i)=fHO2(i)+  1.0000;fHCHO(i)=fHCHO(i)+  0.7500;fMOH(i)=fMOH(i)+  0.2500;fHOM(i)=fHOM(i)+  1.0000;

% 313, <TRP35>
i=i+1;
Rnames{i} = 'APIP2 + ACO3 = 0.50000*HO +  0.50000*MO2 +  0.50000*ORA2 + HOM  + 0.5000*DELTA_C';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='N_APIP2';Gstr{i,   2}='ACO3';
fN_APIP2(i)=fN_APIP2(i)-1.0;fACO3(i)=fACO3(i)-1.0;
fHO(i)=fHO(i)+  0.5000;fMO2(i)=fMO2(i)+  0.5000;fORA2(i)=fORA2(i)+  0.5000;fHOM(i)=fHOM(i)+  1.0000;fDELTA_C(i)=fDELTA_C(i)+  0.5000;

% -------------------------------------------------------------------------
% 161, <R146>, New
i=i+1;
Rnames{i} = 'API + NO3 = 0.97500*APINP1 + 0.02500*APINP2';
k(:,i) = (  1.1900E-12.*exp(  4.9000E+02./T) ); 
Gstr{i,   1}='N_API';Gstr{i,   2}='NO3';
fN_API(i)=fN_API(i)-1.0;fNO3(i)=fNO3(i)-1.0;
fN_APINP1(i)=fN_APINP1(i)+0.9750;fN_APINP2(i)=fN_APINP2(i)+0.0250;

% 196, <TRP14>, New
i=i+1;
Rnames{i} = 'APINP1 + NO = 1.86*NO2 + 0.07*TRPN + 0.07*ONIT + 0.93*PINAL';
k(:,i) = (  2.7000E-12.*exp(  3.6000E+02./T) ); 
Gstr{i,   1}='N_APINP1';Gstr{i,   2}='NO';
fN_APINP1(i)=fN_APINP1(i)-1.0;fNO(i)=fNO(i)-1.0;
fNO2(i)=fNO2(i)+1.86;fN_TRPN(i)=fN_TRPN(i)+0.07;fONIT(i)=fONIT(i)+0.07;fN_PINAL(i)=fN_PINAL(i)+0.93;
fALD(i)=fALD(i);fKET(i)=fKET(i);fHCHO(i)=fHCHO(i);fHO2(i)=fHO2(i);fDELTA_C(i)=fDELTA_C(i);

% 353, <TRP53>, New
i=i+1;
Rnames{i} = 'APINP1 + NO3 = 2*NO2 + PINAL';
k(:,i) = (  2.3000E-12 ); 
Gstr{i,   1}='N_APINP1';Gstr{i,   2}='NO3';
fN_APINP1(i)=fN_APINP1(i)-1.0;fNO3(i)=fNO3(i)-1.0;
fNO2(i)=fNO2(i)+2.0;fN_PINAL(i)=fN_PINAL(i)+1.0;
fN_TRPN(i)=fN_TRPN(i);fALD(i)=fALD(i);fKET(i)=fKET(i);fHCHO(i)=fHCHO(i);fHO2(i)=fHO2(i);fDELTA_C(i)=fDELTA_C(i);

% 238, <TRP22>, New
i=i+1;
Rnames{i} = 'APINP1 + HO2 = 0.3*TRPN + 0.7*PINAL + 0.7*NO2 + 0.7*HO';
k(:,i) = (  2.7100E-13.*exp(  1.3000E+03./T) ); 
Gstr{i,   1}='N_APINP1';Gstr{i,   2}='HO2';
fN_APINP1(i)=fN_APINP1(i)-1.0;fHO2(i)=fHO2(i)-1.0;
fN_TRPN(i)=fN_TRPN(i)+0.3;fN_PINAL(i)=fN_PINAL(i)+0.7;fNO2(i)=fNO2(i)+0.7;fHO(i)=fHO(i)+0.7;
fALD(i)=fALD(i);fKET(i)=fKET(i);fHCHO(i)=fHCHO(i);fDELTA_C(i)=fDELTA_C(i);

% 277, <TRP30>, New
i=i+1;
Rnames{i} = 'APINP1 + MO2 = 0.18*TRPN + 0.95*HCHO + 0.05*MOH + 0.82*HO2 + 0.82*NO2 + 0.82*PINAL';
k(:,i) = (  2.0000E-12 ); 
Gstr{i,   1}='N_APINP1';Gstr{i,   2}='MO2';
fN_APINP1(i)=fN_APINP1(i)-1.0;fMO2(i)=fMO2(i)-1.0;
fN_TRPN(i)=fN_TRPN(i)+0.18;fHCHO(i)=fHCHO(i)+0.95;fMOH(i)=fMOH(i)+0.05;fHO2(i)=fHO2(i)+0.82;fNO2(i)=fNO2(i)+0.82;fN_PINAL(i)=fN_PINAL(i)+0.82;
fKET(i)=fKET(i);fALD(i)=fALD(i);fDELTA_C(i)=fDELTA_C(i);

% 314, <TRP36>, New
i=i+1;
Rnames{i} = 'APINP1 + ACO3 = NO2 + PINAL + MO2';
k(:,i) = (  2.0000E-12.*exp(  5.0000E+02./T) ); 
Gstr{i,   1}='N_APINP1';Gstr{i,   2}='ACO3';
fN_APINP1(i)=fN_APINP1(i)-1.0;fACO3(i)=fACO3(i)-1.0;
fNO2(i)=fNO2(i)+1.0;fN_PINAL(i)=fN_PINAL(i)+1.0;fMO2(i)=fMO2(i)+1.0;
fN_TRPN(i)=fN_TRPN(i);fALD(i)=fALD(i);fKET(i)=fKET(i);fHCHO(i)=fHCHO(i);fHO2(i)=fHO2(i);fDELTA_C(i)=fDELTA_C(i);

% 197, <TRP15>
i=i+1;
Rnames{i} = 'APINP2 + NO = 0.82000*NO2 +  0.82000*HO + HOM  + 1.1800*DELTA_N';
k(:,i) = (  4.0000E-12 ); 
Gstr{i,   1}='N_APINP2';Gstr{i,   2}='NO';
fN_APINP2(i)=fN_APINP2(i)-1.0;fNO(i)=fNO(i)-1.0;
fNO2(i)=fNO2(i)+  0.8200;fHO(i)=fHO(i)+  0.8200;fHOM(i)=fHOM(i)+  1.0000;fDELTA_N(i)=fDELTA_N(i)+  1.1800;

% 239, <TRP23>
i=i+1;
Rnames{i} = 'APINP2 + HO2 = HOM  + 1.0000*DELTA_N';
k(:,i) = (  1.5000E-11 ); 
Gstr{i,   1}='N_APINP2';Gstr{i,   2}='HO2';
fN_APINP2(i)=fN_APINP2(i)-1.0;fHO2(i)=fHO2(i)-1.0;
fHOM(i)=fHOM(i)+  1.0000;fDELTA_N(i)=fDELTA_N(i)+  1.0000;

% 244, <TRP27>
i=i+1;
Rnames{i} = 'PINALP + HO2 = 0.75000*OPB +  0.25000*HO +  0.25000*HOM ';
k(:,i) = (  2.7100E-13.*exp(  1.3000E+03./T) ); 
Gstr{i,   1}='N_PINALP';Gstr{i,   2}='HO2';
fN_PINALP(i)=fN_PINALP(i)-1.0;fHO2(i)=fHO2(i)-1.0;
fOPB(i)=fOPB(i)+  0.7500;fHO(i)=fHO(i)+  0.2500;fHOM(i)=fHOM(i)+  0.2500;

% 278, <TRP31>
i=i+1;
Rnames{i} = 'APINP2 + MO2 = 0.75000*HO2 +  0.75000*NO2 +  0.25000*MOH +  0.75000*HCHO + HOM  + 0.2500*DELTA_N';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='N_APINP2';Gstr{i,   2}='MO2';
fN_APINP2(i)=fN_APINP2(i)-1.0;fMO2(i)=fMO2(i)-1.0;
fHO2(i)=fHO2(i)+  0.7500;fNO2(i)=fNO2(i)+  0.7500;fMOH(i)=fMOH(i)+  0.2500;fHCHO(i)=fHCHO(i)+  0.7500;fHOM(i)=fHOM(i)+  1.0000;fDELTA_N(i)=fDELTA_N(i)+  0.2500;

% 315, <TRP37>
i=i+1;
Rnames{i}= 'APINP2 + ACO3 = 0.50000*NO2 +  0.50000*MO2 +  0.50000*ORA2 + HOM  + 0.5000*DELTA_N + 0.5000*DELTA_C';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='N_APINP2';Gstr{i,   2}='ACO3';
fN_APINP2(i)=fN_APINP2(i)-1.0;fACO3(i)=fACO3(i)-1.0;
fNO2(i)=fNO2(i)+  0.5000;fMO2(i)=fMO2(i)+  0.5000;fORA2(i)=fORA2(i)+  0.5000;fHOM(i)=fHOM(i)+  1.0000;fDELTA_N(i)=fDELTA_N(i)+  0.5000;fDELTA_C(i)=fDELTA_C(i)+  0.5000;

%--------------------------------------------------------------------------
% 378, <TRP41>
i=i+1;
Rnames{i} = 'APIP2 + APIP1 = 0.96000*HOM +  0.48000*ROH +  0.48000*N_PINAL +  0.48000*HO +  0.48000*HO2 +  0.04000*ELHOM  + 3.3600*DELTA_C';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='N_APIP2';Gstr{i,   2}='N_APIP1';
fN_APIP2(i)=fN_APIP2(i)-1.0;fN_APIP1(i)=fN_APIP1(i)-1.0;
fHOM(i)=fHOM(i)+  0.9600;fROH(i)=fROH(i)+  0.4800;fN_PINAL(i)=fN_PINAL(i)+  0.4800;fHO(i)=fHO(i)+  0.4800;fHO2(i)=fHO2(i)+  0.4800;fELHOM(i)=fELHOM(i)+  0.0400;fDELTA_C(i)=fDELTA_C(i)+  3.3600;

% 384, <TRP47>
i=i+1;
Rnames{i} = 'APINP2 + APIP1 = 0.96000*HOM +  0.48000*ROH +  0.48000*N_PINAL +  0.48000*NO2 +  0.48000*HO2 +  0.04000*ELHOM  + 0.5200*DELTA_N + 3.3600*DELTA_C';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='N_APINP2';Gstr{i,   2}='N_APIP1';
fN_APINP2(i)=fN_APINP2(i)-1.0;fN_APIP1(i)=fN_APIP1(i)-1.0;
fHOM(i)=fHOM(i)+  0.9600;fROH(i)=fROH(i)+  0.4800;fN_PINAL(i)=fN_PINAL(i)+  0.4800;fNO2(i)=fNO2(i)+  0.4800;fHO2(i)=fHO2(i)+  0.4800;fELHOM(i)=fELHOM(i)+  0.0400;fDELTA_N(i)=fDELTA_N(i)+  0.5200;fDELTA_C(i)=fDELTA_C(i)+  3.3600;

% 379, <TRP42>
i=i+1;
Rnames{i} = 'APIP2 + LIMP1 = 0.96000*HOM +  0.48000*ROH +  0.48000*LIMAL +  0.48000*HO +  0.48000*HO2 +  0.04000*ELHOM  + 3.3600*DELTA_C';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='N_APIP2';Gstr{i,   2}='LIMP1';
fN_APIP2(i)=fN_APIP2(i)-1.0;fLIMP1(i)=fLIMP1(i)-1.0;
fHOM(i)=fHOM(i)+  0.9600;fROH(i)=fROH(i)+  0.4800;fLIMAL(i)=fLIMAL(i)+  0.4800;fHO(i)=fHO(i)+  0.4800;fHO2(i)=fHO2(i)+  0.4800;fELHOM(i)=fELHOM(i)+  0.0400;fDELTA_C(i)=fDELTA_C(i)+  3.3600;

% 380, <TRP43>
i=i+1;
Rnames{i} = 'APIP2 + ISOP = 0.96000*HOM +  0.48000*ROH +  0.48000*HCHO +  0.48000*MVK +  0.48000*HO +  0.48000*HO2 +  0.04000*ELHOM  + 0.7600*DELTA_C';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='N_APIP2';Gstr{i,   2}='ISOP';
fN_APIP2(i)=fN_APIP2(i)-1.0;fISOP(i)=fISOP(i)-1.0;
fHOM(i)=fHOM(i)+  0.9600;fROH(i)=fROH(i)+  0.4800;fHCHO(i)=fHCHO(i)+  0.4800;fMVK(i)=fMVK(i)+  0.4800;fHO(i)=fHO(i)+  0.4800;fHO2(i)=fHO2(i)+  0.4800;fELHOM(i)=fELHOM(i)+  0.0400;fDELTA_C(i)=fDELTA_C(i)+  0.7600;

% 381, <TRP44>
i=i+1;
Rnames{i} = 'LIMP2 + APIP1 = 0.96000*HOM +  0.48000*ROH +  0.48000*N_PINAL +  0.48000*HO +  0.48000*HO2 +  0.04000*ELHOM  + 3.3600*DELTA_C';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='LIMP2';Gstr{i,   2}='N_APIP1';
fLIMP2(i)=fLIMP2(i)-1.0;fN_APIP1(i)=fN_APIP1(i)-1.0;
fHOM(i)=fHOM(i)+  0.9600;fROH(i)=fROH(i)+  0.4800;fN_PINAL(i)=fN_PINAL(i)+  0.4800;fHO(i)=fHO(i)+  0.4800;fHO2(i)=fHO2(i)+  0.4800;fELHOM(i)=fELHOM(i)+  0.0400;fDELTA_C(i)=fDELTA_C(i)+  3.3600;

% 385, <TRP48>
i=i+1;
Rnames{i} = 'APINP2 + LIMP1 = 0.96000*HOM +  0.48000*ROH +  0.48000*LIMAL +  0.48000*NO2 +  0.48000*HO2 +  0.04000*ELHOM  + 0.5200*DELTA_N + 3.3600*DELTA_C';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='N_APINP2';Gstr{i,   2}='LIMP1';
fN_APINP2(i)=fN_APINP2(i)-1.0;fLIMP1(i)=fLIMP1(i)-1.0;
fHOM(i)=fHOM(i)+  0.9600;fROH(i)=fROH(i)+  0.4800;fLIMAL(i)=fLIMAL(i)+  0.4800;fNO2(i)=fNO2(i)+  0.4800;fHO2(i)=fHO2(i)+  0.4800;fELHOM(i)=fELHOM(i)+  0.0400;fDELTA_N(i)=fDELTA_N(i)+  0.5200;fDELTA_C(i)=fDELTA_C(i)+  3.3600;

% 386, <TRP49>
i=i+1;
Rnames{i} = 'APINP2 + ISOP = 0.96000*HOM +  0.48000*ROH +  0.48000*HCHO +  0.48000*MVK +  0.48000*NO2 +  0.48000*HO2 +  0.04000*ELHOM  + 0.5200*DELTA_N + 0.7600*DELTA_C';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='N_APINP2';Gstr{i,   2}='ISOP';
fN_APINP2(i)=fN_APINP2(i)-1.0;fISOP(i)=fISOP(i)-1.0;
fHOM(i)=fHOM(i)+  0.9600;fROH(i)=fROH(i)+  0.4800;fHCHO(i)=fHCHO(i)+  0.4800;fMVK(i)=fMVK(i)+  0.4800;fNO2(i)=fNO2(i)+  0.4800;fHO2(i)=fHO2(i)+  0.4800;fELHOM(i)=fELHOM(i)+  0.0400;fDELTA_N(i)=fDELTA_N(i)+  0.5200;fDELTA_C(i)=fDELTA_C(i)+  0.7600;

% 387, <TRP50>
i=i+1;
Rnames{i} = 'LIMNP2 + APIP1 = 0.96000*HOM +  0.48000*ROH +  0.48000*N_PINAL +  0.48000*NO2 +  0.48000*HO2 +  0.04000*ELHOM  + 0.5200*DELTA_N + 3.3600*DELTA_C';
k(:,i) = (  1.0000E-10 ); 
Gstr{i,   1}='LIMNP2';Gstr{i,   2}='N_APIP1';
fLIMNP2(i)=fLIMNP2(i)-1.0;fN_APIP1(i)=fN_APIP1(i)-1.0;
fHOM(i)=fHOM(i)+  0.9600;fROH(i)=fROH(i)+  0.4800;fN_PINAL(i)=fN_PINAL(i)+  0.4800;fNO2(i)=fNO2(i)+  0.4800;fHO2(i)=fHO2(i)+  0.4800;fELHOM(i)=fELHOM(i)+  0.0400;fDELTA_N(i)=fDELTA_N(i)+  0.5200;fDELTA_C(i)=fDELTA_C(i)+  3.3600;

%--------------------------------------------------------------------------
% 147, <R131>, New
i=i+1;
Rnames{i} = 'API + O3 = 0.77*HO + 0.33*PINALP + 0.22*H2O2 + 0.39*PINAL + 0.01*ORA2 + 0.17*HO2 + 0.17*CO + 0.27*HCHO + 0.27*RCO3';
k(:,i) = (  8.0500E-16.*exp( -6.4000E+02./T) ); 
Gstr{i,   1}='N_API';Gstr{i,   2}='O3';
fN_API(i)=fN_API(i)-1.0;fO3(i)=fO3(i)-1.0;
fHO(i)=fHO(i)+0.77;fN_PINALP(i)=fN_PINALP(i)+0.33;fH2O2(i)=fH2O2(i)+0.22;fN_PINAL(i)=fN_PINAL(i)+0.39;fORA2(i)=fORA2(i)+0.01;fHO2(i)=fHO2(i)+0.17;fCO(i)=fCO(i)+0.17;fHCHO(i)=fHCHO(i)+0.27;fRCO3(i)=fRCO3(i)+0.27;
fKET(i)=fKET(i);fHC3(i)=fHC3(i);fOP1(i)=fOP1(i);fORA1(i)=fORA1(i);fDELTA_C(i)=fDELTA_C(i);

%--------------------------------------------------------------------------
% 105, <TRP04>
i=i+1;
Rnames{i} = 'PINAL + HO = 0.23000*PINALP +  0.77000*RCO3  + 5.3900*DELTA_C';
k(:,i) = (  5.2000E-12.*exp(  6.0000E+02./T) ); 
Gstr{i,   1}='N_PINAL';Gstr{i,   2}='HO';
fN_PINAL(i)=fN_PINAL(i)-1.0;fHO(i)=fHO(i)-1.0;
fN_PINALP(i)=fN_PINALP(i)+  0.2300;fRCO3(i)=fRCO3(i)+  0.7700;fDELTA_C(i)=fDELTA_C(i)+  5.3900;

% 202, <TRP19>, New
i=i+1;
Rnames{i} = 'PINALP + NO = 0.36*TRPN + 0.64*HOM + 0.64*NO2';
k(:,i) = (  2.7000E-12.*exp(  3.6000E+02./T) ); 
Gstr{i,   1}='N_PINALP';Gstr{i,   2}='NO';
fN_PINALP(i)=fN_PINALP(i)-1.0;fNO(i)=fNO(i)-1.0;
fN_TRPN(i)=fN_TRPN(i)+0.36;fHOM(i)=fHOM(i)+0.64;fNO2(i)=fNO2(i)+0.64;

% 244, <TRP27>, New
i=i+1;
Rnames{i} = 'PINALP + HO2 = 0.75*OPB + 0.25*HO + 0.25*HOM';
k(:,i) = (  2.7100E-13.*exp(  1.3000E+03./T) ); 
Gstr{i,   1}='N_PINALP';Gstr{i,   2}='HO2';
fN_PINALP(i)=fN_PINALP(i)-1.0;fHO2(i)=fHO2(i)-1.0;
fOPB(i)=fOPB(i)+0.75;fHO(i)=fHO(i)+0.25;fHOM(i)=fHOM(i)+0.25;

% 175, <TRP11>, New
i=i+1;
Rnames{i} = 'PINALP = HOM ';
k(:,i) = (  2.9000E-02 ); 
Gstr{i,   1}='N_PINALP';
fN_PINALP(i)=fN_PINALP(i)-1.0;
fHOM(i)=fHOM(i)+1.00;

%--------------------------------------------------------------------------
% 142, <TRP07>
i=i+1;
Rnames{i} = 'TRPN + HO = 0.33000*HONIT +  0.67000*NO2 +  0.27000*N_PINAL +  0.38000*KET +  0.21000*HCHO +  0.02000*ALD  + 1.8300*DELTA_C';
k(:,i) = (  4.8000E-12 ); 
Gstr{i,   1}='N_TRPN';Gstr{i,   2}='HO';
fN_TRPN(i)=fN_TRPN(i)-1.0;fHO(i)=fHO(i)-1.0;
fHONIT(i)=fHONIT(i)+  0.3300;fNO2(i)=fNO2(i)+  0.6700;fN_PINAL(i)=fN_PINAL(i)+  0.2700;fKET(i)=fKET(i)+  0.3800;fHCHO(i)=fHCHO(i)+  0.2100;fALD(i)=fALD(i)+  0.0200;fDELTA_C(i)=fDELTA_C(i)+  1.8300;

% 163, <TRP10>
i=i+1;
Rnames{i} = 'TRPN + NO3 = 0.33000*HONIT +  0.67000*NO2 +  0.27000*N_PINAL +  0.38000*KET +  0.21000*HCHO +  0.02000*ALD  + 1.0000*DELTA_N + 1.8300*DELTA_C';
k(:,i) = (  3.1500E-13.*exp( -4.4800E+02./T) ); 
Gstr{i,   1}='N_TRPN';Gstr{i,   2}='NO3';
fN_TRPN(i)=fN_TRPN(i)-1.0;fNO3(i)=fNO3(i)-1.0;
fHONIT(i)=fHONIT(i)+  0.3300;fNO2(i)=fNO2(i)+  0.6700;fN_PINAL(i)=fN_PINAL(i)+  0.2700;fKET(i)=fKET(i)+  0.3800;fHCHO(i)=fHCHO(i)+  0.2100;fALD(i)=fALD(i)+  0.0200;fDELTA_N(i)=fDELTA_N(i)+  1.0000;fDELTA_C(i)=fDELTA_C(i)+  1.8300;

% 150, <TRP09>
i=i+1;
Rnames{i} = 'TRPN + O3 = 0.33000*HONIT +  0.67000*NO2 +  0.27000*N_PINAL +  0.38000*KET +  0.21000*HCHO +  0.02000*ALD  + 1.8300*DELTA_C';
k(:,i) = (  1.6700E-16 ); 
Gstr{i,   1}='N_TRPN';Gstr{i,   2}='O3';
fN_TRPN(i)=fN_TRPN(i)-1.0;fO3(i)=fO3(i)-1.0;
fHONIT(i)=fHONIT(i)+  0.3300;fNO2(i)=fNO2(i)+  0.6700;fN_PINAL(i)=fN_PINAL(i)+  0.2700;fKET(i)=fKET(i)+  0.3800;fHCHO(i)=fHCHO(i)+  0.2100;fALD(i)=fALD(i)+  0.0200;fDELTA_C(i)=fDELTA_C(i)+  1.8300;

