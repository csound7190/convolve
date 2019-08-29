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

</CsInstruments>
<CsScore>

;soundfiles
; stereo files will load left channel only
; if file is not a wav, the filename extension must be changed (between double quotes)
; maximum length of file is 524288 audio samples (about 11.9 seconds for CD quality audio)
f 1 0 [524288] 1 "sound1.wav" 0 0 1 ;this file can be any sampling rate
f 2 0 [524288] 1 "sound2.wav" 0 0 1 ;this file should have 44.1kHz sampling rate!!!
;end soundfile input

f 3 0 65536 -7 -32768 65536 32768 ;limiting waveshaper function

i 1 0 24 ;convolve file 1 with file 2 for 24 seconds
e
</CsScore>
</CsoundSynthesizer>
