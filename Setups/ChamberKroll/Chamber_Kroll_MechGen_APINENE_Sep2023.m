% ExampleSetup_Chamber.m
% This example shows a model setup for simulation of
% a series of photochemical chamber experiments.
% Read comments in each section for a guided tour.
%
% 20151022 GMW

clear

%% Load Data
data_initial = readtable('D:\Google Drive\Research\Project\MIT\Data\Chamber\a-pinene\Log_a-Pinene_Initial.csv');
%disp(data_initial)
exp_Date = data_initial.ExpDate;
exp_REAC = data_initial.REAC;
exp_O3 = data_initial.O3;
exp_NO = data_initial.NO;
exp_NO2 = data_initial.NO2;
exp_HONO = data_initial.HONO;
exp_H2O2 = data_initial.H2O2;
%exp_H2O2 = data_initial.H2O2_LOG;


for idr = 4:length(exp_Date)

    % Get the value for this run
    run_Step = 60;
    run_Date = exp_Date(idr);
    run_Mech = 'MechGen';
    REAC = 'APINENE';
    RunID = '_Dil_WC_001';
    FitID = '_diluted';
    ExpDate = char(string(run_Date));

    % Load the data for model fitting
    % O3
    data_O3 = readtable(['D:\Google Drive\Research\Project\MIT\Data\Chamber\a-pinene\' ExpDate '\Summary\a-Pinene_' ExpDate '_Gas_O3' FitID '.csv']);
    time_O3 = data_O3.Time_Step;
    exp_O3_Adj = data_O3.O3_Smooth; exp_O3_Adj(1) = exp_O3(idr);
    % NO2
    data_NO2 = readtable(['D:\Google Drive\Research\Project\MIT\Data\Chamber\a-pinene\' ExpDate '\Summary\a-Pinene_' ExpDate '_Gas_NO2' FitID '.csv']);
    time_NO2 = data_NO2.Time_Step;
    exp_NO2_Adj = data_NO2.NO2_Smooth; exp_NO2_Adj(1) = exp_NO2(idr);
    % OH
    data_OH = readtable(['D:\Google Drive\Research\Project\MIT\Data\Chamber\a-pinene\' ExpDate '\Summary\a-Pinene_' ExpDate '_Gas_OH' FitID '.csv']);
    time_OH = data_OH.Time_Step;
    exp_OH_Adj = data_OH.OH_Smooth;
    % HONO
    data_HONOFlow = readtable(['D:\Google Drive\Research\Project\MIT\Data\Chamber\a-pinene\' ExpDate '\Summary\a-Pinene_' ExpDate '_Gas_HONO.csv']);
    time_HONOFlow = data_HONOFlow.Time_Step;
    exp_HONO_Flow = data_HONOFlow.HONO_Flow;


    %% METEOROLOGY
    %{
    Pressure, temperature, and either RH or H2O are required Met inputs.
    We will assume them constant throughout the simulation,
      thus we need only specify a single (scalar) value for each.
    We have also specified a text file containing a spectral actinic flux (wavelength and photons/cm^2/s),
      which will be used to calculate J-values. This particular spectrum was measured on a real
      chamber (thanks to John Crounse).
    %}
                        
    Met = {...
    %   names       values          
        'P'         1013                         ; %Pressure, mbar
        'T'         298                          ; %Temperature, K
        'RH'        60                           ; %Relative Humidity, percent
        'LFlux'     '340nm_update_saprc.txt'     ; %Text file for radiation spectrum, conver to SAPRC format
        'jcorr'     0.0012*0.58/0.38                       ; %Kroll chamber jNO2 = 0.106 min^-1
        'kdil'      0.00003                      ; %Dilution rate in s^-, 0.00003
        };
    
    %% CHEMICAL CONCENTRATIONS
    %{
    Imagine that we are simulating a series of three isoprene oxidation experiments, each with
      different NOx conditions. We fill the bag with isoprene, H2O2 (our HOx source), and NO2,
      then turn the lights on and let it run.
    Let's assume that initial isoprene and H2O2 are the same for all three runs,
      so we can input them as scalars.
    All HoldMe values are set to 0 so that concentrations will evolve.
    If you'd rather use CH3ONO as your OH source, add it in below and comment out H2O2.
      Note that this will make more NOx.
    %}
    
    InitConc = {...
    %   names         conc(ppb)               HoldMe
        'C6F6'        1                       0;
        REAC          exp_REAC(idr)           0;
        'O3'          exp_O3(idr)             0;
        'NO'          exp_NO(idr)             0;
        'NO2'         exp_NO2(idr)            0;
        'HO2H'        exp_H2O2(idr)           0;
        %'OH'          exp_OH_Adj              1;
        'HONO'        exp_HONO(idr)           0;
        'HONOFlow'    0.3                     1;
        };
    
    %% CHEMISTRY
    %{
    SAPRC18PHEN
    %}
    
    ChemFiles = {...
        'MechGen_K(Met)';
        'MechGen_ICTUSE_Jvalues(LFlux)';   %Jmethod flag of 1 specifies using "BottomUp" J-value method.
        'MechGen_Base';
        'MechGen_Multi_APINENE';
        'MechGen_ChamberRxns_MIT';
        %'TOLRO2_RXNS_parameter_adjusted';
        };
    
    %% DILUTION CONCENTRATIONS
    % We are not diluting the chamber air, so this input is irrelevant (but still necessary).
    
    BkgdConc = {...
    %   Names            Values   
        'DEFAULT'            0;
        };
    
    %% OPTIONS
    %{
    "Verbose" can be set from 0-3; this just affects the level of detail printed to the command
      window regarding model progress.
    "EndPointsOnly" is set to 0 because we want output to include all concentrations along each model step.
    "LinkSteps" is set to 0 because each step is fully independent.
    "IntTime" is the integration time for each step. Let's pretend each experiment lasts 3 hours.
    "SavePath" will store the output in the default "Runs" folder under the base F0AM directory
    "GoParallel" can be utilized since each step is independent (assuming you have the parallel computing toolbox)
    %}
    
    ModelOptions.Verbose       = 1;
    ModelOptions.EndPointsOnly = 0;
    ModelOptions.LinkSteps     = 0;
    ModelOptions.IntTime       = 8*3600;
    %ModelOptions.IntTime       = 60;
    %ModelOptions.TimeStamp     = time_HONOFlow;
    ModelOptions.SavePath      = ['KrollChamberOutput', ExpDate, '.mat'];
    ModelOptions.GoParallel    = 0;
    
    %% MODEL RUN
    % Now we call the model.
    % Output will be saved in the "SavePath" above and will also be written to the structure S.
    % Let's also throw away the inputs (don't worry, they are saved in the output structure).
    
    S = F0AM_ModelCore_MG(Met,InitConc,ChemFiles,BkgdConc,ModelOptions);
    % clear Met InitConc ChemFiles BkgdConc ModelOptions
    
    %% PLOTTING: split simulations
    % Now, a few examples of how to look at the model output.
    
    % First, let's separate each of the steps since they each represent a different experiment.
    % "SplitRun" will make three new structures, S1, S2 and S3, corresponding to each of the
    % three steps with different initial NO2 (0.1, 1 and 10 ppbv).
    
    SplitRun(S,'step')
    
    %% PLOTTING: plot time-series
    % Next, let's look at some time series for our fav molecules.
    % Note that you can also do this yourself with the model output structures,
    %   e.g. plot(S1.Time,S1.Conc.C5H8)
    % The UWCM-provided functions are just more convenient for comparing multiple simulations.
    % Look at the documentation for each function to get an idea of available options.
    
    Splot = {S1};
    lnames = ExpDate;
    
    %% PLOTTING: plot time-series
    
    PlotConcSave(REAC,run_Mech,S,'lnames',lnames, 'unitT', 'hr')
    %PlotConcSave('HOM',RunID,S,'lnames',lnames, 'unitT', 'hr')
    %PlotConcSave('HONIT',RunID,S,'lnames',lnames, 'unitT', 'hr')
    PlotConcSave('O3',RunID,S,'lnames',lnames, 'unitT', 'hr')
    %PlotConcSave('NO/NO2',RunID,S,'lnames',lnames, 'unitT', 'hr', 'unit','ug/cm3')
    

    %%
    % PLOTTING: plot production and loss rates
    % Now, let's dig in and look at the chemistry.
    % Function to plot the rate time series
    % for idx = 1:length(Splot)
    %     PlotRatesSave(REAC,num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     PlotRatesSave('NO2',num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     PlotRatesSave('OH',num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     PlotRatesSave('O3',num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     PlotRatesSave('HO2',num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     PlotRatesSave('NO',num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     %PlotRatesSave('AllRO2',num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     %PlotRatesSave('AllRCO3',num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     %PlotRatesSave('RAD_1',num2str(run_Date),['_', run_Mech, RunID],S,5,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     %PlotRatesSave('RAD_2',num2str(run_Date),['_', run_Mech, RunID],S,5,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     %PlotRatesSave('RAD_3',num2str(run_Date),['_', run_Mech, RunID],S,5,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     %PlotRatesSave('ACETONE',num2str(run_Date),['_', run_Mech, RunID],S,8,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     %PlotRatesSave('RAD_733',num2str(run_Date),['_', run_Mech, RunID],S,8,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     %PlotRatesSave('ORG_3908',num2str(run_Date),['_', run_Mech, RunID],S,8,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     % PlotRatesSave('PRD_1',num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     % PlotRatesSave('PRD_5',num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    %     %PlotRatesSave('PRD_23',num2str(run_Date),['_', run_Mech, RunID],S,7,'ptype','fill','unit','ppb_s','sumEq',1, 'unitT', 'hr');
    % end

    %% Create a list of the non-zero concentration species %%
    % Code mostly written by Josh Moss that retrieves and summarizes chemical
    % information and additionally outputs concentrations over time.

    for idx = 1:length(Splot)

        %S = Splot{idx}; % Access each element of Splot
        %S = S1
        names = fieldnames(S.Conc);
        counter = 0;

        for i = 1:length(names)
            conc_prof = getfield(S.Conc, char(names(i))); %retrieve list of concentrations for each species
            maxim = max(conc_prof); %max concentration of for the species

            if maxim == 0
                %Skip any compounds that are 0 concentration the whole time
           % elseif max(strcmp(char(names(i)), MCMnames)) ~= 1
            else
                counter = counter + 1;
                %Imp is a structure containing info on nonzero species
                Imp.Species{counter} = names(i); %list of names
                Imp.MaxConc(counter) = maxim; %list of max concentrations
                Imp.Info{counter} = SearchSMILES('all', char(names(i)), 'v331');
                    %Makes a structure for each species with all the info
                    %SMILES spits out.

                %Structure for making a time series for all compounds
                TimeConc.Species{counter} = names(i);
                TimeConc.conc{counter} = conc_prof;
            end
        end

        % Replace any NAs with zeros
        for i=1:length(Imp.Species)
           if isempty(Imp.Info{i}.MW)
               Imp.Info{i}.MW = 0;
               Imp.Info{i}.nC = 0;
               Imp.Info{i}.nO = 0;
               Imp.Info{i}.nN = 0;
               Imp.Info{i}.nH = 0;
               Imp.Info{i}.nS = 0;
           end
        end
        %Make some arrays for export as .csv
        for i=2:length(Imp.Species)
            if i == 2
                    species = vertcat(Imp.Species{1}, Imp.Species{2});
                    maxes = vertcat(Imp.MaxConc(1), Imp.MaxConc(2));
                    molmass = vertcat(Imp.Info{1}.MW, Imp.Info{2}.MW);
                    carb = vertcat(Imp.Info{1}.nC, Imp.Info{2}.nC);
                    oxy = vertcat(Imp.Info{1}.nO, Imp.Info{2}.nO);
                    nitro = vertcat(Imp.Info{1}.nN, Imp.Info{2}.nN);
                    hydro = vertcat(Imp.Info{1}.nH, Imp.Info{2}.nH);
                    sulf = vertcat(Imp.Info{1}.nS, Imp.Info{2}.nS);
            else
                    species = vertcat(species, Imp.Species{i});
                    maxes = vertcat(maxes, Imp.MaxConc(i));
                    molmass = vertcat(molmass, Imp.Info{i}.MW);
                    carb = vertcat(carb, Imp.Info{i}.nC);
                    oxy = vertcat(oxy, Imp.Info{i}.nO);
                    nitro = vertcat(nitro, Imp.Info{i}.nN);
                    hydro = vertcat(hydro, Imp.Info{i}.nH);
                    sulf = vertcat(sulf, Imp.Info{i}.nS);
            end
        end

        mol_I = molmass + 126.96;

        maxes = num2cell(maxes); %converts array to cell array
        molmass = num2cell(molmass);
        mol_I = num2cell(mol_I);
        carb = num2cell(carb);
        oxy = num2cell(oxy);
        nitro = num2cell(nitro);
        hydro = num2cell(hydro);
        sulf = num2cell(sulf);

        %Compile summary of bulk properties
        titles = {'Species Name', 'Max Conc', 'Molar Mass', 'MM + (I-)', '#C', '#O', '#N', '#H', '#S'};
        block = horzcat(species, maxes, molmass, mol_I, carb, oxy, nitro, hydro, sulf);
        output = vertcat(titles, block);

        %Compile matrix of concentration evolution over time
        block2 = horzcat(TimeConc.conc{1},TimeConc.conc{2});
        for i=3:length(TimeConc.Species)
            block2 = horzcat(block2, TimeConc.conc{i});
        end
        titles2 = transpose(species);
        block2 = vertcat(transpose(species), num2cell(block2));
        output2 = horzcat(vertcat('Time',num2cell(S.Time)), block2);

        % Write the info to an excel file saved in Documents
        % Change the name of the file each time!
        save_path = 'D:\Google Drive\Model\F0AM\Output\output_mechgen\';
        %writecell(output, fullfile(save_path, ['MechGen-' REAC '-' ExpDate '-Product summary' RunID '.csv']));
        writecell(output2, fullfile(save_path, ['MechGen-' REAC '-' ExpDate '-Product over time' RunID '.csv']));  
    end    
end   
