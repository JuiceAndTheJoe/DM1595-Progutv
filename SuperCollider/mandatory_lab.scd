//DM1595 Program Development for Interactive Media
//SuperCollider, Mandatory Lab
//
//
//Plase write your name(s): Jose W. Velásquez C.
//
//
// Don't forget to comment your code!


////////////////////////////
///                      ///
///        Task 1        ///
///                      ///
////////////////////////////

// Additive synthesis with odd harmonics
(
SynthDef(\oddHarmonics, {
    arg freq = 100, amp = 0.5;
    var harmonics, sig;

    // Define odd harmonics of saw waves (1 thru 9)
    harmonics = [
        Saw.ar(freq * 1, amp/1),   // 1st partial
        Saw.ar(freq * 3, amp/3),   // 3rd partial
        Saw.ar(freq * 5, amp/5),   // 5th partial
        Saw.ar(freq * 7, amp/7),   // 7th partial
        Saw.ar(freq * 9, amp/9)    // 9th partial
    ];

    // Sum all harmonics using Mix
    sig = Mix(harmonics);

    // Stereo output
    Out.ar(0, sig!2);
}).add;
)

// Calling the synth:
x = Synth(\oddHarmonics);

// To change base frequency/amplitude while playing:
x.set(\freq, 230);
x.set(\amp, 0.3);

// Compare the additive sythesis of the harmonics to a singluar saw wave:
(
SynthDef (\test , {
arg freq = 100 , amp = 0.5;
var
saw1 = Saw.ar (freq, amp/1);

Out.ar (0, saw1);
}).add;
)

// We can hear a difference!! No harmonics this time :)
a = Synth (\test)


////////////////////////////
///                      ///
///        Task 2        ///
///                      ///
////////////////////////////

// Subtractive synthesis Synth
// Use the UGen Klank.ar. You can read about it using the documentation help.
// Watch the ` before the opening bracket of the parameter array!
// It is needed to make Klank properly read the array you will give to it.
//
// Here is an example:
{Klank.ar(`[[300, 389, 450, 560], [0.1, 0.2, 0.3, 0.1]], Impulse.ar(2, 0, 0.5))!2}.play;

//Write your Synth here now:

(
// Klank-based PinkNoise resonator Synth
SynthDef(\klankHarmonics, {
    arg freq = 220, amp = 0.5, decay = 2.5;
    var freqs, amps, rings, sig;

    // Create an array of 10 harmonic partials with random detuning +-10%
    freqs = Array.fill(10, { |i|
        freq * (i+1) * rrand(0.9, 1.1)  // harmonic number * detune factor
    });

    // Amplituds decreasing with harmonic index, as in Task 1
    amps = Array.fill(10, { |i|
        amp / (i+1)    // softer as harmonics go up
    });

    // Ring times (decay of resonances) are all equal
    rings = Array.fill(10, { decay });

    // Input excitation: pink noise
    sig = PinkNoise.ar(0.3);

    // Resonator bank
    sig = Klank.ar(`[freqs, amps, rings], sig);

    // Stereo out
    Out.ar(0, sig!2);
}).add;
)

// Calling the synth:
y = Synth(\klankHarmonics);



////////////////////////////
///                      ///
///        Task 3        ///
///                      ///
////////////////////////////

// The previous two synths with envelopes

(
// Additive synthesis with odd harmonics + envelope
SynthDef(\oddHarmonicsEnv, {
    arg freq = 100, amp = 0.5;
    var harmonics, sig, env;

    harmonics = [
        Saw.ar(freq * 1, amp/1),
        Saw.ar(freq * 3, amp/3),
        Saw.ar(freq * 5, amp/5),
        Saw.ar(freq * 7, amp/7),
        Saw.ar(freq * 9, amp/9)
    ];

    sig = Mix(harmonics);

    // Perc envelope: attack = 0.01s, release = 0.5s
    env = EnvGen.kr(Env.perc(0.01, 0.5), doneAction:2);

    Out.ar(0, (sig * env)!2);
}).add;
)

// Calling the Synth gives us a short, 8-bit type of tone:
x = Synth(\oddHarmonicsEnv);

(
// Klank resonator with triangle envelope
SynthDef(\klankHarmonicsEnv, {
    arg freq = 200, amp = 0.2, decay = 2.0;
    var freqs, amps, rings, sig, env;

    freqs = Array.fill(10, { |i|
        freq * (i+1) * rrand(0.9, 1.1)
    });

    amps = Array.fill(10, { |i|
        amp / (i+1)
    });

    rings = Array.fill(10, { decay });

    sig = PinkNoise.ar(0.3);

    sig = Klank.ar(`[freqs, amps, rings], sig);

    // Triangle envelope: 5s duration, scaled to 0.7
    env = EnvGen.kr(Env.triangle(5), doneAction:2);

    Out.ar(0, (sig * env * 0.7)!2);
}).add;
)

// We now get a segment of the sound, with the 'volume' of it being triangular:
y = Synth(\klankHarmonicsEnv);



////////////////////////////
///                      ///
///        Task 4        ///
///                      ///
////////////////////////////

// Granulation using additive sawtooth odd harmonics as input:

(
SynthDef(\grain, {
    arg amp = 0.5;
    var sound, harmonics, sig, trig, gDur, grain;

    // ----- Task 1 additive synthesis (odd harmonics, no env) -----
    harmonics = [
        Saw.ar(440 * 1, amp/1),
        Saw.ar(440 * 3, amp/3),
        Saw.ar(440 * 5, amp/5),
        Saw.ar(440 * 7, amp/7),
        Saw.ar(440 * 9, amp/9)
    ];
    sound = Mix(harmonics);

    // ----- Mouse control -----
    trig = Impulse.ar(MouseX.kr(10, 100));     // grain trigger rate: 10–100 Hz
    gDur = MouseY.kr(0.001, 0.01);             // grain size: 1–10 ms

    // ----- Granulator -----
    grain = GrainIn.ar(
        2,           // 2 channels
        trig,        // trigger signal
        gDur,        // grain duration
        sound        // input signal
    );

    Out.ar(0, grain);
}).add;
)

// Run it:
x = Synth(\grain);
FreqScope.new