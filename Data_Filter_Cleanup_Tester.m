% Define the base directory where the subfolders are located
baseDir = '/Users/donsven/documents/matlab/test_data';

% Define the subfolders to process
subFolders = {'left', 'center', 'right'};

% Loop through each subfolder
for i = 1:length(subFolders)
    currentSubFolder = fullfile(baseDir, subFolders{i});
    fprintf('Processing subfolder: %s\n', currentSubFolder);
    
    % List all CSV files in the current subfolder
    csvFiles = dir(fullfile(currentSubFolder, '*.csv'));
    fprintf('Found %d CSV files in subfolder\n', length(csvFiles));
    
    if isempty(csvFiles)
        fprintf('No CSV files found in subfolder!\n');
    else
        % Process each CSV file
        for j = 1:length(csvFiles)
            
            % Construct the full file path
            csvFilePath = fullfile(currentSubFolder, csvFiles(j).name);
            
            % Load the CSV file into a table
            data = readtable(csvFilePath);
            
            % Extract the X, Y, Z, and intensity columns
            xyzPoints = data{:, {'X', 'Y', 'Z'}};
            intensity = data{:, 'Intensity'};
            
            % Apply the filter: keep rows where intensity >= 5
            filteredRows = intensity >= 5;
            filteredData = data(filteredRows, {'X', 'Y', 'Z'});
            
            % Construct the output file path with .csv extension
            [~, fileName, ~] = fileparts(csvFiles(j).name);
            outputCSVPath = fullfile(currentSubFolder, [fileName, '_processed.csv']);
            
            % Save the filtered data to a new CSV file
            writetable(filteredData, outputCSVPath);
            
            % Display a message indicating progress
            fprintf('Processed %s and saved as %s\n', csvFiles(j).name, outputCSVPath);
        end
    end
end

disp('Processing complete.');
