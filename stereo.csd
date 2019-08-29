<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 44.1
nchnls = 2

instr 1
iamp = $AMP ;adjust as needed for louder or softer result
as1L, as1R loscil iamp, 1, 1, 1, 0 ;play soundfile 1. auto adjusted for sample rate
;proccess left channel
aresLL, aresLR ftconv as1L, 2, 2048 ;third parameter adjusts tradeoff between delay and CPU usage
almL tablei aresLL, 3, 0, 32768, 0 ;limiter
;process right channel
aresRL, aresRR ftconv as1R, 2, 2048 ;third parameter adjusts tradeoff between delay and CPU usage
almR tablei aresRR, 3, 0, 32768, 0 ;limiter
outs almL, almR
endin

</CsInstruments>
<CsScore>

;soundfiles
; use only stereo files. For mono files use mono.csd
; if file is not a wav, the filename extension must be changed (between double quotes)
; maximum length of file is 524288 audio samples (about 11.9 seconds for CD quality audio)
f 1 0 [524288] 1 "sound1.wav" 0 0 0 ;this file can be any sampling rate
f 2 0 [524288] 1 "sound2.wav" 0 0 0 ;this file should have 44.1kHz sampling rate!!!
;end soundfile input

f 3 0 65536 -7 -32768 65536 32768 ;limiting waveshaper function

i 1 0 24 ;convolve file 1 with file 2 for 24 seconds
e
</CsScore>
</CsoundSynthesizer>
