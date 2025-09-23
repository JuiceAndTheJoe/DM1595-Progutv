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




////////////////////////////
///                      ///
///        Task 3        ///
///                      ///
////////////////////////////

// The previous two synths with envelopes




////////////////////////////
///                      ///
///        Task 4        ///
///                      ///
////////////////////////////

// Granulation:

(
SynthDef(\grain, {
	arg ...

	var
	sound = // ... //
	grain = GrainIn.ar(2, ...), //Pay attention here: thanks to that "2" the granulator will produce a stereo sound. If you want a mono sound, then write 1 instead.

	Out.ar(0, grain);
}).add
)