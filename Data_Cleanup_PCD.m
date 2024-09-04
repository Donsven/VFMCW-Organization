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
            
            % Extract the X, Y, Z columns
            xyzPoints = data{:, {'X', 'Y', 'Z'}};
            
            % Create a point cloud object from the X, Y, Z data
            ptCloud = pointCloud(xyzPoints);
            
            % Construct the output file path with .pcd extension
            [~, fileName, ~] = fileparts(csvFiles(j).name);
            outputPCDPath = fullfile(currentSubFolder, [fileName, '.pcd']);
            
            % Save the point cloud to a PCD file
            pcwrite(ptCl
            
            % Display a message indicating progress
            fprintf('Processed %s and saved as %s\n', csvFiles(j).name, outputPCDPath);
        end
    end
end

disp('Processing complete.');