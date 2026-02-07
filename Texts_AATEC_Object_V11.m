
Language = evalin('base', 'Language');


if strcmp(Language, 'EN')

    SoundTextShort = (['After you make sure that the audio level is okay, please press Space.']);

    %----------------------------------------------------------------------
    %                      rest
    %----------------------------------------------------------------------
    StopText = double(['Please respond faster!']);

    TooShortText = double(['You did not press the Joystick long enough.\n' ...
        'Please keep the Joystick pressed till you see a fixation cross\n' ...
        'on the monitor, and then release it!']);

    WrongResponseText = double(['Please pay more attention.\n' ...
        'Your response was wrong!']);

    YesText = double(['Yes']);

    NoText = double(['No']);

    LikertQues = double(['Empty for now?']);

    lowerLikert = double(['not at all']);

    upperLikert = double(['absolutely']);



    %----------------------------------------------------------------------
    %                      Attention Texts
    %----------------------------------------------------------------------

    InBetweenText1 = double(['The first part of the experiment is finished. Please stay still\n' ...
        'till the experimenter comes and help you.']);

    InBetweenText1Short = (['Please be patient.']);

    InBetweenText2 = double(['The second part of the experiment is finished. Please let the experimenter know\n' ...
        'so they can start the next part for you.']);

    InBetweenText2Short = (['Please be patient.']);

    InBetweenText3 = double(['The third part of the experiment is finished. Please stay still\n' ...
        'till the experimenter comes and help you.']);

    InBetweenText3Short = (['Please be patient.']);


    InBetweenTextAttention = double(['If you do not respond in a couple of seconds\n' ...
        'the experiment ends automatically']);

    UnattentiveText = double(['Unfortunately, the experiment is automatically ended, as you were \n' ...
        'inattentive for more than a couple of minutes. Thanks for your participation.']);


    ColorText = double(['This is an attention test:\n' ...
        'What was the color of the frame of the stimulus you had just seen?\n' ...
        'Please use the keys on the responsebox, \n' ...
        'the left, middle, or right option shown below.']);

elseif strcmp(Language,'DE')

    SoundTextShort = (['Nachdem Du Dich vergewissert hast, dass der Tonpegel in Ordnung ist,\n' ...
        ' drücke bitte die Leertaste.']);
    
    %----------------------------------------------------------------------
    %                      rest
    %----------------------------------------------------------------------
    StopText = double(['Bitte reagiere schneller!']);

    TooShortText = double(['Bitte antworte so lange, \n' ...
        'bis Du das Fixierungskreuz sehen!']);

    WrongResponseText = double(['Bitte passe besser auf, \n' ...
        'Deine Antwort war falsch.']);

    YesText = double(['Ja']);

    NoText = double(['Nein']);

    LikertQues = double(['Empty for now?']);

    lowerLikert = double(['0']);

    upperLikert = double(['10']);



    %----------------------------------------------------------------------
    %                      Attention Texts
    %----------------------------------------------------------------------

    InBetweenText1 = double(['Dieser Teil ist beendet.  Bitte warte, ' ...
        'bis der*die Versuchsleiter*in kommt und dir weiter hilft.']);

    InBetweenText1Short = (['Bitte hab Geduld.']);

    InBetweenText2 = double(['Dieser Teil ist beendet. Wende dich bitte an \n' ...
        'den*die Versuchsleiter*in, um diesen Teil zu beenden und den nächsten Teil \n' ...
        'für dich zu beginnen.']);

    InBetweenText2Short = (['Bitte hab Geduld.']);

    InBetweenText3 = double(['Dieser Teil ist beendet.  Bitte warte, ' ...
        'bis der*die Versuchsleiter*in kommt und dir weiter hilft.']);

    InBetweenText3Short = (['Bitte hab Geduld.']);


    InBetweenTextAttention = double(['Wenn Du nicht innerhalb von ein paar Sekunden antwortest,\n' ...
        'wird das Experiment automatisch beendet.']);

    UnattentiveText = double(['Leider wird das Experiment automatisch beendet,\n' ...
        'da Du laenger als ein paar Minuten unaufmerksam warst.\n\n' ...
        'Vielen Dank für deine Teilnahme.']);


    ColorText = double(['Dies ist ein Aufmerksamkeitstest:\n' ...
        'Welche Farbe hatte der Rahmen des Reizes, den Du gerade gesehen hast?\n' ...
        'Bitte verwende die Tasten der Antwortbox\n' ...
        'um die linke, mittlere oder rechte Option zu waehlen.']);

end
