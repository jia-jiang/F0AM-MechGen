% Added by Seamus Frey (08/01/2024), designed by Jia Jiang
% 

SpeciesToAdd = {'H2O2addn';'Cl2addn';};

AddSpecies;

%% Reactions added by Seamus on August 1, 2024
% Intended to have rapid conversion from the addition to the actual
% molecule. Ask Jia for more information

i=i+1;
Rnames{i} = 'H2O2addn = H2O2';
k(:,i) = 1./60;
Gstr{i,1} = 'H2O2addn';  
fH2O2addn(i)=fH2O2addn(i)-1; fH2O2(i)=fH2O2(i)+1;

i=i+1;
Rnames{i} = 'Cl2addn = Cl2';
k(:,i) = 1./60;
Gstr{i,1} = 'Cl2addn';  
fCl2addn(i)=fCl2addn(i)-1; fCl2(i)=fCl2(i)+1;