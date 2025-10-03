% Added by Seamus Frey (07/19/2024),
% All species in Chlorine_ISO_20240716 file, so no species to add

%% Reactions added by Seamus on July 19, 2024
% Most rate constants came from JPL, see Seamus's excel for more details

% CL + RO2
i=i+1;
Rnames{i} = 'ClISOPAO2 + Cl = ClISOPAO + ClO';
k(:,i) = 1.6e-10.*1;
Gstr{i,1} = 'ClISOPAO2'; Gstr{i,2} = 'Cl'; 
fClISOPAO2(i)=fClISOPAO2(i)-1; fCl(i)=fCl(i)-1; fClISOPAO(i)=fClISOPAO(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClACO3 + Cl = ClACETONE + CO + HO2 + ClO';
k(:,i) = KAPNO.*10;
Gstr{i,1} = 'ClACO3'; Gstr{i,2} = 'Cl'; 
fClACO3(i)=fClACO3(i)-1; fCl(i)=fCl(i)-1; fClACETONE(i)=fClACETONE(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO2 + Cl = ClISOPBO + ClO';
k(:,i) = 1.6e-10.*1;
Gstr{i,1} = 'ClISOPBO2'; Gstr{i,2} = 'Cl'; 
fClISOPBO2(i)=fClISOPBO2(i)-1; fCl(i)=fCl(i)-1; fClISOPBO(i)=fClISOPBO(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClHOMRO2 + Cl = CLHOMALD + ClO';
k(:,i) = 1.6e-10.*1;
Gstr{i,1} = 'ClHOMRO2'; Gstr{i,2} = 'Cl'; 
fClHOMRO2(i)=fClHOMRO2(i)-1; fCl(i)=fCl(i)-1; fCLHOMALD(i)=fCLHOMALD(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO2 + Cl = ClISOPCO + ClO';
k(:,i) = 1.6e-10.*1;
Gstr{i,1} = 'ClISOPCO2'; Gstr{i,2} = 'Cl'; 
fClISOPCO2(i)=fClISOPCO2(i)-1; fCl(i)=fCl(i)-1; fClISOPCO(i)=fClISOPCO(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO3 + Cl = ClCH2CHO + CH3CO3 + ClO';
k(:,i) = KAPNO.*10;
Gstr{i,1} = 'ClCCO3'; Gstr{i,2} = 'Cl'; 
fClCCO3(i)=fClCCO3(i)-1; fCl(i)=fCl(i)-1; fClCH2CHO(i)=fClCH2CHO(i)+1; fCH3CO3(i)=fCH3CO3(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO2 + Cl = ClISOPDO + ClO';
k(:,i) = 1.6e-10.*1;
Gstr{i,1} = 'ClISOPDO2'; Gstr{i,2} = 'Cl'; 
fClISOPDO2(i)=fClISOPDO2(i)-1; fCl(i)=fCl(i)-1; fClISOPDO(i)=fClISOPDO(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKIO2 + Cl = ClMVKIO + ClO';
k(:,i) = 1.6e-10.*1;
Gstr{i,1} = 'ClMVKIO2'; Gstr{i,2} = 'Cl'; 
fClMVKIO2(i)=fClMVKIO2(i)-1; fCl(i)=fCl(i)-1; fClMVKIO(i)=fClMVKIO(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKTO2 + Cl = ClMVKTO + ClO';
k(:,i) = 1.6e-10.*1;
Gstr{i,1} = 'ClMVKTO2'; Gstr{i,2} = 'Cl'; 
fClMVKTO2(i)=fClMVKTO2(i)-1; fCl(i)=fCl(i)-1; fClMVKTO(i)=fClMVKTO(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTRO2 + Cl = ClMACTRO + ClO';
k(:,i) = 1.6e-10.*1;
Gstr{i,1} = 'ClMACTRO2'; Gstr{i,2} = 'Cl'; 
fClMACTRO2(i)=fClMACTRO2(i)-1; fCl(i)=fCl(i)-1; fClMACTRO(i)=fClMACTRO(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIRO2 + Cl = ClMACIRO + ClO';
k(:,i) = 1.6e-10.*1;
Gstr{i,1} = 'ClMACIRO2'; Gstr{i,2} = 'Cl'; 
fClMACIRO2(i)=fClMACIRO2(i)-1; fCl(i)=fCl(i)-1; fClMACIRO(i)=fClMACIRO(i)+1; fClO(i)=fClO(i)+1; 

% CLO + RO2
i=i+1;
Rnames{i} = 'ClISOPAO2 + ClO = ClISOPAO + ClOO';
k(:,i) = 1.8e-11.*exp(-600./T);
Gstr{i,1} = 'ClISOPAO2'; Gstr{i,2} = 'ClO'; 
fClISOPAO2(i)=fClISOPAO2(i)-1; fClO(i)=fClO(i)-1; fClISOPAO(i)=fClISOPAO(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClACO3 + ClO = ClACETONE + CO + HO2 + ClOO';
k(:,i) = KAPNO.*10;
Gstr{i,1} = 'ClACO3'; Gstr{i,2} = 'ClO'; 
fClACO3(i)=fClACO3(i)-1; fClO(i)=fClO(i)-1; fClACETONE(i)=fClACETONE(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPBO2 + ClO = ClISOPBO + ClOO';
k(:,i) = 1.8e-11.*exp(-600./T);
Gstr{i,1} = 'ClISOPBO2'; Gstr{i,2} = 'ClO'; 
fClISOPBO2(i)=fClISOPBO2(i)-1; fClO(i)=fClO(i)-1; fClISOPBO(i)=fClISOPBO(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClHOMRO2 + ClO = CLHOMALD + ClO';
k(:,i) = 1.8e-11.*exp(-600./T);
Gstr{i,1} = 'ClHOMRO2'; Gstr{i,2} = 'ClO'; 
fClHOMRO2(i)=fClHOMRO2(i)-1; fClO(i)=fClO(i)-1; fCLHOMALD(i)=fCLHOMALD(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPCO2 + ClO = ClISOPCO + ClOO';
k(:,i) = 1.8e-11.*exp(-600./T);
Gstr{i,1} = 'ClISOPCO2'; Gstr{i,2} = 'ClO'; 
fClISOPCO2(i)=fClISOPCO2(i)-1; fClO(i)=fClO(i)-1; fClISOPCO(i)=fClISOPCO(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClCCO3 + ClO = ClCH2CHO + CH3CO3 + ClOO';
k(:,i) = KAPNO.*10;
Gstr{i,1} = 'ClCCO3'; Gstr{i,2} = 'ClO'; 
fClCCO3(i)=fClCCO3(i)-1; fClO(i)=fClO(i)-1; fClCH2CHO(i)=fClCH2CHO(i)+1; fCH3CO3(i)=fCH3CO3(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClISOPDO2 + ClO = ClISOPDO + ClOO';
k(:,i) = 1.8e-11.*exp(-600./T);
Gstr{i,1} = 'ClISOPDO2'; Gstr{i,2} = 'ClO'; 
fClISOPDO2(i)=fClISOPDO2(i)-1; fClO(i)=fClO(i)-1; fClISOPDO(i)=fClISOPDO(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKIO2 + ClO = ClMVKIO + ClOO';
k(:,i) = 1.8e-11.*exp(-600./T);
Gstr{i,1} = 'ClMVKIO2'; Gstr{i,2} = 'ClO'; 
fClMVKIO2(i)=fClMVKIO2(i)-1; fClO(i)=fClO(i)-1; fClMVKIO(i)=fClMVKIO(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClMVKTO2 + ClO = ClMVKTO + ClOO';
k(:,i) = 1.8e-11.*exp(-600./T);
Gstr{i,1} = 'ClMVKTO2'; Gstr{i,2} = 'ClO'; 
fClMVKTO2(i)=fClMVKTO2(i)-1; fClO(i)=fClO(i)-1; fClMVKTO(i)=fClMVKTO(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClMACTRO2 + ClO = ClMACTRO + ClOO';
k(:,i) = 1.8e-11.*exp(-600./T);
Gstr{i,1} = 'ClMACTRO2'; Gstr{i,2} = 'ClO'; 
fClMACTRO2(i)=fClMACTRO2(i)-1; fClO(i)=fClO(i)-1; fClMACTRO(i)=fClMACTRO(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClMACIRO2 + ClO = ClMACIRO + ClOO';
k(:,i) = 1.8e-11.*exp(-600./T);
Gstr{i,1} = 'ClMACIRO2'; Gstr{i,2} = 'ClO'; 
fClMACIRO2(i)=fClMACIRO2(i)-1; fClO(i)=fClO(i)-1; fClMACIRO(i)=fClMACIRO(i)+1; fClOO(i)=fClOO(i)+1; 

% END OF REACTION LIST

