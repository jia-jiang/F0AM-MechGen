% Added by Qianjie Chen (01/20/2022), updated by Seamus Frey (06/24/2024),
% updated again by Seamus on 7/16/2024, 2/10/2025


SpeciesToAdd = {'ClO';'OClO';'Cl';'HCl';'ClNO3';'ClOO';'HOCl';'ClNO2';'Cl2';'Cl2O2';...
        'CLCHO';'C3H5O2';'IPROCLO2';'HYPROCLO2';'OLECLO2';'CH2CLCH2O2';'ClISOABSNO2';...
        'ClISOA';'ClISOC';'ClISOABSN';'ClISOPAO2';'ClISOPBO2';'ClAN';'ClISOPAO';'ClISOPAOOH';...
        'ClISOACHO';'ClISOOL';'ClACETONE';'ClACO3';'ClC5PAN';'ClACO2H';'ClISOPBO';...
        'ClISOPBOOH';'CMBA';'ClHOMRO2';'CLHOMAN';'CLHOMOOH';'ClISOPCO2';'ClISOPDO2';...
        'ClISOPCO';'ClISOPCOOH';'ClISOCCHO';'ClCCO3';'ClCH2CHO';'ClACO3H';'ClCCO3H';...
        'ClCCO2H';'ClISOPDO';'ClHCOC5';'ClISOPDOOH';'CMBO';'ClMVKTO2';'ClMVKIO2';'ClMVKIO';...
        'ClMVKOL';'ClMVKCOCHO';'ClMVKIOOH';'ClMVKTO';'ClMVKTOOH';'ClMACIRO2';'ClMACTRO2';...
        'ClMACTRO';'ClMACTOOH';'ClMACIOOH';'ClMACIRO';'ClMACCHO';'ClACETYL';'ClMVK';'CLHOMALD';...
        'ClIEPOX';'ClISOABOOH';'ClISOABSNO';'ClISOABCHO';'ClISOABALDO2';'ClISOABALDO';...
        'ClISOABALDOOH';'ClISOABDALD';'DIClIEPOX';'ClOH5ROOH';'ISOABALDO2';'ISOABALDOOH';...
        'ISOABALDO';'ISOABDALD';'ISOPBOOHABS';'C5OOHKET';'ClISO5ABDALD';};

RO2ToAdd = {'ClISOPAO2';'ClISOPBO2';'ClACO3';'ClHOMRO2';'ClISOPCO2';'ClISOPDO2';'ClCCO3';...
  'ClMVKTO2';'ClMVKIO2';'ClMACIRO2';'ClMACTRO2';'ClISOABSNO2';'ClISOABALDO2';'ISOABALDO2';};

AddSpecies;

%% Reactions added by Seamus on February 10, 2025
% Most rate constants came from MCM, with the exception of a few branching 
% ratios, which came from Wennberg et al 2018. He has an excel explaining
% each choice

i=i+1;
Rnames{i} = 'C5H8 + Cl = ClISOABSN + HCl';
k(:,i) = .15.*7.6e-11.*exp(500./T);
Gstr{i,1} = 'C5H8'; Gstr{i,2} = 'Cl'; 
fC5H8(i)=fC5H8(i)-1; fCl(i)=fCl(i)-1; fClISOABSN(i)=fClISOABSN(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'C5H8 + Cl = ClISOA';
k(:,i) = .38.*7.6e-11.*exp(500./T);
Gstr{i,1} = 'C5H8'; Gstr{i,2} = 'Cl'; 
fC5H8(i)=fC5H8(i)-1; fCl(i)=fCl(i)-1; fClISOA(i)=fClISOA(i)+1; 

i=i+1;
Rnames{i} = 'C5H8 + Cl = ClISOC';
k(:,i) = .47.*7.6e-11.*exp(500./T);
Gstr{i,1} = 'C5H8'; Gstr{i,2} = 'Cl'; 
fC5H8(i)=fC5H8(i)-1; fCl(i)=fCl(i)-1; fClISOC(i)=fClISOC(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABSN = ClISOABSNO2';
k(:,i) = 2e-12.*.21.*M;
Gstr{i,1} = 'ClISOABSN'; 
fClISOABSN(i)=fClISOABSN(i)-1; fClISOABSNO2(i)=fClISOABSNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABSNO2 = ClISOABSN';
k(:,i) = 3.06e15.*exp(-10254./T);
Gstr{i,1} = 'ClISOABSNO2'; 
fClISOABSNO2(i)=fClISOABSNO2(i)-1; fClISOABSN(i)=fClISOABSN(i)+1; 

i=i+1;
Rnames{i} = 'ClISOA = ClISOPAO2';
k(:,i) = 3.5e-12.*.21.*M;
Gstr{i,1} = 'ClISOA'; 
fClISOA(i)=fClISOA(i)-1; fClISOPAO2(i)=fClISOPAO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOA = ClISOPBO2';
k(:,i) = 3e-12.*.21.*M;
Gstr{i,1} = 'ClISOA'; 
fClISOA(i)=fClISOA(i)-1; fClISOPBO2(i)=fClISOPBO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAO2 = ClISOA';
k(:,i) = 5.22e15.*exp(-9838./T);
Gstr{i,1} = 'ClISOPAO2'; 
fClISOPAO2(i)=fClISOPAO2(i)-1; fClISOA(i)=fClISOA(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO2 = ClISOA';
k(:,i) = 8.62e15.*exp(-11322./T);
Gstr{i,1} = 'ClISOPBO2'; 
fClISOPBO2(i)=fClISOPBO2(i)-1; fClISOA(i)=fClISOA(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAO2 + NO = ClISOPAO + NO2';
k(:,i) = KRO2NO.*.913;
Gstr{i,1} = 'ClISOPAO2'; Gstr{i,2} = 'NO'; 
fClISOPAO2(i)=fClISOPAO2(i)-1; fNO(i)=fNO(i)-1; fClISOPAO(i)=fClISOPAO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAO2 + NO = ClAN';
k(:,i) = KRO2NO.*.087;
Gstr{i,1} = 'ClISOPAO2'; Gstr{i,2} = 'NO'; 
fClISOPAO2(i)=fClISOPAO2(i)-1; fNO(i)=fNO(i)-1; fClAN(i)=fClAN(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAO2 + HO2 = ClISOPAOOH';
k(:,i) = KRO2HO2.*.706;
Gstr{i,1} = 'ClISOPAO2'; Gstr{i,2} = 'HO2'; 
fClISOPAO2(i)=fClISOPAO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOPAOOH(i)=fClISOPAOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAO2 + HO2 = ClISOPAO + OH';
k(:,i) = KRO2HO2.*.294;
Gstr{i,1} = 'ClISOPAO2'; Gstr{i,2} = 'HO2'; 
fClISOPAO2(i)=fClISOPAO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOPAO(i)=fClISOPAO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAO2 + RO2 = ClISOPAO';
k(:,i) = 2.4e-12.*.8;
Gstr{i,1} = 'ClISOPAO2'; Gstr{i,2} = 'RO2'; 
fClISOPAO2(i)=fClISOPAO2(i)-1; fClISOPAO(i)=fClISOPAO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAO2 + RO2 = ClISOACHO';
k(:,i) = 2.4e-12.*.1;
Gstr{i,1} = 'ClISOPAO2'; Gstr{i,2} = 'RO2'; 
fClISOPAO2(i)=fClISOPAO2(i)-1; fClISOACHO(i)=fClISOACHO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAO2 + RO2 = ClISOOL';
k(:,i) = 2.4e-12.*.1;
Gstr{i,1} = 'ClISOPAO2'; Gstr{i,2} = 'RO2'; 
fClISOPAO2(i)=fClISOPAO2(i)-1; fClISOOL(i)=fClISOOL(i)+1; 

i=i+1;
Rnames{i} = 'ClISOACHO + hv = ClACO3 + HO2';
k(:,i) = J19;
Gstr{i,1} = 'ClISOACHO';
fClISOACHO(i)=fClISOACHO(i)-1; fClACO3(i)=fClACO3(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOACHO + hv = ClACETONE + HO2 + HO2 + CO + CO';
k(:,i) = J18;
Gstr{i,1} = 'ClISOACHO'; 
fClISOACHO(i)=fClISOACHO(i)-1; fClACETONE(i)=fClACETONE(i)+1; fHO2(i)=fHO2(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'ClACO3 + NO = ClACETONE + CO + HO2 + NO2';
k(:,i) = KAPNO;
Gstr{i,1} = 'ClACO3'; Gstr{i,2} = 'NO'; 
fClACO3(i)=fClACO3(i)-1; fNO(i)=fNO(i)-1; fClACETONE(i)=fClACETONE(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClACO3 + NO2 = ClC5PAN';
k(:,i) = KFPAN;
Gstr{i,1} = 'ClACO3'; Gstr{i,2} = 'NO2'; 
fClACO3(i)=fClACO3(i)-1; fNO2(i)=fNO2(i)-1; fClC5PAN(i)=fClC5PAN(i)+1; 

i=i+1;
Rnames{i} = 'ClACO3 + HO2 = ClACO3H';
k(:,i) = KAPHO2.*.41;
Gstr{i,1} = 'ClACO3'; Gstr{i,2} = 'HO2'; 
fClACO3(i)=fClACO3(i)-1; fHO2(i)=fHO2(i)-1; fClACO3H(i)=fClACO3H(i)+1; 

i=i+1;
Rnames{i} = 'ClACO3H + hv = ClACETONE + CO + HO2 + OH';
k(:,i) = J41;
Gstr{i,1} = 'ClACO3H';
fClACO3H(i)=fClACO3H(i)-1; fClACETONE(i)=fClACETONE(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClACO3 + HO2 = ClACO2H + O3';
k(:,i) = KAPHO2.*.15;
Gstr{i,1} = 'ClACO3'; Gstr{i,2} = 'HO2'; 
fClACO3(i)=fClACO3(i)-1; fHO2(i)=fHO2(i)-1; fClACO2H(i)=fClACO2H(i)+1; fO3(i)=fO3(i)+1; 

i=i+1;
Rnames{i} = 'ClACO3 + HO2 = ClACETONE + CO + HO2 + OH';
k(:,i) = KAPHO2.*.44;
Gstr{i,1} = 'ClACO3'; Gstr{i,2} = 'HO2'; 
fClACO3(i)=fClACO3(i)-1; fHO2(i)=fHO2(i)-1; fClACETONE(i)=fClACETONE(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClACO2H + OH = ClACETONE + CO + HO2';
k(:,i) = 2.52e-11;
Gstr{i,1} = 'ClACO2H'; Gstr{i,2} = 'OH'; 
fClACO2H(i)=fClACO2H(i)-1; fOH(i)=fOH(i)-1; fClACETONE(i)=fClACETONE(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClACO3 + RO2 = ClACETONE + CO + HO2';
k(:,i) = 1e-11.*.7;
Gstr{i,1} = 'ClACO3'; Gstr{i,2} = 'RO2'; 
fClACO3(i)=fClACO3(i)-1; fClACETONE(i)=fClACETONE(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClACO3 + RO2 = ClACO2H';
k(:,i) = 1e-11.*.3;
Gstr{i,1} = 'ClACO3'; Gstr{i,2} = 'RO2'; 
fClACO3(i)=fClACO3(i)-1; fClACO2H(i)=fClACO2H(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO2 + NO = ClISOPBO + NO2';
k(:,i) = KRO2NO.*.896;
Gstr{i,1} = 'ClISOPBO2'; Gstr{i,2} = 'NO'; 
fClISOPBO2(i)=fClISOPBO2(i)-1; fNO(i)=fNO(i)-1; fClISOPBO(i)=fClISOPBO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO2 + NO = ClAN';
k(:,i) = KRO2NO.*.104;
Gstr{i,1} = 'ClISOPBO2'; Gstr{i,2} = 'NO'; 
fClISOPBO2(i)=fClISOPBO2(i)-1; fNO(i)=fNO(i)-1; fClAN(i)=fClAN(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO2 + HO2 = ClISOPBOOH';
k(:,i) = KRO2HO2.*.937;
Gstr{i,1} = 'ClISOPBO2'; Gstr{i,2} = 'HO2'; 
fClISOPBO2(i)=fClISOPBO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOPBOOH(i)=fClISOPBOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO2 + HO2 = ClISOPBO + OH';
k(:,i) = KRO2HO2.*.063;
Gstr{i,1} = 'ClISOPBO2'; Gstr{i,2} = 'HO2'; 
fClISOPBO2(i)=fClISOPBO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOPBO(i)=fClISOPBO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO = MVK + CH2CLO2';
k(:,i) = 0.5*KDEC;
Gstr{i,1} = 'ClISOPBO'; 
fClISOPBO(i)=fClISOPBO(i)-1; fMVK(i)=fMVK(i)+1; fCH2CLO2(i)=fCH2CLO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO = ClMVK + CH3O2';
k(:,i) = 0.5*KDEC;
Gstr{i,1} = 'ClISOPBO'; 
fClISOPBO(i)=fClISOPBO(i)-1; fClMVK(i)=fClMVK(i)+1; fCH3O2(i)=fCH3O2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO2 + RO2 = ClISOPBO';
k(:,i) = 8e-13.*.8;
Gstr{i,1} = 'ClISOPBO2'; Gstr{i,2} = 'RO2'; 
fClISOPBO2(i)=fClISOPBO2(i)-1; fClISOPBO(i)=fClISOPBO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO2 + RO2 = ClISOOL';
k(:,i) = 8e-13.*.2;
Gstr{i,1} = 'ClISOPBO2'; Gstr{i,2} = 'RO2'; 
fClISOPBO2(i)=fClISOPBO2(i)-1; fClISOOL(i)=fClISOOL(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAO = CMBA + HO2';
k(:,i) = KDEC.*.63;
Gstr{i,1} = 'ClISOPAO'; 
fClISOPAO(i)=fClISOPAO(i)-1; fCMBA(i)=fCMBA(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAO = ClOH5ROOH';
k(:,i) = KDEC.*.19;
Gstr{i,1} = 'ClISOPAO'; 
fClISOPAO(i)=fClISOPAO(i)-1; fClOH5ROOH(i)=fClOH5ROOH(i)+1; 

i=i+1;
Rnames{i} = 'ClHOMRO2 + NO = CLHOMAN';
k(:,i) = KRO2NO;
Gstr{i,1} = 'ClHOMRO2'; Gstr{i,2} = 'NO'; 
fClHOMRO2(i)=fClHOMRO2(i)-1; fNO(i)=fNO(i)-1; fCLHOMAN(i)=fCLHOMAN(i)+1; 

i=i+1;
Rnames{i} = 'ClHOMRO2 + HO2 = CLHOMOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'ClHOMRO2'; Gstr{i,2} = 'HO2'; 
fClHOMRO2(i)=fClHOMRO2(i)-1; fHO2(i)=fHO2(i)-1; fCLHOMOOH(i)=fCLHOMOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOC = ClISOPCO2';
k(:,i) = 2e-12.*.21.*M;
Gstr{i,1} = 'ClISOC'; 
fClISOC(i)=fClISOC(i)-1; fClISOPCO2(i)=fClISOPCO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOC = ClISOPDO2';
k(:,i) = 3.5e-12.*.21.*M;
Gstr{i,1} = 'ClISOC'; 
fClISOC(i)=fClISOC(i)-1; fClISOPDO2(i)=fClISOPDO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO2 = ClISOC';
k(:,i) = 3.06e15.*exp(-10254./T);
Gstr{i,1} = 'ClISOPCO2'; 
fClISOPCO2(i)=fClISOPCO2(i)-1; fClISOC(i)=fClISOC(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO2 = ClISOC';
k(:,i) = 1.05e16.*exp(-11705./T);
Gstr{i,1} = 'ClISOPDO2'; 
fClISOPDO2(i)=fClISOPDO2(i)-1; fClISOC(i)=fClISOC(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO2 + NO = ClISOPCO + NO2';
k(:,i) = KRO2NO.*.913;
Gstr{i,1} = 'ClISOPCO2'; Gstr{i,2} = 'NO'; 
fClISOPCO2(i)=fClISOPCO2(i)-1; fNO(i)=fNO(i)-1; fClISOPCO(i)=fClISOPCO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO2 + NO = ClAN';
k(:,i) = KRO2NO.*.087;
Gstr{i,1} = 'ClISOPCO2'; Gstr{i,2} = 'NO'; 
fClISOPCO2(i)=fClISOPCO2(i)-1; fNO(i)=fNO(i)-1; fClAN(i)=fClAN(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO2 + HO2 = ClISOPCOOH';
k(:,i) = KRO2HO2.*.706;
Gstr{i,1} = 'ClISOPCO2'; Gstr{i,2} = 'HO2'; 
fClISOPCO2(i)=fClISOPCO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOPCOOH(i)=fClISOPCOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO2 + HO2 = ClISOPCO + OH';
k(:,i) = KRO2HO2.*.296;
Gstr{i,1} = 'ClISOPCO2'; Gstr{i,2} = 'HO2'; 
fClISOPCO2(i)=fClISOPCO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOPCO(i)=fClISOPCO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO2 + RO2 = ClISOPCO';
k(:,i) = 2e-12.*.8;
Gstr{i,1} = 'ClISOPCO2'; Gstr{i,2} = 'RO2'; 
fClISOPCO2(i)=fClISOPCO2(i)-1; fClISOPCO(i)=fClISOPCO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO2 + RO2 = ClISOCCHO';
k(:,i) = 2e-12.*.1;
Gstr{i,1} = 'ClISOPCO2'; Gstr{i,2} = 'RO2'; 
fClISOPCO2(i)=fClISOPCO2(i)-1; fClISOCCHO(i)=fClISOCCHO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO2 + RO2 = ClISOOL';
k(:,i) = 2e-12.*.1;
Gstr{i,1} = 'ClISOPCO2'; Gstr{i,2} = 'RO2'; 
fClISOPCO2(i)=fClISOPCO2(i)-1; fClISOOL(i)=fClISOOL(i)+1; 

i=i+1;
Rnames{i} = 'ClISOCCHO + hv = ClCCO3 + HO2';
k(:,i) = J19;
Gstr{i,1} = 'ClISOCCHO';
fClISOCCHO(i)=fClISOCCHO(i)-1; fClCCO3(i)=fClCCO3(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOCCHO + hv = CH3CO3 + HO2 + CO + ClCH2CHO';
k(:,i) = J18;
Gstr{i,1} = 'ClISOCCHO'; 
fClISOCCHO(i)=fClISOCCHO(i)-1; fCH3CO3(i)=fCH3CO3(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fClCH2CHO(i)=fClCH2CHO(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO3 + NO = ClCH2CHO + CH3CO3 + NO2';
k(:,i) = KAPNO;
Gstr{i,1} = 'ClCCO3'; Gstr{i,2} = 'NO'; 
fClCCO3(i)=fClCCO3(i)-1; fNO(i)=fNO(i)-1; fClCH2CHO(i)=fClCH2CHO(i)+1; fCH3CO3(i)=fCH3CO3(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO3 + NO2 = ClC5PAN';
k(:,i) = KFPAN;
Gstr{i,1} = 'ClCCO3'; Gstr{i,2} = 'NO2'; 
fClCCO3(i)=fClCCO3(i)-1; fNO2(i)=fNO2(i)-1; fClC5PAN(i)=fClC5PAN(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO3 + HO2 = ClCCO3H';
k(:,i) = KAPHO2.*.41;
Gstr{i,1} = 'ClCCO3'; Gstr{i,2} = 'HO2'; 
fClCCO3(i)=fClCCO3(i)-1; fHO2(i)=fHO2(i)-1; fClCCO3H(i)=fClCCO3H(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO3H + hv = ClCH2CHO + CH3CO3 + OH';
k(:,i) = J41;
Gstr{i,1} = 'ClCCO3H';
fClCCO3H(i)=fClCCO3H(i)-1; fClCH2CHO(i)=fClCH2CHO(i)+1; fCH3CO3(i)=fCH3CO3(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO3 + HO2 = ClCCO2H + O3';
k(:,i) = KAPHO2.*.15;
Gstr{i,1} = 'ClCCO3'; Gstr{i,2} = 'HO2'; 
fClCCO3(i)=fClCCO3(i)-1; fHO2(i)=fHO2(i)-1; fClCCO2H(i)=fClCCO2H(i)+1; fO3(i)=fO3(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO3 + HO2 = CH3CO3 + ClCH2CHO + OH';
k(:,i) = KAPHO2.*.44;
Gstr{i,1} = 'ClCCO3'; Gstr{i,2} = 'HO2'; 
fClCCO3(i)=fClCCO3(i)-1; fHO2(i)=fHO2(i)-1; fCH3CO3(i)=fCH3CO3(i)+1; fClCH2CHO(i)=fClCH2CHO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO2H + OH = CH3CO3 + ClCH2CHO';
k(:,i) = 2.52e-11;
Gstr{i,1} = 'ClCCO2H'; Gstr{i,2} = 'OH'; 
fClCCO2H(i)=fClCCO2H(i)-1; fOH(i)=fOH(i)-1; fCH3CO3(i)=fCH3CO3(i)+1; fClCH2CHO(i)=fClCH2CHO(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO3 + RO2 = CH3CO3 + ClCH2CHO';
k(:,i) = 1e-11.*.7;
Gstr{i,1} = 'ClCCO3'; Gstr{i,2} = 'RO2'; 
fClCCO3(i)=fClCCO3(i)-1; fCH3CO3(i)=fCH3CO3(i)+1; fClCH2CHO(i)=fClCH2CHO(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO3 + RO2 = ClCCO2H';
k(:,i) = 1e-11.*.3;
Gstr{i,1} = 'ClCCO3'; Gstr{i,2} = 'RO2'; 
fClCCO3(i)=fClCCO3(i)-1; fClCCO2H(i)=fClCCO2H(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO2 + NO = ClISOPDO + NO2';
k(:,i) = KRO2NO.*.896;
Gstr{i,1} = 'ClISOPDO2'; Gstr{i,2} = 'NO'; 
fClISOPDO2(i)=fClISOPDO2(i)-1; fNO(i)=fNO(i)-1; fClISOPDO(i)=fClISOPDO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO2 + NO = ClAN';
k(:,i) = KRO2NO.*.104;
Gstr{i,1} = 'ClISOPDO2'; Gstr{i,2} = 'NO'; 
fClISOPDO2(i)=fClISOPDO2(i)-1; fNO(i)=fNO(i)-1; fClAN(i)=fClAN(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO2 + HO2 = ClISOPDOOH';
k(:,i) = KRO2HO2.*.937;
Gstr{i,1} = 'ClISOPDO2'; Gstr{i,2} = 'HO2'; 
fClISOPDO2(i)=fClISOPDO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOPDOOH(i)=fClISOPDOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO2 + HO2 = ClISOPDO + OH';
k(:,i) = KRO2HO2.*.063;
Gstr{i,1} = 'ClISOPDO2'; Gstr{i,2} = 'HO2'; 
fClISOPDO2(i)=fClISOPDO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOPDO(i)=fClISOPDO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO = CMBO + HO2';
k(:,i) = KDEC;
Gstr{i,1} = 'ClISOPDO'; 
fClISOPDO(i)=fClISOPDO(i)-1; fCMBO(i)=fCMBO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO2 + RO2 = ClISOPDO';
k(:,i) = 2.9e-12.*.8;
Gstr{i,1} = 'ClISOPDO2'; Gstr{i,2} = 'RO2'; 
fClISOPDO2(i)=fClISOPDO2(i)-1; fClISOPDO(i)=fClISOPDO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO2 + RO2 = ClISOOL';
k(:,i) = 2.9e-12.*.1;
Gstr{i,1} = 'ClISOPDO2'; Gstr{i,2} = 'RO2'; 
fClISOPDO2(i)=fClISOPDO2(i)-1; fClISOOL(i)=fClISOOL(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO2 + RO2 = CMBO';
k(:,i) = 2.9e-12.*.1;
Gstr{i,1} = 'ClISOPDO2'; Gstr{i,2} = 'RO2'; 
fClISOPDO2(i)=fClISOPDO2(i)-1; fCMBO(i)=fCMBO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO = CMBA + HO2';
k(:,i) = KDEC.*.52;
Gstr{i,1} = 'ClISOPCO'; 
fClISOPCO(i)=fClISOPCO(i)-1; fCMBA(i)=fCMBA(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO = ClOH5ROOH';
k(:,i) = KDEC.*.30;
Gstr{i,1} = 'ClISOPCO'; 
fClISOPCO(i)=fClISOPCO(i)-1; fClOH5ROOH(i)=fClOH5ROOH(i)+1; 

i=i+1;
Rnames{i} = 'MVK + Cl = ClMVKTO2';
k(:,i) = 2.1e-10.*.8;
Gstr{i,1} = 'MVK'; Gstr{i,2} = 'Cl'; 
fMVK(i)=fMVK(i)-1; fCl(i)=fCl(i)-1; fClMVKTO2(i)=fClMVKTO2(i)+1; 

i=i+1;
Rnames{i} = 'MVK + Cl = ClMVKIO2';
k(:,i) = 2.1e-10.*.2;
Gstr{i,1} = 'MVK'; Gstr{i,2} = 'Cl'; 
fMVK(i)=fMVK(i)-1; fCl(i)=fCl(i)-1; fClMVKIO2(i)=fClMVKIO2(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKIO2 + RO2 = ClMVKIO';
k(:,i) = 2e-12.*.6;
Gstr{i,1} = 'ClMVKIO2'; Gstr{i,2} = 'RO2'; 
fClMVKIO2(i)=fClMVKIO2(i)-1; fClMVKIO(i)=fClMVKIO(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKIO2 + RO2 = ClMVKOL';
k(:,i) = 2e-12.*.2;
Gstr{i,1} = 'ClMVKIO2'; Gstr{i,2} = 'RO2'; 
fClMVKIO2(i)=fClMVKIO2(i)-1; fClMVKOL(i)=fClMVKOL(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKIO2 + RO2 = ClMVKCOCHO';
k(:,i) = 2e-12.*.2;
Gstr{i,1} = 'ClMVKIO2'; Gstr{i,2} = 'RO2'; 
fClMVKIO2(i)=fClMVKIO2(i)-1; fClMVKCOCHO(i)=fClMVKCOCHO(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKIO2 + NO = ClMVKIO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'ClMVKIO2'; Gstr{i,2} = 'NO'; 
fClMVKIO2(i)=fClMVKIO2(i)-1; fNO(i)=fNO(i)-1; fClMVKIO(i)=fClMVKIO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKIO2 + HO2 = ClMVKIO + OH';
k(:,i) = KRO2HO2.*.2;
Gstr{i,1} = 'ClMVKIO2'; Gstr{i,2} = 'HO2'; 
fClMVKIO2(i)=fClMVKIO2(i)-1; fHO2(i)=fHO2(i)-1; fClMVKIO(i)=fClMVKIO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKIO2 + HO2 = ClMVKIOOH';
k(:,i) = KRO2HO2.*.8;
Gstr{i,1} = 'ClMVKIO2'; Gstr{i,2} = 'HO2'; 
fClMVKIO2(i)=fClMVKIO2(i)-1; fHO2(i)=fHO2(i)-1; fClMVKIOOH(i)=fClMVKIOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKIO = HCHO + CHOCL';
k(:,i) = KDEC;
Gstr{i,1} = 'ClMVKIO'; 
fClMVKIO(i)=fClMVKIO(i)-1; fHCHO(i)=fHCHO(i)+1; fCHOCL(i)=fCHOCL(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKTO2 + NO = ClMVKTO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'ClMVKTO2'; Gstr{i,2} = 'NO'; 
fClMVKTO2(i)=fClMVKTO2(i)-1; fNO(i)=fNO(i)-1; fClMVKTO(i)=fClMVKTO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKTO2 + HO2 = ClMVKTO + OH';
k(:,i) = KRO2HO2.*.48;
Gstr{i,1} = 'ClMVKTO2'; Gstr{i,2} = 'HO2'; 
fClMVKTO2(i)=fClMVKTO2(i)-1; fHO2(i)=fHO2(i)-1; fClMVKTO(i)=fClMVKTO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKTO2 + HO2 = ClMVKTOOH';
k(:,i) = KRO2HO2.*.34;
Gstr{i,1} = 'ClMVKTO2'; Gstr{i,2} = 'HO2'; 
fClMVKTO2(i)=fClMVKTO2(i)-1; fHO2(i)=fHO2(i)-1; fClMVKTOOH(i)=fClMVKTOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKTO2 + HO2 = ClMVKCOCHO + HO2 + OH';
k(:,i) = KRO2HO2.*.18;
Gstr{i,1} = 'ClMVKTO2'; Gstr{i,2} = 'HO2'; 
fClMVKTO2(i)=fClMVKTO2(i)-1; fHO2(i)=fHO2(i)-1; fClMVKCOCHO(i)=fClMVKCOCHO(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKTO = ClCH2CHO + CH3CO3';
k(:,i) = KDEC;
Gstr{i,1} = 'ClMVKTO'; 
fClMVKTO(i)=fClMVKTO(i)-1; fClCH2CHO(i)=fClCH2CHO(i)+1; fCH3CO3(i)=fCH3CO3(i)+1; 

i=i+1;
Rnames{i} = 'MACR + Cl = MACO3 + HCl';
k(:,i) = 2.2e-10.*.11;
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'Cl'; 
fMACR(i)=fMACR(i)-1; fCl(i)=fCl(i)-1; fMACO3(i)=fMACO3(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'MACR + Cl = ClMACIRO2';
k(:,i) = 2.2e-10.*.44;
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'Cl'; 
fMACR(i)=fMACR(i)-1; fCl(i)=fCl(i)-1; fClMACIRO2(i)=fClMACIRO2(i)+1; 

i=i+1;
Rnames{i} = 'MACR + Cl = ClMACTRO2';
k(:,i) = 2.2e-10.*.45;
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'Cl'; 
fMACR(i)=fMACR(i)-1; fCl(i)=fCl(i)-1; fClMACTRO2(i)=fClMACTRO2(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTRO2 = ClACETONE + CO + OH';
k(:,i) = K14ISOM1;
Gstr{i,1} = 'ClMACTRO2'; 
fClMACTRO2(i)=fClMACTRO2(i)-1; fClACETONE(i)=fClACETONE(i)+1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTRO2 + NO = ClMACTRO + NO2';
k(:,i) = KRO2NO.*.94;
Gstr{i,1} = 'ClMACTRO2'; Gstr{i,2} = 'NO'; 
fClMACTRO2(i)=fClMACTRO2(i)-1; fNO(i)=fNO(i)-1; fClMACTRO(i)=fClMACTRO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTRO2 + NO = ClAN';
k(:,i) = KRO2NO.*.06;
Gstr{i,1} = 'ClMACTRO2'; Gstr{i,2} = 'NO'; 
fClMACTRO2(i)=fClMACTRO2(i)-1; fNO(i)=fNO(i)-1; fClAN(i)=fClAN(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTRO2 + HO2 = ClMACTOOH';
k(:,i) = KRO2HO2.*.41;
Gstr{i,1} = 'ClMACTRO2'; Gstr{i,2} = 'HO2'; 
fClMACTRO2(i)=fClMACTRO2(i)-1; fHO2(i)=fHO2(i)-1; fClMACTOOH(i)=fClMACTOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTRO2 + HO2 = ClMACTRO + OH';
k(:,i) = KRO2HO2.*.59;
Gstr{i,1} = 'ClMACTRO2'; Gstr{i,2} = 'HO2'; 
fClMACTRO2(i)=fClMACTRO2(i)-1; fHO2(i)=fHO2(i)-1; fClMACTRO(i)=fClMACTRO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTRO2 + RO2 = ClMVKOL';
k(:,i) = 9.2e-14.*0.3;
Gstr{i,1} = 'ClMACTRO2'; Gstr{i,2} = 'RO2'; 
fClMACTRO2(i)=fClMACTRO2(i)-1; fClMVKOL(i)=fClMVKOL(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTRO2 + RO2 = ClMACTRO';
k(:,i) = 9.2e-14.*0.7;
Gstr{i,1} = 'ClMACTRO2'; Gstr{i,2} = 'RO2'; 
fClMACTRO2(i)=fClMACTRO2(i)-1; fClMACTRO(i)=fClMACTRO(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTRO = ClACETONE + CO + HO2';
k(:,i) = KDEC;
Gstr{i,1} = 'ClMACTRO'; 
fClMACTRO(i)=fClMACTRO(i)-1; fClACETONE(i)=fClACETONE(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIRO2 + HO2 = ClMACIOOH';
k(:,i) = KRO2HO2.*.8;
Gstr{i,1} = 'ClMACIRO2'; Gstr{i,2} = 'HO2'; 
fClMACIRO2(i)=fClMACIRO2(i)-1; fHO2(i)=fHO2(i)-1; fClMACIOOH(i)=fClMACIOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIRO2 + HO2 = ClMACIRO + OH';
k(:,i) = KRO2HO2.*.2;
Gstr{i,1} = 'ClMACIRO2'; Gstr{i,2} = 'HO2'; 
fClMACIRO2(i)=fClMACIRO2(i)-1; fHO2(i)=fHO2(i)-1; fClMACIRO(i)=fClMACIRO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIRO2 + NO = ClMACIRO + NO2';
k(:,i) = KRO2NO.*.94;
Gstr{i,1} = 'ClMACIRO2'; Gstr{i,2} = 'NO'; 
fClMACIRO2(i)=fClMACIRO2(i)-1; fNO(i)=fNO(i)-1; fClMACIRO(i)=fClMACIRO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIRO2 + NO = ClAN';
k(:,i) = KRO2NO.*.06;
Gstr{i,1} = 'ClMACIRO2'; Gstr{i,2} = 'NO'; 
fClMACIRO2(i)=fClMACIRO2(i)-1; fNO(i)=fNO(i)-1; fClAN(i)=fClAN(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIRO2 + RO2 = ClMACCHO';
k(:,i) = 1.4e-12.*0.2;
Gstr{i,1} = 'ClMACIRO2'; Gstr{i,2} = 'RO2'; 
fClMACIRO2(i)=fClMACIRO2(i)-1; fClMACCHO(i)=fClMACCHO(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIRO2 + RO2 = ClMACIRO';
k(:,i) = 1.4e-12.*0.6;
Gstr{i,1} = 'ClMACIRO2'; Gstr{i,2} = 'RO2'; 
fClMACIRO2(i)=fClMACIRO2(i)-1; fClMACIRO(i)=fClMACIRO(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIRO2 + RO2 = ClMVKOL';
k(:,i) = 1.4e-12.*0.2;
Gstr{i,1} = 'ClMACIRO2'; Gstr{i,2} = 'RO2'; 
fClMACIRO2(i)=fClMACIRO2(i)-1; fClMVKOL(i)=fClMVKOL(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIRO = HCHO + CO + HO2 + ClACETYL';
k(:,i) = KDEC;
Gstr{i,1} = 'ClMACIRO'; 
fClMACIRO(i)=fClMACIRO(i)-1; fHCHO(i)=fHCHO(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fClACETYL(i)=fClACETYL(i)+1; 

% ISOPOOH Photolysis
i=i+1;
Rnames{i} = 'ClISOPAOOH + hv = ClISOPAO + OH';
k(:,i) = J41;
Gstr{i,1} = 'ClISOPAOOH';
fClISOPAOOH(i)=fClISOPAOOH(i)-1; fClISOPAO(i)=fClISOPAO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBOOH + hv = ClISOPBO + OH';
k(:,i) = J41;
Gstr{i,1} = 'ClISOPBOOH';
fClISOPBOOH(i)=fClISOPBOOH(i)-1; fClISOPBO(i)=fClISOPBO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCOOH + hv = ClISOPCO + OH';
k(:,i) = J41;
Gstr{i,1} = 'ClISOPCOOH';
fClISOPCOOH(i)=fClISOPCOOH(i)-1; fClISOPCO(i)=fClISOPCO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDOOH + hv = ClISOPDO + OH';
k(:,i) = J41;
Gstr{i,1} = 'ClISOPDOOH';
fClISOPDOOH(i)=fClISOPDOOH(i)-1; fClISOPDO(i)=fClISOPDO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKIOOH + hv = ClMVKIO + OH';
k(:,i) = J41;
Gstr{i,1} = 'ClMVKIOOH';
fClMVKIOOH(i)=fClMVKIOOH(i)-1; fClMVKIO(i)=fClMVKIO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKTOOH + hv = ClMVKTO + OH';
k(:,i) = J41;
Gstr{i,1} = 'ClMVKTOOH'; 
fClMVKTOOH(i)=fClMVKTOOH(i)-1; fClMVKTO(i)=fClMVKTO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTOOH + hv = ClMACTRO + OH';
k(:,i) = J41;
Gstr{i,1} = 'ClMACTOOH';
fClMACTOOH(i)=fClMACTOOH(i)-1; fClMACTRO(i)=fClMACTRO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIOOH + hv = ClMACIRO + OH';
k(:,i) = J41;
Gstr{i,1} = 'ClMACIOOH'; 
fClMACIOOH(i)=fClMACIOOH(i)-1; fClMACIRO(i)=fClMACIRO(i)+1; fOH(i)=fOH(i)+1; 

% Abstraction
i=i+1;
Rnames{i} = 'ClISOABSNO2 + NO = ClISOABSNO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'ClISOABSNO2'; Gstr{i,2} = 'NO'; 
fClISOABSNO2(i)=fClISOABSNO2(i)-1; fNO(i)=fNO(i)-1; fClISOABSNO(i)=fClISOABSNO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABSNO2 + HO2 = ClISOABOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'ClISOABSNO2'; Gstr{i,2} = 'HO2'; 
fClISOABSNO2(i)=fClISOABSNO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOABOOH(i)=fClISOABOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABSNO2 + RO2 = ClISOABSNO';
k(:,i) = 2e-12;
Gstr{i,1} = 'ClISOABSNO2'; Gstr{i,2} = 'RO2'; 
fClISOABSNO2(i)=fClISOABSNO2(i)-1; fClISOABSNO(i)=fClISOABSNO(i)+1;

% Abstraction
i=i+1;
Rnames{i} = 'ClISOABSNO = ClISOABCHO + HO2';
k(:,i) = KDEC;
Gstr{i,1} = 'ClISOABSNO'; 
fClISOABSNO(i)=fClISOABSNO(i)-1; fClISOABCHO(i)=fClISOABCHO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABCHO + Cl = ClISOABALDO2';
k(:,i) = 7.6e-11.*exp(500./T);
Gstr{i,1} = 'ClISOABCHO'; Gstr{i,2} = 'Cl'; 
fClISOABCHO(i)=fClISOABCHO(i)-1; fCl(i)=fCl(i)-1; fClISOABALDO2(i)=fClISOABALDO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABCHO + OH = ISOABALDO2';
k(:,i) = 2.7e-11.*exp(390./T);
Gstr{i,1} = 'ClISOABCHO'; Gstr{i,2} = 'OH'; 
fClISOABCHO(i)=fClISOABCHO(i)-1; fOH(i)=fOH(i)-1; fISOABALDO2(i)=fISOABALDO2(i)+1; 

i=i+1;
Rnames{i} = 'ISOABALDO2 + HO2 = ISOABALDOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'ISOABALDO2'; Gstr{i,2} = 'HO2'; 
fISOABALDO2(i)=fISOABALDO2(i)-1; fHO2(i)=fHO2(i)-1; fISOABALDOOH(i)=fISOABALDOOH(i)+1; 

i=i+1;
Rnames{i} = 'ISOABALDO2 + NO = ISOABALDO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'ISOABALDO2'; Gstr{i,2} = 'NO'; 
fISOABALDO2(i)=fISOABALDO2(i)-1; fNO(i)=fNO(i)-1; fISOABALDO(i)=fISOABALDO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ISOABALDO = ISOABDALD + HO2';
k(:,i) = KDEC;
Gstr{i,1} = 'ISOABALDO'; 
fISOABALDO(i)=fISOABALDO(i)-1; fISOABDALD(i)=fISOABDALD(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABALDO2 + NO = ClISOABALDO';
k(:,i) = KRO2NO;
Gstr{i,1} = 'ClISOABALDO2'; Gstr{i,2} = 'NO'; 
fClISOABALDO2(i)=fClISOABALDO2(i)-1; fNO(i)=fNO(i)-1; fClISOABALDO(i)=fClISOABALDO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABALDO2 + HO2 = ClISOABALDO + OH';
k(:,i) = KRO2HO2.*.50;
Gstr{i,1} = 'ClISOABALDO2'; Gstr{i,2} = 'HO2'; 
fClISOABALDO2(i)=fClISOABALDO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOABALDO(i)=fClISOABALDO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABALDO2 + HO2 = ClISOABALDOOH';
k(:,i) = KRO2HO2.*.50;
Gstr{i,1} = 'ClISOABALDO2'; Gstr{i,2} = 'HO2'; 
fClISOABALDO2(i)=fClISOABALDO2(i)-1; fHO2(i)=fHO2(i)-1; fClISOABALDOOH(i)=fClISOABALDOOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABALDO = ClISO5ABDALD + HO2';
k(:,i) = 0.5.*KDEC;
Gstr{i,1} = 'ClISOABALDO'; 
fClISOABALDO(i)=fClISOABALDO(i)-1; fClISO5ABDALD(i)=fClISO5ABDALD(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOABALDO = ClISOABDALD + CHOCL + HO2';
k(:,i) = 0.5.*KDEC;
Gstr{i,1} = 'ClISOABALDO'; 
fClISOABALDO(i)=fClISOABALDO(i)-1; fClISOABDALD(i)=fClISOABDALD(i)+1; fCHOCL(i)=fCHOCL(i)+1; fHO2(i)=fHO2(i)+1; 

% ISOPOOH oxidation
i=i+1;
Rnames{i} = 'ClISOPAOOH + Cl = ClISOPAO2 + HCl';
k(:,i) = 7.6e-11.*exp(500./T);
Gstr{i,1} = 'ClISOPAOOH'; Gstr{i,2} = 'Cl'; 
fClISOPAOOH(i)=fClISOPAOOH(i)-1; fCl(i)=fCl(i)-1; fClISOPAO2(i)=fClISOPAO2(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBOOH + Cl = DIClIEPOX + OH';
k(:,i) = 7.6e-11.*exp(500./T);
Gstr{i,1} = 'ClISOPBOOH'; Gstr{i,2} = 'Cl'; 
fClISOPBOOH(i)=fClISOPBOOH(i)-1; fCl(i)=fCl(i)-1; fDIClIEPOX(i)=fDIClIEPOX(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCOOH + Cl = ClISOPCO2 + HCl';
k(:,i) = 7.6e-11.*exp(500./T);
Gstr{i,1} = 'ClISOPCOOH'; Gstr{i,2} = 'Cl'; 
fClISOPCOOH(i)=fClISOPCOOH(i)-1; fCl(i)=fCl(i)-1; fClISOPCO2(i)=fClISOPCO2(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDOOH + Cl = DIClIEPOX + OH';
k(:,i) = 7.6e-11.*exp(500./T);
Gstr{i,1} = 'ClISOPDOOH'; Gstr{i,2} = 'Cl'; 
fClISOPDOOH(i)=fClISOPDOOH(i)-1; fCl(i)=fCl(i)-1; fDIClIEPOX(i)=fDIClIEPOX(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAOOH + OH = ClISOPAO2';
k(:,i) = 1.54e-10.*0.02;
Gstr{i,1} = 'ClISOPAOOH'; Gstr{i,2} = 'OH'; 
fClISOPAOOH(i)=fClISOPAOOH(i)-1; fOH(i)=fOH(i)-1; fClISOPAO2(i)=fClISOPAO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAOOH + OH = CMBA + OH';
k(:,i) = 1.54e-10.*0.05;
Gstr{i,1} = 'ClISOPAOOH'; Gstr{i,2} = 'OH'; 
fClISOPAOOH(i)=fClISOPAOOH(i)-1; fOH(i)=fOH(i)-1; fCMBA(i)=fCMBA(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPAOOH + OH = ClIEPOX + OH';
k(:,i) = 1.54e-10.*0.93;
Gstr{i,1} = 'ClISOPAOOH'; Gstr{i,2} = 'OH'; 
fClISOPAOOH(i)=fClISOPAOOH(i)-1; fOH(i)=fOH(i)-1; fClIEPOX(i)=fClIEPOX(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBOOH + OH = ClISOPBO2';
k(:,i) = 5e-11.*0.08;
Gstr{i,1} = 'ClISOPBOOH'; Gstr{i,2} = 'OH'; 
fClISOPBOOH(i)=fClISOPBOOH(i)-1; fOH(i)=fOH(i)-1; fClISOPBO2(i)=fClISOPBO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBOOH + OH = ClIEPOX + OH';
k(:,i) = 5e-11.*0.92;
Gstr{i,1} = 'ClISOPBOOH'; Gstr{i,2} = 'OH'; 
fClISOPBOOH(i)=fClISOPBOOH(i)-1; fOH(i)=fOH(i)-1; fClIEPOX(i)=fClIEPOX(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCOOH + OH = ClISOPCO2';
k(:,i) = 1.54e-10.*0.02;
Gstr{i,1} = 'ClISOPCOOH'; Gstr{i,2} = 'OH'; 
fClISOPCOOH(i)=fClISOPCOOH(i)-1; fOH(i)=fOH(i)-1; fClISOPCO2(i)=fClISOPCO2(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCOOH + OH = CMBA + OH';
k(:,i) = 1.54e-10.*0.05;
Gstr{i,1} = 'ClISOPCOOH'; Gstr{i,2} = 'OH'; 
fClISOPCOOH(i)=fClISOPCOOH(i)-1; fOH(i)=fOH(i)-1; fCMBA(i)=fCMBA(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCOOH + OH = ClIEPOX + OH';
k(:,i) = 1.54e-10.*0.93;
Gstr{i,1} = 'ClISOPCOOH'; Gstr{i,2} = 'OH'; 
fClISOPCOOH(i)=fClISOPCOOH(i)-1; fOH(i)=fOH(i)-1; fClIEPOX(i)=fClIEPOX(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDOOH + OH = CMBO + OH';
k(:,i) = 1.15e-10.*0.22;
Gstr{i,1} = 'ClISOPDOOH'; Gstr{i,2} = 'OH'; 
fClISOPDOOH(i)=fClISOPDOOH(i)-1; fOH(i)=fOH(i)-1; fCMBO(i)=fCMBO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDOOH + OH = ClIEPOX + OH';
k(:,i) = 1.15e-10.*0.75;
Gstr{i,1} = 'ClISOPDOOH'; Gstr{i,2} = 'OH'; 
fClISOPDOOH(i)=fClISOPDOOH(i)-1; fOH(i)=fOH(i)-1; fClIEPOX(i)=fClIEPOX(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDOOH + OH = ClISOPDO2';
k(:,i) = 1.15e-10.*0.03;
Gstr{i,1} = 'ClISOPDOOH'; Gstr{i,2} = 'OH'; 
fClISOPDOOH(i)=fClISOPDOOH(i)-1; fOH(i)=fOH(i)-1; fClISOPDO2(i)=fClISOPDO2(i)+1; 

i=i+1;
Rnames{i} = 'ISOPAOOH + Cl = ISOPAO2 + HCl';
k(:,i) = 7.6e-11.*exp(500./T);
Gstr{i,1} = 'ISOPAOOH'; Gstr{i,2} = 'Cl'; 
fISOPAOOH(i)=fISOPAOOH(i)-1; fCl(i)=fCl(i)-1; fISOPAO2(i)=fISOPAO2(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'ISOPBOOH + Cl = ClIEPOX + OH';
k(:,i) = 0.95.*7.6e-11.*exp(500./T);
Gstr{i,1} = 'ISOPBOOH'; Gstr{i,2} = 'Cl'; 
fISOPBOOH(i)=fISOPBOOH(i)-1; fCl(i)=fCl(i)-1; fClIEPOX(i)=fClIEPOX(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ISOPBOOH + Cl = ISOPBO2 + HCl';
k(:,i) = 0.025.*7.6e-11.*exp(500./T);
Gstr{i,1} = 'ISOPBOOH'; Gstr{i,2} = 'Cl'; 
fISOPBOOH(i)=fISOPBOOH(i)-1; fCl(i)=fCl(i)-1; fISOPBO2(i)=fISOPBO2(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'ISOPBOOH + Cl = ISOPBOOHABS + HCl + OH';
k(:,i) = 0.025.*7.6e-11.*exp(500./T);
Gstr{i,1} = 'ISOPBOOH'; Gstr{i,2} = 'Cl'; 
fISOPBOOH(i)=fISOPBOOH(i)-1; fCl(i)=fCl(i)-1; fISOPBOOHABS(i)=fISOPBOOHABS(i)+1; fHCl(i)=fHCl(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ISOPCOOH + Cl = ISOPCO2 + HCl';
k(:,i) = 7.6e-11.*exp(500./T);
Gstr{i,1} = 'ISOPCOOH'; Gstr{i,2} = 'Cl'; 
fISOPCOOH(i)=fISOPCOOH(i)-1; fCl(i)=fCl(i)-1; fISOPCO2(i)=fISOPCO2(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'ISOPDOOH + Cl = ClIEPOX + OH';
k(:,i) = 0.95.*7.6e-11.*exp(500./T);
Gstr{i,1} = 'ISOPDOOH'; Gstr{i,2} = 'Cl'; 
fISOPDOOH(i)=fISOPDOOH(i)-1; fCl(i)=fCl(i)-1; fClIEPOX(i)=fClIEPOX(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ISOPDOOH + Cl = ISOPDO2 + HCl';
k(:,i) = 0.01.*7.6e-11.*exp(500./T);
Gstr{i,1} = 'ISOPDOOH'; Gstr{i,2} = 'Cl'; 
fISOPDOOH(i)=fISOPDOOH(i)-1; fCl(i)=fCl(i)-1; fISOPDO2(i)=fISOPDO2(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'ISOPDOOH + Cl = HCOC5 + OH +  HCl';
k(:,i) = 0.02.*7.6e-11.*exp(500./T);
Gstr{i,1} = 'ISOPDOOH'; Gstr{i,2} = 'Cl'; 
fISOPDOOH(i)=fISOPDOOH(i)-1; fCl(i)=fCl(i)-1; fHCOC5(i)=fHCOC5(i)+1; fOH(i)=fOH(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'ISOPDOOH + Cl = C5OOHKET + HO2 +  HCl';
k(:,i) = 0.02.*7.6e-11.*exp(500./T);
Gstr{i,1} = 'ISOPDOOH'; Gstr{i,2} = 'Cl'; 
fISOPDOOH(i)=fISOPDOOH(i)-1; fCl(i)=fCl(i)-1; fC5OOHKET(i)=fC5OOHKET(i)+1; fHO2(i)=fHO2(i)+1; fHCl(i)=fHCl(i)+1; 

%=====================
%in MCM
%=====================
i = i + 1;
Rnames{i} = 'Cl + CH4 = CH3O2 + HCl';
k(:,i) = 6.6e-12.*exp(-1240./T);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CH4'; 
fCl(i) = -1; fCH4(i) = -1; fCH3O2(i) = 1; fHCl(i) = 1; 

% i=i+1;
% Rnames{i} = 'Cl + C2H6 = C2H5O2 + HCl';
% k(:,i) = 8.3e-11.*exp(-100./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C2H6'; 
% fCl(i)=-1; fC2H6(i)=-1; fC2H5O2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + C3H8 = IC3H7O2 + HCl';
% k(:,i) = 1.4e-10.*0.43.*exp(75./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C3H8'; 
% fCl(i)=-1; fC3H8(i)=-1; fIC3H7O2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + C3H8 = NC3H7O2 + HCl';
% k(:,i) = 1.4e-10.*0.59.*exp(-90./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C3H8'; 
% fCl(i)=-1; fC3H8(i)=-1; fNC3H7O2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + NC4H10 = NC4H9O2 + HCl';
% k(:,i) = 2.05e-10.*0.44.*exp(-120./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC4H10'; 
% fCl(i)=-1; fNC4H10(i)=-1; fNC4H9O2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + NC4H10 = SC4H9O2 + HCl';  %qjc, typo, missing +HCl
% k(:,i) = 2.05e-10.*0.59.*exp(55./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC4H10'; 
% fCl(i)=-1; fNC4H10(i)=-1; fSC4H9O2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + IC4H10 = IC4H9O2 + HCl';
% k(:,i) = 1.43e-10.*0.564;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IC4H10'; 
% fCl(i)=-1; fIC4H10(i)=-1; fIC4H9O2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + IC4H10 = TC4H9O2 + HCl';
% k(:,i) = 1.43e-10.*0.436;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IC4H10'; 
% fCl(i)=-1; fIC4H10(i)=-1; fTC4H9O2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + NC5H12 = PEAO2 + HCl';
% k(:,i) = 2.80e-10.*0.222;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC5H12'; 
% fCl(i)=-1; fNC5H12(i)=-1; fPEAO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + NC5H12 = PEBO2 + HCl';
% k(:,i) = 2.80e-10.*0.558;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC5H12'; 
% fCl(i)=-1; fNC5H12(i)=-1; fPEBO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + NC5H12 = PECO2 + HCl';
% k(:,i) = 2.80e-10.*0.220;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC5H12'; 
% fCl(i)=-1; fNC5H12(i)=-1; fPECO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + IC5H12 = IPEAO2 + HCl';
% k(:,i) = 2.20e-10.*0.408;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IC5H12'; 
% fCl(i)=-1; fIC5H12(i)=-1; fIPEAO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + IC5H12 = IPEBO2 + HCl';
% k(:,i) = 2.20e-10.*0.342;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IC5H12'; 
% fCl(i)=-1; fIC5H12(i)=-1; fIPEBO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + IC5H12 = IPECO2 + HCl';
% k(:,i) = 2.20e-10.*0.250;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IC5H12'; 
% fCl(i)=-1; fIC5H12(i)=-1; fIPECO2(i)=1; fHCl(i) = 1;
% 
% % i=i+1;
% % Rnames{i} = 'Cl + NEOP = NEOPO2 + HCl';
% % k(:,i) = 1.11e-10;
% % Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NEOP'; 
% % fCl(i)=-1; fNEOP(i)=-1; fNEOPO2(i)=1;fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + NC6H14 = HEXAO2 + HCl';
% k(:,i) = 3.40e-10.*0.182;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC6H14'; 
% fCl(i)=-1; fNC6H14(i)=-1; fHEXAO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + NC6H14 = HEXBO2 + HCl';
% k(:,i) = 3.40e-10.*0.457;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC6H14'; 
% fCl(i)=-1; fNC6H14(i)=-1; fHEXBO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + NC6H14 = HEXCO2 + HCl';
% k(:,i) = 3.40e-10.*0.361;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC6H14'; 
% fCl(i)=-1; fNC6H14(i)=-1; fHEXCO2(i)=1; fHCl(i) = 1;

% i=i+1;
% Rnames{i} = 'Cl + M2PE = M2PEAO2 + HCl';
% k(:,i) = 2.90e-10.*0.321;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M2PE'; 
% fCl(i)=-1; fM2PE(i)=-1; fM2PEAO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + M2PE = M2PEBO2 + HCl';
% k(:,i) = 2.90e-10.*0.269;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M2PE'; 
% fCl(i)=-1; fM2PE(i)=-1; fM2PEBO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + M2PE = M2PECO2 + HCl';
% k(:,i) = 2.90e-10.*0.213;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M2PE'; 
% fCl(i)=-1; fM2PE(i)=-1; fM2PECO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + M2PE = M2PEDO2 + HCl';
% k(:,i) = 2.90e-10.*0.197;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M2PE'; 
% fCl(i)=-1; fM2PE(i)=-1; fM2PEDO2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M3PE = M3PEAO2 + HCl';
% k(:,i) = 2.80e-10.*0.317;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M3PE'; 
% fCl(i)=-1; fM3PE(i)=-1; fM3PEAO2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M3PE = M3PEBO2 + HCl';
% k(:,i) = 2.80e-10.*0.530;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M3PE'; 
% fCl(i)=-1; fM3PE(i)=-1; fM3PEBO2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M3PE = M3PECO2 + HCl';
% k(:,i) = 2.80e-10.*0.153;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M3PE'; 
% fCl(i)=-1; fM3PE(i)=-1; fM3PECO2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M22C4 = M22C43O2 + HCl';
% k(:,i) = 1.71e-10.*0.461;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M22C4'; 
% fCl(i)=-1; fM22C4(i)=-1; fM22C43O2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M22C4 = M22C4O2 + HCl';
% k(:,i) = 1.71e-10.*0.154;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M22C4'; 
% fCl(i)=-1; fM22C4(i)=-1; fM22C4O2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M22C4 = M33C4O2 + HCl';
% k(:,i) = 1.71e-10.*0.386;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M22C4'; 
% fCl(i)=-1; fM22C4(i)=-1; fM33C4O2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M23C4 = M23C43O2 + HCl';
% k(:,i) = 2.30e-10.*0.478;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M23C4'; 
% fCl(i)=-1; fM23C4(i)=-1; fM23C43O2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M23C4 = M23C4O2 + HCl';
% k(:,i) = 2.30e-10.*0.522;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M23C4'; 
% fCl(i)=-1; fM23C4(i)=-1; fM23C4O2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + NC7H16 = HEPTO2 + HCl';
% k(:,i) = 3.90e-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC7H16'; 
% fCl(i)=-1; fNC7H16(i)=-1; fHEPTO2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M2HEX = M2HEXAO2 + HCl';
% k(:,i) = 3.50e-10.*0.779;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M2HEX'; 
% fCl(i)=-1; fM2HEX(i)=-1; fM2HEXAO2(i)=1;fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M2HEX = M2HEXBO2 + HCl';
% k(:,i) = 3.50e-10.*0.221;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M2HEX'; 
% fCl(i)=-1; fM2HEX(i)=-1; fM2HEXBO2(i)=1;fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M3HEX = M3HEXAO2 + HCl';
% k(:,i) = 3.11e-10.*0.793;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M3HEX'; 
% fCl(i)=-1; fM3HEX(i)=-1; fM3HEXAO2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + M3HEX = M3HEXBO2 + HCl';
% k(:,i) = 3.11e-10.*0.207;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'M3HEX'; 
% fCl(i)=-1; fM3HEX(i)=-1; fM3HEXBO2(i)=1; fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + NC8H18 = OCTO2 + HCl';
% k(:,i) = 4.60e-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC8H18'; 
% fCl(i)=-1; fNC8H18(i)=-1; fOCTO2(i)=1;fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + NC9H20 = NONO2 + HCl';
% k(:,i) = 4.80e-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC9H20'; 
% fCl(i)=-1; fNC9H20(i)=-1; fNONO2(i)=1;fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + NC10H22 = DECO2 + HCl';
% k(:,i) = 5.55e-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC10H22'; 
% fCl(i)=-1; fNC10H22(i)=-1; fDECO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + NC11H24 = UDECO2 + HCl';
% k(:,i) = 6.17e-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC11H24'; 
% fCl(i)=-1; fNC11H24(i)=-1; fUDECO2(i)=1; fHCl(i) = 1;
% 
% i=i+1;
% Rnames{i} = 'Cl + NC12H26 = DDECO2 + HCl';
% k(:,i) = 6.74e-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC12H26'; 
% fCl(i)=-1; fNC12H26(i)=-1; fDDECO2(i)=1;fHCl(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + CHEX = CHEXO2 + HCl';
% k(:,i) = 3.50e-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CHEX'; 
% fCl(i)=-1; fCHEX(i)=-1; fCHEXO2(i)=1; fHCl(i) = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%qjc, Added from Xue et al. 2015 GMD
%IUPAC (http://iupac-aeris.ipsl.fr/index.html)

%Aldehydes + Cl
i = i + 1;
Rnames{i} = 'Cl + HCHO = CO + HCl + HO2';
k(:,i) = 8.1E-11.*exp(-34./T);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HCHO'; 
fCl(i) = -1; fHCHO(i) = -1; fCO(i) = 1; fHCl(i) = 1; fHO2(i) = 1; 

i = i + 1;
Rnames{i} = 'Cl + CH3CHO = HCl + CH3CO3';
k(:,i) = 7.92E-11;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CH3CHO'; 
fCl(i) = -1; fCH3CHO(i) = -1; fHCl(i) = 1; fCH3CO3(i) = 1; 

i = i + 1;
Rnames{i} = 'Cl + CH3CHO = HCl + HCOCH2O2';
k(:,i) = 8.E-13;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CH3CHO'; 
fCl(i) = -1; fCH3CHO(i) = -1; fHCl(i) = 1; fHCOCH2O2(i) = 1; 

% i = i + 1;
% Rnames{i} = ' Cl + C2H5CHO = HCl + C2H5CO3';
% k(:,i) = 1.3E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C2H5CHO'; 
% fCl(i) = -1; fC2H5CHO(i) = -1; fHCl(i) = 1; fC2H5CO3(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + C3H7CHO = HCl + BUTALO2';
% k(:,i) = 5.5E-12.*exp(410./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C3H7CHO'; 
% fCl(i) = -1; fC3H7CHO(i) = -1; fHCl(i) = 1; fBUTALO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + C3H7CHO = HCl + C3H7CO3';
% k(:,i) = 3.1E-11.*exp(410./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C3H7CHO'; 
% fCl(i) = -1; fC3H7CHO(i) = -1; fHCl(i) = 1; fC3H7CO3(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPRCHO = HCl + IBUTALBO2';
% k(:,i) = 2.2E-12.*exp(410./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPRCHO'; 
% fCl(i) = -1; fIPRCHO(i) = -1; fHCl(i) = 1; fIBUTALBO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPRCHO = HCl + IBUTALCO2';
% k(:,i) = 2.4E-12.*exp(410./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPRCHO'; 
% fCl(i) = -1; fIPRCHO(i) = -1; fHCl(i) = 1; fIBUTALCO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPRCHO = HCl + IPRCO3';
% k(:,i) = 3.7E-11.*exp(410./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPRCHO'; 
% fCl(i) = -1; fIPRCHO(i) = -1; fHCl(i) = 1; fIPRCO3(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + C4H9CHO = HCl + C4CHOBO2';
% k(:,i) = 7.3E-12.*exp(448./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C4H9CHO'; 
% fCl(i) = -1; fC4H9CHO(i) = -1; fHCl(i) = 1; fC4CHOBO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + C4H9CHO = HCl + C4H9CO3';
% k(:,i) = 3.1E-11.*exp(448./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C4H9CHO'; 
% fCl(i) = -1; fC4H9CHO(i) = -1; fHCl(i) = 1; fC4H9CO3(i) = 1; 

% i = i + 1;
% Rnames{i} = 'Cl + BENZAL = HCl + C6H5CO3';
% k(:,i) = 3.6E-11.*exp(225./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'BENZAL'; 
% fCl(i) = -1; fBENZAL(i) = -1; fHCl(i) = 1; fC6H5CO3(i) = 1; 

% i = i + 1;
% Rnames{i} = ' Cl + GLYOX = HCl + HO2 + CO + CO';
% k(:,i) = 4.86E-11.*exp(-34./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'GLYOX'; 
% fCl(i) = -1; fGLYOX(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fCO(i) = 2; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + GLYOX = HCl + HCOCO3';
% k(:,i) = 3.24E-11.*exp(-34./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'GLYOX'; 
% fCl(i) = -1; fGLYOX(i) = -1; fHCl(i) = 1; fHCOCO3(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + MGLYOX = HCl + CH3CO3 + CO';
% k(:,i) = 8.0E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MGLYOX'; 
% fCl(i) = -1; fMGLYOX(i) = -1; fHCl(i) = 1; fCH3CO3(i) = 1; fCO(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = 'Cl + MACR = HCl + MACO3';
% k(:,i) = 4.86E-11.*0.45.*exp(380./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MACR'; 
% fCl(i) = -1; fMACR(i) = -1; fHCl(i) = 1; fMACO3(i) = 1; 

%Ketones+Cl
% i = i + 1;
% Rnames{i} = ' Cl + CH3COCH3 = HCl + CH3COCH2O2';
% k(:,i) = 1.5E-11.*exp(-590./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CH3COCH3'; 
% fCl(i) = -1; fCH3COCH3(i) = -1; fHCl(i) = 1; fCH3COCH2O2(i) = 1; 

% i = i + 1;
% Rnames{i} = 'Cl + MEK = HCl + MEKAO2';
% k(:,i) = 1.4E-11.*exp(80./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MEK'; 
% fCl(i) = -1; fMEK(i) = -1; fHCl(i) = 1; fMEKAO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = 'Cl + MEK = HCl + MEKBO2';
% k(:,i) = 1.4E-11.*exp(80./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MEK'; 
% fCl(i) = -1; fMEK(i) = -1; fHCl(i) = 1; fMEKBO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = 'Cl + MEK = HCl + MEKCO2';
% k(:,i) = 2.4E-12.*exp(80./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MEK'; 
% fCl(i) = -1; fMEK(i) = -1; fHCl(i) = 1; fMEKCO2(i) = 1; 

% i = i + 1;
% Rnames{i} = ' Cl + MPRK = HCl + CO2C54O2';
% k(:,i) = 9.6E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MPRK'; 
% fCl(i) = -1; fMPRK(i) = -1; fHCl(i) = 1; fCO2C54O2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + MPRK = HCl + MPRKAO2';
% k(:,i) = 2.1E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MPRK'; 
% fCl(i) = -1; fMPRK(i) = -1; fHCl(i) = 1; fMPRKAO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + DIEK = HCl + DIEKAO2';
% k(:,i) = 2.4E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'DIEK'; 
% fCl(i) = -1; fDIEK(i) = -1; fHCl(i) = 1; fDIEKAO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + DIEK = HCl + DIEKBO2';
% k(:,i) = 2.4E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'DIEK'; 
% fCl(i) = -1; fDIEK(i) = -1; fHCl(i) = 1; fDIEKBO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + MIPK = HCl + MIPKAO2';
% k(:,i) = 3.5E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MIPK'; 
% fCl(i) = -1; fMIPK(i) = -1; fHCl(i) = 1; fMIPKAO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + MIPK = HCl + MIPKBO2';
% k(:,i) = 3.2E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MIPK'; 
% fCl(i) = -1; fMIPK(i) = -1; fHCl(i) = 1; fMIPKBO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + HEX2ONE = HCl + HEX2ONAO2';
% k(:,i) = 1.56E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HEX2ONE'; 
% fCl(i) = -1; fHEX2ONE(i) = -1; fHCl(i) = 1; fHEX2ONAO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + HEX2ONE = HCl + HEX2ONBO2';
% k(:,i) = 3.5E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HEX2ONE'; 
% fCl(i) = -1; fHEX2ONE(i) = -1; fHCl(i) = 1; fHEX2ONBO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + HEX2ONE = HCl + HEX2ONCO2';
% k(:,i) = 2.7E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HEX2ONE'; 
% fCl(i) = -1; fHEX2ONE(i) = -1; fHCl(i) = 1; fHEX2ONCO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + HEX3ONE = HCl + HEX3ONAO2';
% k(:,i) = 1.05E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HEX3ONE'; 
% fCl(i) = -1; fHEX3ONE(i) = -1; fHCl(i) = 1; fHEX3ONAO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + HEX3ONE = HCl + HEX3ONBO2';
% k(:,i) = 2.3E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HEX3ONE'; 
% fCl(i) = -1; fHEX3ONE(i) = -1; fHCl(i) = 1; fHEX3ONBO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + HEX3ONE = HCl + HEX3ONCO2';
% k(:,i) = 1.8E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HEX3ONE'; 
% fCl(i) = -1; fHEX3ONE(i) = -1; fHCl(i) = 1; fHEX3ONCO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + HEX3ONE = HCl + HEX3ONDO2';
% k(:,i) = 1.8E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HEX3ONE'; 
% fCl(i) = -1; fHEX3ONE(i) = -1; fHCl(i) = 1; fHEX3ONDO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + MIBK = HCl + MIBKAO2';
% k(:,i) = 3.1E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MIBK'; 
% fCl(i) = -1; fMIBK(i) = -1; fHCl(i) = 1; fMIBKAO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + MIBK = HCl + MIBKBO2';
% k(:,i) = 3.0E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MIBK'; 
% fCl(i) = -1; fMIBK(i) = -1; fHCl(i) = 1; fMIBKBO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + MTBK = HCl + MTBKO2';
% k(:,i) = 2.9E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MTBK'; 
% fCl(i) = -1; fMTBK(i) = -1; fHCl(i) = 1; fMTBKO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + CYHEXONE = HCl + CYHXONAO2';
% k(:,i) = 1.3E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CYHEXONE'; 
% fCl(i) = -1; fCYHEXONE(i) = -1; fHCl(i) = 1; fCYHXONAO2(i) = 1;

%Alcohols+Cl
i = i + 1;
Rnames{i} = 'Cl + CH3OH = HCl + HO2 + HCHO';
k(:,i) = 7.1E-11.*exp(-75./T);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CH3OH'; 
fCl(i) = -1; fCH3OH(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fHCHO(i) = 1;

% i = i + 1;
% Rnames{i} = 'Cl + C2H5OH = HCl + HO2 + CH3CHO';
% k(:,i) = 5.5E-11.*exp(155./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C2H5OH'; 
% fCl(i) = -1; fC2H5OH(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fCH3CHO(i) = 1;
% 
% i = i + 1;
% Rnames{i} = 'Cl + C2H5OH = HCl + HOCH2CH2O2';
% k(:,i) = 4.8E-12.*exp(155./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C2H5OH'; 
% fCl(i) = -1; fC2H5OH(i) = -1; fHCl(i) = 1; fHOCH2CH2O2(i) = 1;

% i = i + 1;
% Rnames{i} = ' Cl + NPROPOL = HCl + HO2 + C2H5CHO';
% k(:,i) = 1.6E-11.*exp(525./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NPROPOL'; 
% fCl(i) = -1; fNPROPOL(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fC2H5CHO(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + NPROPOL = HCl + HO1C3O2';
% k(:,i) = 4.1E-12.*exp(525./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NPROPOL'; 
% fCl(i) = -1; fNPROPOL(i) = -1; fHCl(i) = 1; fHO1C3O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + NPROPOL = HCl + HYPROPO2';
% k(:,i) = 6.8E-12.*exp(525./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NPROPOL'; 
% fCl(i) = -1; fNPROPOL(i) = -1; fHCl(i) = 1; fHYPROPO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPROPOL = HCl + HO2 + CH3COCH3';
% k(:,i) = 7.4E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPROPOL'; 
% fCl(i) = -1; fIPROPOL(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fCH3COCH3(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPROPOL = HCl + IPROPOLO2';
% k(:,i) = 1.3E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPROPOL'; 
% fCl(i) = -1; fIPROPOL(i) = -1; fHCl(i) = 1; fIPROPOLO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + NBUTOL = HCl + HO2 + C3H7CHO';
% k(:,i) = 1.25E-11.*exp(550./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NBUTOL'; 
% fCl(i) = -1; fNBUTOL(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fC3H7CHO(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + NBUTOL = HCl + NBUTOLAO2';
% k(:,i) = 1.12E-11.*exp(550./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NBUTOL'; 
% fCl(i) = -1; fNBUTOL(i) = -1; fHCl(i) = 1; fNBUTOLAO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + NBUTOL = HCl + NBUTOLBO2';
% k(:,i) = 1.12E-11.*exp(550./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NBUTOL'; 
% fCl(i) = -1; fNBUTOL(i) = -1; fHCl(i) = 1; fNBUTOLBO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + BUT2OL = HCl + BUT2OLO2';
% k(:,i) = 5.37E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'BUT2OL'; 
% fCl(i) = -1; fBUT2OL(i) = -1; fHCl(i) = 1; fBUT2OLO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + BUT2OL = HCl + HO2 + MEK';
% k(:,i) = 9.51E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'BUT2OL'; 
% fCl(i) = -1; fBUT2OL(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fMEK(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IBUTOL = HCl + IBUTOLBO2';
% k(:,i) = 2.6E-11.*exp(352./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IBUTOL'; 
% fCl(i) = -1; fIBUTOL(i) = -1; fHCl(i) = 1; fIBUTOLBO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IBUTOL = HCl + IBUTOLCO2';
% k(:,i) = 4.2E-12.*exp(352./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IBUTOL'; 
% fCl(i) = -1; fIBUTOL(i) = -1; fHCl(i) = 1; fIBUTOLCO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IBUTOL = HCl + HO2 + IPRCHO';
% k(:,i) = 1.6E-11.*exp(352./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IBUTOL'; 
% fCl(i) = -1; fIBUTOL(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fIPRCHO(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + TBUTOL = HCl + TBUTOLO2';
% k(:,i) = 2.4E-11.*exp(-121./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'TBUTOL'; 
% fCl(i) = -1; fTBUTOL(i) = -1; fHCl(i) = 1; fTBUTOLO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + TBUTOL = HCl + TC4H9O';
% k(:,i) = 3.1E-12.*exp(-121./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'TBUTOL'; 
% fCl(i) = -1; fTBUTOL(i) = -1; fHCl(i) = 1; fTC4H9O(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + PECOH = HCl + HO2 + DIEK';
% k(:,i) = 9.1E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PECOH'; 
% fCl(i) = -1; fPECOH(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fDIEK(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + PECOH = HCl + HO3C5O2';
% k(:,i) = 1.5E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PECOH'; 
% fCl(i) = -1; fPECOH(i) = -1; fHCl(i) = 1; fHO3C5O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + PECOH = HCl + PE2ENEBO2';
% k(:,i) = 1.0E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PECOH'; 
% fCl(i) = -1; fPECOH(i) = -1; fHCl(i) = 1; fPE2ENEBO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPEAOH = HCl + HO2 + BUT2CHO';
% k(:,i) = 5.5E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPEAOH'; 
% fCl(i) = -1; fIPEAOH(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fBUT2CHO(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPEAOH = HCl + HM2C43O2';
% k(:,i) = 4.9E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPEAOH'; 
% fCl(i) = -1; fIPEAOH(i) = -1; fHCl(i) = 1; fHM2C43O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPEAOH = HCl + M2BUOL2O2';
% k(:,i) = 8.7E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPEAOH'; 
% fCl(i) = -1; fIPEAOH(i) = -1; fHCl(i) = 1; fM2BUOL2O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + ME3BUOL = HCl + HO2 + C3ME3CHO';
% k(:,i) = 6.45E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ME3BUOL'; 
% fCl(i) = -1; fME3BUOL(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fC3ME3CHO(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + ME3BUOL = HCl + HM33C3O2';
% k(:,i) = 1.02E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ME3BUOL'; 
% fCl(i) = -1; fME3BUOL(i) = -1; fHCl(i) = 1; fHM33C3O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + ME3BUOL = HCl + ME3BUOLO2';
% k(:,i) = 5.78E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ME3BUOL'; 
% fCl(i) = -1; fME3BUOL(i) = -1; fHCl(i) = 1; fME3BUOLO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPECOH = HCl + HO2M2C4O2';
% k(:,i) = 6.58E-12;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPECOH'; 
% fCl(i) = -1; fIPECOH(i) = -1; fHCl(i) = 1; fHO2M2C4O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPECOH = HCl + ME2BU2OLO2';
% k(:,i) = 4.62E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPECOH'; 
% fCl(i) = -1; fIPECOH(i) = -1; fHCl(i) = 1; fME2BU2OLO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPECOH = HCl + PROL11MO2';
% k(:,i) = 1.31E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPECOH'; 
% fCl(i) = -1; fIPECOH(i) = -1; fHCl(i) = 1; fPROL11MO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPEBOH = HCl + H2M3C4O2';
% k(:,i) = 1.57E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPEBOH'; 
% fCl(i) = -1; fIPEBOH(i) = -1; fHCl(i) = 1; fH2M3C4O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPEBOH = HCl + ME2BUOLO2';
% k(:,i) = 9.82E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPEBOH'; 
% fCl(i) = -1; fIPEBOH(i) = -1; fHCl(i) = 1; fME2BUOLO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPEBOH = HCl + HO2 + MIPK';
% k(:,i) = 9.82E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPEBOH'; 
% fCl(i) = -1; fIPEBOH(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fMIPK(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + CYHEXOL = HCl + CYHEXOLAO2';
% k(:,i) = 2.2E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CYHEXOL'; 
% fCl(i) = -1; fCYHEXOL(i) = -1; fHCl(i) = 1; fCYHEXOLAO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + CYHEXOL = HCl + HO2 + CYHEXONE';
% k(:,i) = 7.9E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CYHEXOL'; 
% fCl(i) = -1; fCYHEXOL(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fCYHEXONE(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + MIBKAOH = HCl + MIBKAOHAO2';
% k(:,i) = 3.4E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MIBKAOH'; 
% fCl(i) = -1; fMIBKAOH(i) = -1; fHCl(i) = 1; fMIBKAOHAO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + MIBKAOH = HCl + MIBKAOHBO2';
% k(:,i) = 1.3E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MIBKAOH'; 
% fCl(i) = -1; fMIBKAOH(i) = -1; fHCl(i) = 1; fMIBKAOHBO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + MIBKAOH = HCl + MIBKHO4O2';
% k(:,i) = 1.8E-12;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MIBKAOH'; 
% fCl(i) = -1; fMIBKAOH(i) = -1; fHCl(i) = 1; fMIBKHO4O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + ETHGLY = HCl + HO2 + HOCH2CHO';
% k(:,i) = 2.5E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ETHGLY'; 
% fCl(i) = -1; fETHGLY(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fHOCH2CHO(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + PROPGLY = HCl + HO2 + ACETOL';
% k(:,i) = 1.26E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PROPGLY'; 
% fCl(i) = -1; fPROPGLY(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fACETOL(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + PROPGLY = HCl + HO2 + CH3CHOHCHO';
% k(:,i) = 7.94E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PROPGLY'; 
% fCl(i) = -1; fPROPGLY(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fCH3CHOHCHO(i) = 1;

% i = i + 1;
% Rnames{i} = 'Cl + CRESOL = HCl + OXYL1O2';
% k(:,i) = 6.20E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CRESOL'; 
% fCl(i) = -1; fCRESOL(i) = -1; fHCl(i) = 1; fOXYL1O2(i) = 1;

%Organic acids + Cl
% i = i + 1;
% Rnames{i} = ' Cl + CH3OOH = HCl + CH3O2';
% k(:,i) = 3.54E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CH3OOH'; 
% fCl(i) = -1; fCH3OOH(i) = -1; fHCl(i) = 1; fCH3O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + CH3OOH = HCl + OH + HCHO';
% k(:,i) = 2.36E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CH3OOH'; 
% fCl(i) = -1; fCH3OOH(i) = -1; fHCl(i) = 1; fHO2(i) = 1; fHCHO(i) = 1;

i = i + 1;
Rnames{i} = 'Cl + HCOOH = HCl + HO2';
k(:,i) = 1.9E-13;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HCOOH'; 
fCl(i) = -1; fHCOOH(i) = -1; fHCl(i) = 1; fHO2(i) = 1; 

i = i + 1;
Rnames{i} = 'Cl + CH3CO2H = HCl + CH3O2';
k(:,i) = 2.65E-14;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CH3CO2H'; 
fCl(i) = -1; fCH3CO2H(i) = -1; fHCl(i) = 1; fCH3O2(i) = 1; 

% i = i + 1;
% Rnames{i} = ' Cl + PROPACID = HCl + C2H5O2';
% k(:,i) = 3.96E-14;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PROPACID'; 
% fCl(i) = -1; fPROPACID(i) = -1; fHCl(i) = 1; fC2H5O2(i) = 1; 

%Organic nitrates + Cl
% i = i + 1;
% Rnames{i} = ' Cl + CH3NO3 = HCl + NO2 + HCHO';
% k(:,i) = 2.4E-13;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CH3NO3'; 
% fCl(i) = -1; fCH3NO3(i) = -1; fHCl(i) = 1; fNO2(i) = 1; fHCHO(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + C2H5NO3 = HCl + NO2 + CH3CHO';
% k(:,i) = 4.7E-12;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C2H5NO3'; 
% fCl(i) = -1; fC2H5NO3(i) = -1; fHCl(i) = 1; fNO2(i) = 1; fCH3CHO(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + NC3H7NO3 = HCl + NO2 + C2H5CHO';
% k(:,i) = 2.2E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC3H7NO3'; 
% fCl(i) = -1; fNC3H7NO3(i) = -1; fHCl(i) = 1; fNO2(i) = 1; fC2H5CHO(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + IC3H7NO3 = HCl + NO2 + CH3COCH3';
% k(:,i) = 3.8E-12;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IC3H7NO3'; 
% fCl(i) = -1; fIC3H7NO3(i) = -1; fHCl(i) = 1; fNO2(i) = 1; fCH3COCH3(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + NC4H9NO3 = HCl + NO2 + C3H7CHO';
% k(:,i) = 8.5E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NC4H9NO3'; 
% fCl(i) = -1; fNC4H9NO3(i) = -1; fHCl(i) = 1; fNO2(i) = 1; fC3H7CHO(i) = 1; 

%% Aromatics + Cl
% i = i + 1;
% Rnames{i} = 'Cl + TOLUENE = HCl + C6H5CH2O2';
% k(:,i) = 5.9E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'TOLUENE'; 
% fCl(i) = -1; fTOLUENE(i) = -1; fHCl(i) = 1; fC6H5CH2O2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = 'Cl + OXYL = HCl + OXYLO2';
% k(:,i) = 1.5E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'OXYL'; 
% fCl(i) = -1; fOXYL(i) = -1; fHCl(i) = 1; fOXYLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = 'Cl + MXYL = HCl + MXYLO2';
% k(:,i) = 1.7E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MXYL'; 
% fCl(i) = -1; fMXYL(i) = -1; fHCl(i) = 1; fMXYLO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = 'Cl + PXYL = HCl + PXYLO2';
% k(:,i) = 2.6E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PXYL'; 
% fCl(i) = -1; fPXYL(i) = -1; fHCl(i) = 1; fPXYLO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = 'Cl + EBENZ = HCl + C6H5C2H4O2';
% k(:,i) = 9.1E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'EBENZ'; 
% fCl(i) = -1; fEBENZ(i) = -1; fHCl(i) = 1; fC6H5C2H4O2(i) = 1;

% i = i + 1;
% Rnames{i} = ' Cl + PBENZ = HCl + PHC3O2';
% k(:,i) = 7.5E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PBENZ'; 
% fCl(i) = -1; fPBENZ(i) = -1; fHCl(i) = 1; fPHC3O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + IPBENZ = HCl + PHIC3O2';
% k(:,i) = 8.2E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'IPBENZ'; 
% fCl(i) = -1; fIPBENZ(i) = -1; fHCl(i) = 1; fPHIC3O2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + TM123B = HCl + TM123BO2';
% k(:,i) = 3.6E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'TM123B'; 
% fCl(i) = -1; fTM123B(i) = -1; fHCl(i) = 1; fTM123BO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + TM124B = HCl + TM124BO2';
% k(:,i) = 3.6E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'TM124B'; 
% fCl(i) = -1; fTM124B(i) = -1; fHCl(i) = 1; fTM124BO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + TM135B = HCl + TMBO2';
% k(:,i) = 3.1E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'TM135B'; 
% fCl(i) = -1; fTM135B(i) = -1; fHCl(i) = 1; fTMBO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + OETHTOL = HCl + ETOLO2';
% k(:,i) = 1.1E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'OETHTOL'; 
% fCl(i) = -1; fOETHTOL(i) = -1; fHCl(i) = 1; fETOLO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + METHTOL = HCl + ETOLO2';
% k(:,i) = 1.4E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'METHTOL'; 
% fCl(i) = -1; fMETHTOL(i) = -1; fHCl(i) = 1; fETOLO2(i) = 1;
% 
% i = i + 1;
% Rnames{i} = ' Cl + PETHTOL = HCl + ETOLO2';
% k(:,i) = 2.2E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PETHTOL'; 
% fCl(i) = -1; fPETHTOL(i) = -1; fHCl(i) = 1; fETOLO2(i) = 1;

%% Alkenes + Cl
i = i + 1;
Rnames{i} = 'Cl + C2H4 = CH2CLCH2O2';
k(:,i) = 1.0E-10;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C2H4'; 
fCl(i) = -1; fC2H4(i) = -1; fCH2CLCH2O2(i) = 1; 

i = i + 1;
Rnames{i} = 'Cl + C3H6 = HCl + C3H5O2';
k(:,i) = 2.7E-11;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C3H6'; 
fCl(i) = -1; fC3H6(i) = -1; fHCl(i) = 1; fC3H5O2(i) = 1; 

i = i + 1;
Rnames{i} = 'Cl + C3H6 = IPROCLO2';
k(:,i) = 1.35E-10;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C3H6'; 
fCl(i) = -1; fC3H6(i) = -1; fIPROCLO2(i) = 1; 

i = i + 1;
Rnames{i} = 'Cl + C3H6 = HYPROCLO2';
k(:,i) = 1.08E-10;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C3H6'; 
fCl(i) = -1; fC3H6(i) = -1; fHYPROCLO2(i) = 1; 

% i = i + 1;
% Rnames{i} = ' Cl + BUT1ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'BUT1ENE'; 
% fCl(i) = -1; fBUT1ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + TBUT2ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'TBUT2ENE'; 
% fCl(i) = -1; fTBUT2ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + CBUT2ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CBUT2ENE'; 
% fCl(i) = -1; fCBUT2ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + PENT1ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PENT1ENE'; 
% fCl(i) = -1; fPENT1ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + TPENT2ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'TPENT2ENE'; 
% fCl(i) = -1; fTPENT2ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + CPENT2ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CPENT2ENE'; 
% fCl(i) = -1; fCPENT2ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + HEX1ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HEX1ENE'; 
% fCl(i) = -1; fHEX1ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + ME2BUT1ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ME2BUT1ENE'; 
% fCl(i) = -1; fME2BUT1ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + ME3BUT1ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ME3BUT1ENE'; 
% fCl(i) = -1; fME3BUT1ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + ME2BUT2ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ME2BUT2ENE'; 
% fCl(i) = -1; fME2BUT2ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + THEX2ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'THEX2ENE'; 
% fCl(i) = -1; fTHEX2ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + CHEX2ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'CHEX2ENE'; 
% fCl(i) = -1; fCHEX2ENE(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = ' Cl + DM23BU2ENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'DM23BU2ENE'; 
% fCl(i) = -1; fDM23BU2ENE(i) = -1; fOLECLO2(i) = 1; 

% i = i + 1;
% Rnames{i} = 'Cl + STYRENE = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'STYRENE'; 
% fCl(i) = -1; fSTYRENE(i) = -1; fOLECLO2(i) = 1; 

% i = i + 1;
% Rnames{i} = 'Cl + MVK = OLECLO2';
% k(:,i) = 5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MVK'; 
% fCl(i) = -1; fMVK(i) = -1; fOLECLO2(i) = 1; 
% 
% i = i + 1;
% Rnames{i} = 'Cl + MACR = OLECLO2';
% k(:,i) = 0.55*5.86E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MACR'; 
% fCl(i) = -1; fMACR(i) = -1; fOLECLO2(i) = 1; 

% i = i + 1; %M40 % NOT USED BECAUSE WE'VE used Wennberg constant for Cl
% addition and abstraction!
% Rnames{i} = 'Cl + C5H8 = HCl + ISOPBO2'; %qjc, Only one representative RO2 isomer used; from F0AM
% k(:,i) = 1.28E-10.*exp(390./T);  % From Xue et al. 2015
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C5H8';
% fCl(i) = -1; fC5H8(i) = -1; fHCl(i) = 1; fISOPBO2(i) = 1;

%Alkyne + Cl
% i = i + 1;
% Rnames{i} = ' Cl + C2H2 = CLCHO + CO + HO2';
% k(:,i) = 4.97E-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C2H2'; 
% fCl(i) = -1; fC2H2(i) = -1; fCLCHO(i) = 1; fCO(i) = 1; fHO2(i) = 1;

%=========================================
% Photolysis
%=========================================
% Sherwen et al. 2016 ACP
i = i + 1; %J24
Rnames{i} = 'Cl2 + hv = Cl + Cl';
k(:,i) = Jn32;
Gstr{i,1} = 'Cl2';
fCl2(i) = -1; fCl(i) = 2;

i = i + 1; %J25;
Rnames{i} = 'ClO + hv = Cl + O';
k(:,i) = Jn33;
Gstr{i,1} = 'ClO';
fClO(i) = -1; fCl(i) = 1; fO(i) = 1;

i = i + 1; %J26
Rnames{i} = 'OClO + hv = ClO + O';
k(:,i) = Jn37;
Gstr{i,1} = 'OClO';
fOClO(i) = -1; fClO(i) = 1; fO(i) = 1;

i = i + 1; %J27
Rnames{i} = 'Cl2O2 + hv = Cl + ClOO';
k(:,i) = Jn38;
Gstr{i,1} = 'Cl2O2';
fCl2O2(i) = -1; fCl(i) =1; fClOO(i) = 1;

i = i + 1; %J28
Rnames{i} = 'ClNO2 + hv = Cl + NO2';
k(:,i) = Jn23;
Gstr{i,1} = 'ClNO2';
fClNO2(i) = -1; fCl(i) = 1; fNO2(i) = 1;

i = i + 1; %J29
Rnames{i} = 'ClNO3 + hv = Cl + NO3';
k(:,i) = Jn34;
Gstr{i,1} = 'ClNO3';
fClNO3(i) = -1; fCl(i) = 1; fNO3(i) = 1;

i = i + 1; %J30;
Rnames{i} = 'ClNO3 + hv = ClO + NO2';
k(:,i) = Jn35;
Gstr{i,1} = 'ClNO3';
fClNO3(i) = -1; fClO(i) = 1; fNO2(i) = 1;

i = i + 1; %J31
Rnames{i} = 'HOCl + hv = Cl + OH';
k(:,i) = Jn36;
Gstr{i,1} = 'HOCl';
fHOCl(i) = -1; fCl(i) = 1; fOH(i) =1;
 
i = i + 1; %J32
Rnames{i} = 'ClOO + hv = Cl + O2';
k(:,i) = Jn39;
Gstr{i,1} = 'ClOO';
fClOO(i) = -1; fCl(i) = 1; 
 
%===================================
% Sherwen et al. 2016 ACP
i = i + 1; %M31
Rnames{i} = 'Cl + CH3O2 = ClO + HCHO + HO2';
k(:,i) = 1.6e-10;
Gstr{i,1} = 'Cl'; Gst{i,2} = 'CH3O2';
fCl(i) = -1; fCH3O2(i) = -1; fClO(i) = 1; fHCHO(i) = 1; fHO2(i) = 1;

% i = i + 1; %M34
% Rnames{i} = 'Cl + C2H5O2 = ClO + HO2 + CH3CHO'; %CH3CHO Taken as aldehyde product
% k(:,i) = 7.40e-11;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C2H5O2';
% fCl(i) = -1; fC2H5O2(i) = -1; fClO(i) = 1; fHO2(i) = 1; fCH3CHO(i) = 1;

i = i + 1; %M64;
Rnames{i} = 'Cl + H2O2 = HO2 + HCl';
k(:,i) = 1.10e-11 .* exp(-980./T);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'H2O2';
fCl(i) = -1; fH2O2(i) = -1; fHO2(i) = 1; fHCl(i) = 1;

i = i + 1; %M65;
Rnames{i} = 'Cl + HO2 = O2 + HCl';
k(:,i) = 1.40e-11 .* exp(270./T);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HO2';
fCl(i) = -1; fHO2(i) = -1; fHCl(i) = 1;

i = i + 1; %M66
Rnames{i} = 'Cl + HO2 = OH + ClO';
k(:,i) = 3.60e-11 .* exp(-375./T);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HO2';
fCl(i) = -1; fHO2(i) = -1; fOH(i) = 1; fClO(i) = 1;

i = i + 1; %M67
Rnames{i} = 'Cl + O3 = ClO + O2';
k(:,i) = 2.30e-11 .* exp(-200./T);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'O3';
fCl(i) = -1; fO3(i) = -1; fClO(i) = 1; 

i = i + 1; %M68
Rnames{i} = 'Cl + ClNO3 = Cl2 + NO3';
k(:,i) = 6.50e-12 .* exp(135./T);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ClNO3';
fCl(i) = -1; fClNO3(i) = -1; fCl2(i) = 1; fNO3(i) = 1;

i = i + 1; %M69
Rnames{i} = 'ClO + ClO = Cl2 + O2';
k(:,i) = 1.00e-12 .* exp(-1590./T);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'ClO';
fClO(i) = -2; fCl2(i) = 1; 

i = i + 1; %M70
Rnames{i} = 'ClO + ClO = OClO + Cl';
k(:,i) = 3.50e-13 .* exp(-1370./T);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'ClO';
fClO(i) = -2; fOClO(i) = 1; fCl(i) = 1;

i = i + 1; %M71
Rnames{i} = 'ClO + ClO = Cl + ClOO';
k(:,i) = 3.00e-11 .* exp(-2450./T);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'ClO';
fClO(i) = -2; fCl(i) = 1; fClOO(i) = 1;

i = i + 1; %M72
Rnames{i} = 'ClO + HO2 = O2 + HOCl';
k(:,i) = 2.60e-12 .* exp(290./T);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'HO2';
fClO(i) = -1; fHO2(i) = -1; fHOCl(i) = 1;

i = i + 1; %M73;
Rnames{i} = 'ClO + NO = Cl + NO2';
k(:,i) = 6.40e-12 .* exp(290./T);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'NO';
fClO(i) = -1; fNO(i) = -1; fCl(i) = 1; fNO2(i) = 1;

i = i + 1; %M74;
Rnames{i} = 'ClOO + Cl = ClO + ClO';
k(:,i) = 1.20e-11;
Gstr{i,1} = 'ClOO'; Gstr{i,2} = 'Cl';
fClOO(i) = -1; fCl(i) = -1; fClO(i) = 2;

i = i + 1; %M75;
Rnames{i} = 'ClOO + Cl = Cl2 + O2';
k(:,i) = 2.30e-10;
Gstr{i,1} = 'ClOO'; Gstr{i,2} = 'Cl';
fClOO(i) = -1; fCl(i) = -1; fCl2(i) = 1; 

i = i + 1; %M76;
Rnames{i} = 'CH3O2 + ClO = ClOO + HO2 + HCHO';
k(:,i) = 3.30e-12 .* exp(-115./T);
Gstr{i,1} = 'CH3O2'; Gstr{i,2} = 'ClO';
fCH3O2(i) = -1; fClO(i) = -1; fClOO(i) = 1; fHO2(i) = 1; fHCHO(i) = 1;

%M77 is CH3Cl

i = i + 1; %M78;
Rnames{i} = 'OH + Cl2 = HOCl + Cl';
k(:,i) = 2.60e-12 .* exp(-1100./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'Cl2';
fOH(i) = -1; fCl2(i) = -1; fHOCl(i) = 1; fCl(i) = 1;

i = i + 1; %M79; 
Rnames{i} = 'OH + Cl2O2 = HOCl + ClOO';
k(:,i) = 6.00e-13 .* exp(670./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'Cl2O2';
fOH(i) = -1; fCl2O2(i) = -1; fHOCl(i) = 1; fClOO(i) = 1;

i = i + 1; %M80
Rnames{i} = 'OH + ClNO2 = HOCl + NO2';
k(:,i) = 2.40e-12 .* exp(-1250./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'ClNO2';
fOH(i) = -1; fClNO2(i) = -1; fHOCl(i) = 1; fNO2(i) = 1;

i = i + 1; %M81
Rnames{i} = 'OH + ClNO3 = HOCl + NO3';
k(:,i) = 1.20e-12 .* exp(-330./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'ClNO3';
fOH(i) = -1; fClNO3(i) = -1; fHOCl(i) = 1; fNO3(i) = 1;

i = i + 1; %m82
Rnames{i} = 'OH + ClO = HCl + O2';
k(:,i) = 6.00e-13 .* exp(230./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'ClO';
fOH(i) = -1; fClO(i) = -1; fHCl(i) = 1; 

i = i + 1; %M83
Rnames{i} = 'OH + ClO = HO2 + Cl';
k(:,i) = 7.40e-12 .* exp(270./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'ClO';
fOH(i) = -1; fClO(i) = -1; fHO2(i) = 1; fCl(i) = 1;

i = i + 1; %M84
Rnames{i} = 'OH + HCl = H2O + Cl';
k(:,i) = 1.80e-12 .* exp(-250./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HCl';
fOH(i) = -1; fHCl(i) = -1; fCl(i) = 1;

i = i + 1; %M85;
Rnames{i} = 'OH + HOCl = H2O + ClO';
k(:,i) = 3.00e-12 .* exp (-500./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HOCl';
fOH(i) = -1; fHOCl(i) = -1; fClO(i) = 1;

i = i + 1; %M86
Rnames{i} = 'OH + OClO = HOCl + O2';
k(:,i) = 1.50e-12 .* exp(600./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'OClO';
fOH(i) = -1; fOClO(i) = -1; fHOCl(i) = 1; 

%===========================
%Table B3:
%Three Body Reactions
%===========================

%Rate constant taken from Sander et al., 2011
i = i + 1; %T7
Rnames{i} = 'Cl + O2 = ClOO'; 
k(:,i) = ThreeBodyK_LH(2.20e-33.*(T./300).^-3.1,1.8e-10,M,0.6) .* (M.*0.21);%M*0.21 = [O2]
Gstr{i,1} = 'Cl'; 
fCl(i) = -1; fClOO(i) = 1;

%Rate constant for the dissociation calculated as kF/Keq, with the
%equilibrium constant (Keq) from Sander et al., 2011
i = i + 1; %T8
Rnames{i} = 'Cl2O2 = ClO + ClO';
% k(:,i) = ThreeBodyK_LH(1.60e-21.* (T./300).^-2,3.00e-12 .* (T./300).^-4.5,M,0.6)./( 2.16e-27 .* exp(8537./T) );
% %qjc, typo in Sherwen et al. 2016
k(:,i) = ThreeBodyK_LH(1.60e-32.* (T./300).^-4.5,3.00e-12 .* (T./300).^-2,M,0.6)./( 1.72e-27 .* exp(8649./T) );
Gstr{i,1} = 'Cl2O2';
fCl2O2(i) = -1; fClO(i) = 2;

i = i + 1; %T9
Rnames{i} = 'ClO + ClO = Cl2O2';
% k(:,i) = ThreeBodyK_LH(1.60e-21.* (T./300).^-2,3.00e-12 .* (T./300).^-4.5,M,0.6);
% %qjc, typo in Sherwen et al. 2016
k(:,i) = ThreeBodyK_LH(1.60e-32.* (T./300).^-4.5,3.00e-12 .* (T./300).^-2,M,0.6);
Gstr{i,1} = 'ClO'; Gst{i,2} = 'ClO';
fClO(i) = -2; fCl2O2(i) = 1;

i = i + 1; %T10
Rnames{i} = 'ClO + NO2 = ClNO3';
% k(:,i) =
% ThreeBodyK_LH(1.80e-31.*(T./300).^-1.9,1.50e-11.*(T./300).^-3.4,M,0.6);
% %qjc, typo in Sherwen et al. 2016
k(:,i) = ThreeBodyK_LH(1.80e-31.*(T./300).^-3.4,1.50e-11.*(T./300).^-1.9,M,0.6);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'NO2';
fClO(i) = -1; fNO2(i) = -1; fClNO3(i) = 1;

%Rate constant for the dissociation calculated as kF/Keq, with the
%equilibrium constant (Keq) from Sander et al., 2011
i = i + 1; %T11;
Rnames{i} = 'ClOO = Cl + O2';
k(:,i) = ThreeBodyK_LH(2.20e-33.*(T./300).^-3.1,1.8e-10,M,0.6) ./ ( 6.6e-25.*exp(2502./T) ); 
Gstr{i,1} = 'ClOO';
fClOO(i) = -1; fCl(i) = 1; 

%=======================================
%Added from Hossaini et al 2016
i = i + 1; 
Rnames{i} = 'Cl + NO2 = ClNO2';
k(:,i) = ThreeBodyK_LH(1.8e-31 .* (T./300).^-2.0,1.0e-10 .* (T./300).^-1.0,M,0.6);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NO2';
fCl(i) = -1; fNO2(i) = -1; fClNO2(i) = 1;

%=====================================
%qjc, Added from iupac, refer to reactions in GEOS-Chem v12.7
% i=i+1;
% Rnames{i} = 'Cl + DMS = HCl + CH3SCH2O2';
% k(:,i) = 3.6E-10;
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'DMS'; 
% fCl(i) = -1; fDMS(i) = -1; fHCl(i) = 1; fCH3SCH2O2(i) = 1; 
% 
% i=i+1;
% Rnames{i} = 'Cl + H2 = H + HCl';
% k(:,i) = 3.9E-11.*exp(-2310./T);
% Gstr{i,1} = 'Cl'; Gstr{i,2} = 'H2'; 
% fCl(i) = -1; fH2(i) = -1; fH(i) = 1; fHCl(i) = 1; 

i=i+1;
Rnames{i} = 'Cl + NO3 = ClO + NO2';
k(:,i) = 2.4E-11;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'NO3'; 
fCl(i) = -1; fNO3(i) = -1; fClO(i) = 1; fNO2(i) = 1; 

i=i+1;
Rnames{i} = 'Cl + OClO = ClO + ClO';
k(:,i) = 3.2E-11.*exp(170./T);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'OClO'; 
fCl(i) = -1; fOClO(i) = -1; fClO(i) = 2; 

i=i+1;
Rnames{i} = 'ClO + O = Cl + O2';
k(:,i) = 2.5E-11.*exp(110./T);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'O'; 
fClO(i)=-1; fO(i)=-1; fCl(i)=1; 

i=i+1;
Rnames{i} = 'ClNO3 + O = ClO + NO3';
k(:,i) = 4.5E-12.*exp(-900./T);
Gstr{i,1} = 'ClNO3'; Gstr{i,2} = 'O'; 
fClNO3(i)=-1; fO(i)=-1; fClO(i)=1; fNO3(i)=1; 

% END OF REACTION LIST

