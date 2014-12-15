%This program is used to reverse the file order from bottom to top 
%Due to the cut slice direction is different from hosipital data
clear;close all
%Add path to it

% path=pwd;
% path=strcat(pwd,'\V_7');
% addpath(path);
mkdir('V_test');
dirData = dir('*.dcm');         %# Get the selected file data
fileNames = {dirData.name};     %# Create a cell array of file names

%change the number to 3 digits
for iFile = 1:numel(fileNames)  %# Loop over the file names
  number=sscanf(fileNames{iFile}, '%*5c_%u.txt');
        if number<100
            if number<10
                name=strcat('00',num2str(number));
                newName=strcat('image_',name);
                newName=strcat(newName,'.dcm');
                movefile(fileNames{iFile},newName);        %# Rename the file
               
             else
        
                name=strcat('0',num2str(number));
                newName=strcat('image_',name);
                newName=strcat(newName,'.dcm');
                movefile(fileNames{iFile},newName);        %# Rename the file
            end
        end
        

end
clear;
dirData = dir('*.dcm');         %# Get the selected file data
fileNames = {dirData.name};     %# Create a cell array of file names
%change to number string 
for iFile = 1:numel(fileNames)  %# Loop over the file names
   n=numel(fileNames);
   n=n-iFile;
  newName = sprintf('%d.dcm',n);  %# Make the new name
  movefile(fileNames{iFile},newName);        %# Rename the file
end

clear;
dirData = dir('*.dcm');         %# Get the selected file data
fileNames = {dirData.name};     %# Create a cell array of file names
%change to number string 
for iFile = 1:numel(fileNames)  %# Loop over the file names
  newName =strcat('image_',fileNames{iFile});  %# Make the new name
  movefile(fileNames{iFile},newName);        %# Rename the file
end