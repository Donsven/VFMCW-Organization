baseDir = '/Users/donsven/documents/matlab/test_data';

subFolders = {'left', 'center', 'right'};

for i = 1:length(subFolders)
    currentSubFolder = fullfile(baseDir, subFolders{i});
    fprintf('Processing subfolder: %s\n', currentSubFolder);
    
    filesToDeleteCSV = dir(fullfile(currentSubFolder, 'frame*_processed.csv'));
    
    if ~isempty(filesToDeleteCSV)
        for j = 1:length(filesToDeleteCSV)
            fileToDelete = fullfile(currentSubFolder, filesToDeleteCSV(j).name);
            delete(fileToDelete);
            fprintf('Deleted CSV file: %s\n', fileToDelete);
        end
    end
    
    filesToDeletePCD = dir(fullfile(currentSubFolder, 'frame*.pcd'));
    
    if ~isempty(filesToDeletePCD)
        for j = 1:length(filesToDeletePCD)
            fileToDelete = fullfile(currentSubFolder, filesToDeletePCD(j).name);
            delete(fileToDelete);
            fprintf('Deleted PCD file: %s\n', fileToDelete);
        end
    end
end

disp('Deletion complete.');
