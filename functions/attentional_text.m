%----------------------------------------------------------------------
%                       Saving the attentional text
%----------------------------------------------------------------------
function attentional_text(ParticipantDir, participantNum, session, AttentionTestFailed,...
    TimeBegin, TimeEnd, ...
    color_test_correct, color_test_number,...
    CounterErrorAAT, CounterErrorEC, trialEC, trialAAT)
switch nargin
    case 8
        CounterErrorAAT = [];
        CounterErrorEC = [];
        trialEC = [];
        trialAAT = [];
    case 12
    otherwise
        error('inputs are not accepted.')
end
sessionNum = num2str(session);
if ~isfile(fullfile(ParticipantDir,['AttentionTest_',participantNum, '_', sessionNum, '.txt']))
    % Open a text file for writing
    fileID = fopen(fullfile(ParticipantDir,['AttentionTest_',participantNum, '_', sessionNum, '.txt']), 'w');
else
    % Open a text file for writing
    fileID = fopen(fullfile(ParticipantDir,['AttentionTest_',participantNum, '_', sessionNum, '_',...
        datestr(now,'mm-dd-yyyy_HH-MM'),'.txt']), 'w');
end

if AttentionTestFailed
    boolText = 'true';
else
    boolText = 'false';
end

% Print header text and values from variable A
fprintf('*******************************\n')
fprintf('The timing and attention tests results\n')
fprintf('*******************************\n')
fprintf(fileID, 'Did the participant fail the attention test:\n %s \n',boolText);
fprintf(fileID, 'When did the task start:\n%f\n',TimeBegin);
fprintf(fileID, 'How long was the task:\n%f\n',TimeEnd);

if ~isempty(CounterErrorAAT) && ~isempty(CounterErrorEC) && ~isempty(trialAAT) && ~isempty(trialEC)
    fprintf(fileID, 'How accurate was the AAT training:\n %f \n',1- CounterErrorAAT/trialAAT);
    fprintf(fileID, 'How accurate was the EC training:\n %f \n',1 - CounterErrorEC/trialEC);
else
    fprintf(fileID, 'How accurate was the AAT training:\n NA \n');
    fprintf(fileID, 'How accurate was the EC training:\n NA \n');
end

if color_test_number ~= 0
    fprintf(fileID, 'How accurate was the color test:\n %f \n',color_test_correct/color_test_number);
    fprintf(fileID, 'How many color tests:\n %f \n', color_test_number);
else
    fprintf(fileID, 'How accurate was the color test:\n NA \n');
    fprintf(fileID, 'How many color tests:\n NA \n');
end


% Close the file
fclose(fileID);
end