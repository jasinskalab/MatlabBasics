function matchTxtToNirs(directory)
    
    folders = dir(directory.folder);
    dirFlags = [folders.isdir];
    subfolders = folders(dirFlags);
    
    for index = 1:length(subfolders)
        [localFolder,name,extension] = fileparts(strcat(subfolders(index).folder,'/',subfolders(index).name));
        mkdir(localFolder,strcat(name,'Nirs'));
        newFolder = strcat(localFolder,'/',name,'Nirs');
        subfiles = dir(strcat(directory,'/',name,'.*'));
        for fileDex = 1:length(subfiles)
           movefile(strcat(directory,'/',name,'.*'),newFolder);
        end
        
    end
end
