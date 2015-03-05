function adjacencyMatrix = importSensorLayout(readFile)

import rsa.*
import rsa.fig.*
import rsa.meg.*
import rsa.rdm.*
import rsa.sim.*
import rsa.spm.*
import rsa.stat.*
import rsa.util.*

%IMPORTFILE(FILETOREAD1)
%  Imports data from the specified file
%  FILETOREAD1:  file to read

%  Auto-generated by MATLAB on 09-Feb-2010 12:25:01

DELIMITER = ',';

% Import the file
adjacencyCell = readFileToCell(readFile);

maxLength = 0;

for lineNumber = 1:numel(adjacencyCell)

	thisLine = adjacencyCell{lineNumber};
	splitLine = splitStringAtCharacter(thisLine, DELIMITER);

	lineVector = [];

	for position = 1:numel(splitLine)
		lineVector = [lineVector str2num(splitLine{position})];
	end%for:position

	maxLength = max(maxLength, length(lineVector));

	allVectors{lineNumber} = lineVector;

end%for:lineNumber

adjacencyMatrix = nan(numel(adjacencyCell), maxLength);

for lineNumber = 1:numel(adjacencyCell)

	lineVector = allVectors{lineNumber};
	adjacencyMatrix(lineNumber, 1:length(lineVector)) = lineVector;

end%for:lineNumber
