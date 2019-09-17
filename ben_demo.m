
%datapath = 'data/MOR Test Data';
log_path = [pwd filesep 'Behavioral/Tasks_fNIRS_20190116/Print_Speech/data/'];
nirs_path = [pwd filesep 'NIRS_sorted'];
subject_id = '050203';


%% Find all the log files and nirs files for a subject and match them up

% Search for the log files and nirs files, and compare the times in their
% filenames. If times are within 1 minute of each other, they get matched
[logicalArr, ps_nirs_sorted, ps_log_sorted] = match_ps_stims.matchstims(subject_id,nirs_path,log_path);

% Copy the log file from the log path to the nirs path
match_ps_stims.cpNirsToLog(ps_log_sorted,ps_nirs_sorted(1).folder)

%ps_nirs_sorted = dir([datapath filesep '*.nirs']);

for i = 1:length(ps_nirs_sorted)
    
    [status,logDiffs1,nirsDiffs1,info] = NirsDataMatching.run([ps_nirs_sorted(i).folder filesep ps_nirs_sorted(i).name], [ps_nirs_sorted(i).folder filesep ps_log_sorted(i).name]);
    % [status,logDiffs1,nirsDiffs1,info] = NirsDataMatching.run([datapath filesep 'MOR_007_12DEC1720171212_164508.nirs']);
    
    [logDiffs2, nirsDiffs2, blocklabels] = needlemanWunsch.AlignNeedlemanWunsch(logDiffs1,nirsDiffs1,info.BlockText);
    
    nirs_inferred = needlemanWunsch.reconstructFromAlignedDiff(nirsDiffs2,logDiffs2,info.SortedNirsTriggerTimes(1));
    
    disp('Old NIRS times:')
    info.SortedNirsTriggerTimes
      
    blockstims = cellfun(@(x) strcmp(x,'selectBlock'),blocklabels(:,1));
    blocklabels(blockstims,3) = cellfun(@(x) ['Condition' x(end-1)],blocklabels(blockstims,3),'UniformOutput',false);
    
    disp('Reconstructed NIRS times:')
    [num2cell(nirs_inferred+15) blocklabels(:,3)]
    
end

