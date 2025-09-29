//DM1595 Program Development for Interactive Media
//SuperCollider, Bonus Lab
//
//
//Plase write your name(s):
//
//
// Don't forget to comment your code!

////////////////////////////
///                      ///
///        Task 1        ///
///                      ///
////////////////////////////

// FM synthesis
(SynthDef(\fmSynth, {
    arg amp = 0.3;
    var freq_c, freq_m, index, mod, sig;

// carrier freq fixed
    freq_c = 200;
    index  = MouseX.kr(1, 1000);
    freq_m = MouseY.kr(1, 200);

    // Modulator: sine wave
    mod = SinOsc.ar(freq_m) * index;

    // Carrier: sine wave whose frequency is modulated
    sig = SinOsc.ar(freq_c + mod) * amp;

    Out.ar(0, sig!2);
}).add;)

x = Synth(\fmSynth);

////////////////////////////
///                      ///
///        Task 2        ///
///                      ///
////////////////////////////

// Granular synthesis  with  LFNoise2


// Example of LFNoise:
{[LFNoise0.ar(100).range(10, 100), LFNoise1.ar(100).range(10, 100), LFNoise2.ar(100).range(10, 100)]}.plot(0.1);


(
// Granulator with LFNoise2 controlling parameters
SynthDef(\grainNoise, {
    arg amp = 0.5;
    var harmonics, sound, trig, gDur, grain;

    // Additive odd harmonics, fundamental = 440 Hz
    harmonics = [
        Saw.ar(440 * 1, amp/1),
        Saw.ar(440 * 3, amp/3),
        Saw.ar(440 * 5, amp/5),
        Saw.ar(440 * 7, amp/7),
        Saw.ar(440 * 9, amp/9)
    ];
    sound = Mix(harmonics);

    // LFNoise2 controls
    gDur = LFNoise2.kr(2).range(0.001, 0.01);   // grain size 1–10 ms
    trig = Impulse.ar(LFNoise2.kr(2).range(10, 100)); // impulse freq 10–100 Hz

    // Granulator
    grain = GrainIn.ar(
        2,        // 2 channels
        trig,     // trigger signal
        gDur,     // grain duration
        sound     // input source
    );

    Out.ar(0, grain);
}).add;
)

x = Synth(\grainNoise);


////////////////////////////
///                      ///
///        Task 3        ///
///                      ///
////////////////////////////

(
// FM Synthesis Synth with LFNoise2
SynthDef(\fmSynthAuto, {
    arg amp = 0.3;
    var freq_c, freq_m, index, mod, sig;

    freq_c = 200;                                 // fixed carrier

    // LFNoise2 automates parameters
    index  = LFNoise2.kr(0.5).range(1, 1000);     // modulation index
    freq_m = LFNoise2.kr(0.3).range(1, 200);      // modulator frequency

    // Modulator and carrier
    mod = SinOsc.ar(freq_m) * index;
    sig = SinOsc.ar(freq_c + mod) * amp;

    Out.ar(0, sig!2);
}).add;
)

x = Synth(\fmSynthAuto);


////////////////////////////
///                      ///
///        Task 4        ///
///                      ///
////////////////////////////

// Synths from Taks 2 and Task 3 with  LFNoise1 on their amplitude.
// Play them at the s ame time and record the result!

(
// Combined Grain + FM synth with LFNoise1 amplitude control
SynthDef(\grainFmCombo, {
    var harmonics, grain, gDur, trig;
    var freq_c, freq_m, index, mod, fm;
    var ampCtrl;

    // Shared amplitude controller
    ampCtrl = LFNoise1.kr(5).range(0, 0.5);

    // GrainNoise source (additive odd harmonics @ 440 Hz)
    harmonics = [
        Saw.ar(440 * 1, 1/1),
        Saw.ar(440 * 3, 1/3),
        Saw.ar(440 * 5, 1/5),
        Saw.ar(440 * 7, 1/7),
        Saw.ar(440 * 9, 1/9)
    ];
    gDur = LFNoise2.kr(2).range(0.001, 0.01);
    trig = Impulse.ar(LFNoise2.kr(2).range(10, 100));
    grain = GrainIn.ar(1, trig, gDur, Mix(harmonics));  // mono

    // FM Synth Auto (carrier fixed @ 200 Hz)
    freq_c = 200;
    index  = LFNoise2.kr(0.5).range(1, 1000);
    freq_m = LFNoise2.kr(0.3).range(1, 200);
    mod = SinOsc.ar(freq_m) * index;
    fm  = SinOsc.ar(freq_c + mod);  // mono

    // stereo placement
    Out.ar(0, [grain * ampCtrl, fm * ampCtrl]);
}).add;
)

x = Synth(\grainFmCombo);
FreqScope.new;
