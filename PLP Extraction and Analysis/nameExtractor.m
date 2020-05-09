function fileNames = nameExtractor(targetFolderName,numOfFileNames)
%NAMEEXTRACTOR Summary of this function goes here
%Extract all file names in targer folder
%   Detailed explanation goes here

folderInfo = dir(targetFolderName);

fileNames = cell(numOfFileNames,1);
numOfExtraFiles = 2; %For some reason there are always 2 more file names such as '.'and '..'

for fileOrder = 1:numOfFileNames
    currentIndex = fileOrder+numOfExtraFiles;%Start from 3
    fileNames(fileOrder,1) = {folderInfo(currentIndex).name};
end


end

