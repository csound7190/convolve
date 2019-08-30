<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 44.1
nchnls = 1

instr 1
iamp = $AMP ;adjust as needed for louder or softer result
as1 loscil iamp, 1, 1, 1, 0 ;play soundfile 1. auto adjusted for sample rate
ares ftconv as1, 2, 2048 ;third parameter adjusts tradeoff between delay and CPU usage
alm tablei ares, 3, 0, 32768, 0 ;limiter
out alm
endin

instr 2
iamp = $AMP ;adjust as needed for louder or softer result
ipitchs1 table p4, 4, 0 ;pitch control based on a scale table 
as1 loscil iamp, ipitchs1, 1, 1, 0 ;play sound1. p4 will change pitch!
ares ftconv as1, 2, 2048
alm tablei ares, 3, 0, 32768, 0
out alm
endin

</CsInstruments>
<CsScore>

;soundfiles
; stereo files will load left channel only
; if file is not a wav, the filename extension must be changed (between double quotes)
; maximum length of file is 524288 audio samples (about 11.9 seconds for CD quality audio)
f 1 0 [524288*4] 1 "sound1.wav" 0 0 1 ;this file can be any sampling rate
f 2 0 [524288*4] 1 "sound2.wav" 0 0 1 ;this file should have 44.1kHz sampling rate!!!
;end soundfile input

f 3 0 65536 -7 -32768 65536 32768 ;limiting waveshaper function

f 4 0 4 -2 2.8996 .0625 .0625 .125 .125 ;musical scale

;t 0 120

i 2 00.000 24.000 0 ;
/*
i 2 00.360 24.000 2 ;
i 2 00.810 24.000 3 ;
i 2 01.290 24.000 4 ;
i 2 01.590 24.000 5 ;
i 2 02.010 24.000 0 ;
*/
/*
b 12

i 2 00.000 12.000 0 ;
i 2 00.360 12.000 5 ;
i 2 00.810 12.000 4 ;
i 2 01.290 12.000 3 ;
i 2 01.590 12.000 2 ;
i 2 02.010 24.000 1 ;
*/
e

</CsScore>
</CsoundSynthesizer>
