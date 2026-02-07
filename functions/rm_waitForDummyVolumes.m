%----------------------------------------------------------------------
%                       LPT read fMRI
%----------------------------------------------------------------------

function [] = rm_waitForDummyVolumes( n, inputPort, inputByte )

passed = 0;
while passed <= n

    byte=inp(inputPort);

    % warte auf Onset des pulseByte
    while byte ~= inputByte
        byte=inp(inputPort);
    end

    % warte auf Offset des pulseBytes
    while byte == inputByte
        byte=inp(inputPort);
    end

    % pulseByte-Zähler erhöhen
    passed = passed + 1;

end

end
