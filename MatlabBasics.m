%Intro Matlab Tutorial

%Fibonacci Sequence

lastVal = 10;
n1 = 0;
n2 = 1;
n0 = 0;

for i= 1:lastVal
  n0 = n1+n2;
  n1 = n2;
  n2 = n0;
  disp(n0);
end
clear();%Will clear all variables previously used from the workspace
disp(n0);%Will Result in an undefined variable n0 because it was cleared

%All variables are cleared at the beginning and ending of when you Run a
%script
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%String and Char operations

thisString = "hello"
thisCharArray = 'world'

%String and char are mostly interchangable. The only difference is each
%letter is indexed seperately in chars where the string is indexed as one
%element
thisString(1)%Prints "hello"
thisCharArray(1)%prints "w"

%There are multiple ways to concatenate strings and char arrays.
concatStr = strcat(thisString,", ",thisCharArray) % prints "hello, world".

str = thisString + ", "+thisCharArray % prints "hello, world".

% if we have multiple strings and want to put them into a string array we
% use []
strArray = [thisString,",",string(thisCharArray)]
strArray(:)
clear();


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%File IO

fileID = fopen("info.txt",'r')
fgets(fileID)
fclose(fileID);
clear
%For matlab data use 
load someData %loads anything with the name "someData" this data will persist until we clear() or end the script
whos%show us what is in the workshop currently
clear someData
whos
clear();


%Matlabs Data Structures
data.x = 1:100;
data.y = {'a','b','c','d','e','f','g','h','i','j'};
save('data')
clear data
whos
load data
whos

clear();








