baseDir = '/Users/donsven/documents/matlab/test_data';

subFolders = {'left', 'center', 'right'};

for i = 1:length(subFolders)
    currentSubFolder = fullfile(baseDir, subFolders{i});
    fprintf('Processing subfolder: %s\n', currentSubFolder);
    
    csvFiles = dir(fullfile(currentSubFolder, '*.csv'));
    fprintf(' %d CSV files in subfolder\n', length(csvFiles));
    
    if isempty(csvFiles)
        fprintf('No  files found in subfolder!\n');
    else
        for j = 1:length(csvFiles)
            csvFilePath = fullfile(currentSubFolder, csvFiles(j).name);
            data = readtable(csvFilePath);
            xyzPoints = data{:, {'X', 'Y', 'Z'}};
            intensity = data{:, 'Intensity'};
            filteredRows = intensity >= 5;
            filteredData = data(filteredRows, {'X', 'Y', 'Z'});
            [~, fileName, ~] = fileparts(csvFiles(j).name);
            outputCSVPath = fullfile(currentSubFolder, [fileName, '_processed.csv']);
            writetable(filteredData, outputCSVPath);
            fprintf('Processed %s and saved as %s\n', csvFiles(j).name, outputCSVPath);
        end
    end
end

disp('Processing complete.');
