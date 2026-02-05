%----------------------------------------------------------------------
%                       General Attention Test
%----------------------------------------------------------------------
function AttentionTestFailed = general_attention(varargin)

AttentionTestFailed = false;
if ~islogical(varargin{1})
    Image = false;
    switch nargin
        case 2
            text = varargin{1};
            wait = varargin{2};
            sessionNum = evalin('caller', 'sessionNum');
        case 3
            text = varargin{1};
            wait = varargin{2};
            sessionNum = varargin{3};    
        otherwise
            error('Inputs are not accepted.')
    end
else
    Image = true;
    if isfile(varargin{2})
        Image_path = varargin{2};
    else
        error('The image file cannot be found.')
    end

    switch nargin
        case 3 
            wait = varargin{3};
            sessionNum = evalin('caller', 'sessionNum');
        case 4
            wait = varargin{3};
            sessionNum = varargin{4};  
        otherwise
            error('Inputs are not accepted.')
    end
end



window = evalin('caller', 'window');
waitframes = evalin('caller', 'waitframes');
vbl = evalin('caller', 'vbl');
ifi = evalin('caller', 'ifi');
attentionTime = evalin('caller', 'attentionTimeLong');
white = evalin('caller', 'white');
endTime = evalin('caller', 'endTime');
ImgEmoPath = evalin('caller', 'ImgEmoPath');
rectStop = evalin('caller', 'rectStop');
StopY = evalin('caller', 'StopY');
waitPunishment = evalin('caller', 'waitPunishment');
ParticipantDir = evalin('caller', 'ParticipantDir');
participantNum = evalin('caller', 'participantNum');
color_test_correct = evalin('caller', 'color_test_correct');
color_test_number = evalin('caller', 'color_test_number');
TimeBegin = evalin('caller', 'TimeBegin');
session = evalin('caller', 'session');
screenYpixels = evalin('base', 'screenYpixels');

Screen('Preference', 'TextEncodingLocale','UTF-8')
Texts_AATEC_Object_V11;

if Image
    img = imread(Image_path);
    target_height = screenYpixels;
    target_size = [target_height NaN];
    img = imresize(img, target_size);

    if sessionNum == 4
        rectBox = evalin('caller', 'rectBox');
        pen_width = evalin('caller', 'pen_width');
        loc_tmp = 270;
        rectBox = rectBox + [0, loc_tmp, 0, loc_tmp];
        rect = evalin('caller', 'rect');
        rect = rect + [0, loc_tmp, 0, loc_tmp];
        img_obj = imread(fullfile(ImgEmoPath,'StopSign', 'Person.png'));
        img_obj = coloring_fucntion(img_obj, white);
    end
    
    respToBeMade = true;
    timeStart = GetSecs;
    KbQueueCreate([]);
    KbQueueStart([]);
    while GetSecs - timeStart < attentionTime && respToBeMade
        if (GetSecs - timeStart) > (attentionTime - endTime)
            img = imread(fullfile(ImgEmoPath,'StopSign', 'Stop.png'));
            Texture = Screen('MakeTexture', window, img);
            Screen('DrawTexture', window, Texture, [], rectStop);
            DrawFormattedText(window, InBetweenTextAttention,...
                'center', StopY, white)
        else
            Texture = Screen('MakeTexture', window, img);
            Screen('DrawTexture', window, Texture, []);
            if sessionNum == 4
                % drawing the Image
                Texture_obj = Screen('MakeTexture', window, img_obj);
                Screen('DrawTexture', window, Texture_obj, [], rect);
                Screen('FrameRect', window, colorTranslator('w'), rectBox, pen_width);
            end
        end

        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);

        % checking for a button press
        [Pressed,~] = KbQueueCheck([]);
        if Pressed && GetSecs - timeStart > wait
            respToBeMade = false;
        end
        Screen('Close');
    end
    KbQueueRelease([]);
    
else
    if sessionNum == 4

        rectBox = evalin('caller', 'rectBox');
        pen_width = evalin('caller', 'pen_width');
        loc_tmp = 175;
        rectBox = rectBox + [0, loc_tmp, 0, loc_tmp];
        rect = evalin('caller', 'rect');
        rect = rect + [0, loc_tmp, 0, loc_tmp];
        img = imread(fullfile(ImgEmoPath,'StopSign', 'Person.png'));
        img = coloring_fucntion(img, white);
    end


    respToBeMade = true;
    timeStart = GetSecs;
    KbQueueCreate([]);
    KbQueueStart([]);
    while GetSecs - timeStart < attentionTime && respToBeMade
        if (GetSecs - timeStart) > (attentionTime - endTime)
            img = imread(fullfile(ImgEmoPath,'StopSign', 'Stop.png'));
            Texture = Screen('MakeTexture', window, img);
            Screen('DrawTexture', window, Texture, [], rectStop);
            DrawFormattedText(window, InBetweenTextAttention,...
                'center', StopY, white)
        else
            DrawFormattedText(window, text,...
                'center', 'center', white);
            if sessionNum == 4
                % drawing the Image
                Texture = Screen('MakeTexture', window, img);
                % drawing the box around the image
                Screen('FrameRect', window, colorTranslator('w'), rectBox, pen_width);
                Screen('DrawTexture', window, Texture, [], rect);
            end
        end

        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);

        % checking for a button press
        [Pressed,~] = KbQueueCheck([]);
        if GetSecs - timeStart > wait && Pressed 
            respToBeMade = false;
        end
        Screen('Close');
    end
    KbQueueRelease([]);

    if respToBeMade && (GetSecs - timeStart) > attentionTime
        % Setting the parameters for the last part
        AttentionTestFailed = true;
        TimeEnd = GetSecs-TimeBegin;

        if sessionNum == 2
            CounterErrorAAT = evalin('caller', 'CounterErrorAAT');
            CounterErrorEC = evalin('caller', 'CounterErrorEC');
            trialEC = evalin('caller', 'trialEC');
            trialAAT = evalin('caller', 'trialAAT');

            attentional_text(ParticipantDir, participantNum, session, AttentionTestFailed, TimeBegin, TimeEnd, ...
                color_test_correct, color_test_number,...
                CounterErrorAAT, CounterErrorEC, trialEC, trialAAT)
        else
            attentional_text(ParticipantDir, participantNum, session, AttentionTestFailed, TimeBegin, TimeEnd, ...
                color_test_correct, color_test_number)
        end

        img = imread(fullfile(ImgEmoPath,'StopSign', 'Stop.png'));
        Texture = Screen('MakeTexture', window, img);
        Screen('DrawTexture', window, Texture, [], rectStop);
        DrawFormattedText(window, UnattentiveText,...
            'center', StopY, white)
        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
        WaitSecs(waitPunishment);
        ShowCursor;
        close all
        warning('Terminated by user input:!!nothing is saved!!')
        sca;
        return
    end
end
end