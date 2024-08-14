% Define% Define the base directory where the subfolders are located
baseDir = '/Users/donsven/documents/matlab/test_data';

% Define the subfolders to process
subFolders = {'left', 'center', 'right'};

% Loop through each subfolder
for i = 1:length(subFolders)
    currentSubFolder = fullfile(baseDir, subFolders{i});
    fprintf('Processing subfolder: %s\n', currentSubFolder);
    
    % List and delete all CSV files matching the pattern 'frame*_processed.csv'
    filesToDeleteCSV = dir(fullfile(currentSubFolder, 'frame*_processed.csv'));
    
    if isempty(filesToDeleteCSV)
        fprintf('No matching CSV files found in subfolder!\n');
    else
        for j = 1:length(filesToDeleteCSV)
            fileToDelete = fullfile(currentSubFolder, filesToDeleteCSV(j).name);
            delete(fileToDelete);
            fprintf('Deleted CSV file: %s\n', fileToDelete);
        end
    end
    
    % List and delete all PCD files matching the pattern 'frame*.pcd'
    filesToDeletePCD = dir(fullfile(currentSubFolder, 'frame*.pcd'));
    
    if isempty(filesToDeletePCD)
        fprintf('No matching PCD files found in subfolder!\n');
    else
        for j = 1:length(filesToDeletePCD)
            fileToDelete = fullfile(currentSubFolder, filesToDeletePCD(j).name);
            delete(fileToDelete);
            fprintf('Deleted PCD file: %s\n', fileToDelete);
        end
    end
end

disp('Deletion complete.');