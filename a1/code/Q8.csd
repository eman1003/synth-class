<CsoundSynthesizer>
<CsOptions>
//-n -d 
-o /Users/ethanslogotski/Documents/Uvic/CSC484D/Q8.wav -W -3
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1 // Sawtooth
aOut vco2 0.01, mtof:i(p4)
    out aOut, aOut
endin

instr 2 // Sine Wave

iflg = p5
aOut oscils 0.01, mtof:i(p4), 0, iflg
     out aOut, aOut
endin

instr 3 // Square
aOut vco2 0.01, mtof:i(p4), 10
    out aOut, aOut
endin

instr 4 // Triangle
aOut vco2 0.01, mtof:i(p4), 12
    out aOut, aOut
endin

instr 5 // Noise
kbeta line -0.9999, p4, 0.9999
aOut noise 0.01, kbeta
aOut clip aOut, 2, .9
    out aOut, aOut
endin

// Plays melody from instrument type, starting time, length, and pitch

</CsInstruments>
<CsScore>
i1 0 0.5 67
i1 0.51 0.5 67
i1 1.01 0.5 67
i1 1.5 0.375 63
i1 1.875 0.125 70
i1 2 0.5 67
i1 2.5 0.375 63
i1 2.875 0.125 70
i1 3 1 67

i2 4 0.5 74 0
i2 4.51 0.5 74 0
i2 5.01 0.5 74 0
i2 5.5 0.375 75 0
i2 5.875 0.125 70 0
i2 6 0.5 66
i2 6.51 0.375 63
i2 6.875 0.125 70
i2 7 1 67

i3 8 0.5 79
i3 8.5 0.375 67
i3 8.88 0.125 67
i3 9 0.5 79
i3 9.5 0.375 78
i3 9.875 0.125 77
i3 10 0.125 76
i3 10.125 0.125 75
i3 10.25 0.25 76
i3 10.75 0.25 66
i3 11 0.5 73
i3 11.5 0.375 72
i3 11.875 0.125 71
i3 12 0.125 70
i3 12.125 0.125 69
i3 12.25 0.25 70

i4 12.75 0.25 63
i4 13 0.5 66
i4 13.5 0.375 63 
i4 13.875 0.125 70
i4 14 0.5 67
i4 14.5 0.375 63
i4 14.875 0.125 70
i4 15 1 67

i5 17 2 10

e
</CsScore>
</CsoundSynthesizer>