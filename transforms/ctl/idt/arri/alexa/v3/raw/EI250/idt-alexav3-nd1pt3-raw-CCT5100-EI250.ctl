
// ARRI ALEXA IDT for ALEXA linear files
//  with camera EI set to 250
//  and CCT of adopted white set to 5100K
// Written by v3_IDT_maker.py v0.06 on Thursday 01 March 2012 by alex

const float EI = 250.0;
const float black = 256.0 / 65535.0;
const float exp_factor = 0.18 / (0.01 * (400.0/EI));

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	// convert to white-balanced, black-subtracted linear values
	float r_lin = (rIn - black) * exp_factor;
	float g_lin = (gIn - black) * exp_factor;
	float b_lin = (bIn - black) * exp_factor;

	// convert to ACES primaries using CCT-dependent matrix
	rOut = r_lin * 0.743928 + g_lin * 0.167365 + b_lin * 0.088707;
	gOut = r_lin * 0.066285 + g_lin * 1.051705 + b_lin * -0.117990;
	bOut = r_lin * 0.084029 + g_lin * -0.453055 + b_lin * 1.369026;
	aOut = 1.0;

}