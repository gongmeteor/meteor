% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 657.391329404821704 ; 657.759004047215512 ];

%-- Principal point:
cc = [ 302.980880919391154 ; 242.618150187383435 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.255841248004513 ; 0.127558712879874 ; -0.000208584889428 ; 0.000033075081770 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 0.346744825048741 ; 0.370933311430400 ];

%-- Principal point uncertainty:
cc_error = [ 0.705122814270716 ; 0.645217042508222 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.002705357327537 ; 0.010752687097620 ; 0.000145716504417 ; 0.000143934008733 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 20;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.654781e+00 ; 1.651923e+00 ; -6.699945e-01 ];
Tc_1  = [ -5.919124e+02 ; -2.791442e+02 ; 2.843263e+03 ];
omc_error_1 = [ 8.233612e-04 ; 1.064055e-03 ; 1.360052e-03 ];
Tc_error_1  = [ 3.052203e+00 ; 2.814547e+00 ; 1.546388e+00 ];

%-- Image #2:
omc_2 = [ 1.849013e+00 ; 1.900564e+00 ; -3.971224e-01 ];
Tc_2  = [ -5.165373e+02 ; -5.311896e+02 ; 2.525335e+03 ];
omc_error_2 = [ 8.650965e-04 ; 1.057335e-03 ; 1.644573e-03 ];
Tc_error_2  = [ 2.725340e+00 ; 2.494981e+00 ; 1.520087e+00 ];

%-- Image #3:
omc_3 = [ 1.742393e+00 ; 2.077567e+00 ; -5.052461e-01 ];
Tc_3  = [ -4.174640e+02 ; -5.820996e+02 ; 2.584920e+03 ];
omc_error_3 = [ 7.917338e-04 ; 1.120335e-03 ; 1.700116e-03 ];
Tc_error_3  = [ 2.785901e+00 ; 2.553194e+00 ; 1.461241e+00 ];

%-- Image #4:
omc_4 = [ 1.827859e+00 ; 2.116782e+00 ; -1.103198e+00 ];
Tc_4  = [ -2.147661e+02 ; -5.162413e+02 ; 2.597000e+03 ];
omc_error_4 = [ 7.106482e-04 ; 1.160692e-03 ; 1.591960e-03 ];
Tc_error_4  = [ 2.807750e+00 ; 2.548421e+00 ; 1.177147e+00 ];

%-- Image #5:
omc_5 = [ 1.079054e+00 ; 1.922505e+00 ; -2.527474e-01 ];
Tc_5  = [ -3.074765e+02 ; -7.638587e+02 ; 2.455502e+03 ];
omc_error_5 = [ 6.941547e-04 ; 1.082341e-03 ; 1.218701e-03 ];
Tc_error_5  = [ 2.674422e+00 ; 2.431641e+00 ; 1.438984e+00 ];

%-- Image #6:
omc_6 = [ -1.701812e+00 ; -1.929288e+00 ; -7.914672e-01 ];
Tc_6  = [ -4.963351e+02 ; -2.654968e+02 ; 1.483251e+03 ];
omc_error_6 = [ 6.671614e-04 ; 1.080503e-03 ; 1.463665e-03 ];
Tc_error_6  = [ 1.602736e+00 ; 1.503394e+00 ; 1.231032e+00 ];

%-- Image #7:
omc_7 = [ 1.996752e+00 ; 1.931472e+00 ; 1.310634e+00 ];
Tc_7  = [ -2.764339e+02 ; -2.591222e+02 ; 1.467239e+03 ];
omc_error_7 = [ 1.277754e-03 ; 6.560841e-04 ; 1.535183e-03 ];
Tc_error_7  = [ 1.610206e+00 ; 1.469210e+00 ; 1.299742e+00 ];

%-- Image #8:
omc_8 = [ 1.961462e+00 ; 1.824261e+00 ; 1.326200e+00 ];
Tc_8  = [ -5.670316e+02 ; -3.452050e+02 ; 1.540228e+03 ];
omc_error_8 = [ 1.219459e-03 ; 6.692160e-04 ; 1.472331e-03 ];
Tc_error_8  = [ 1.760463e+00 ; 1.596205e+00 ; 1.464212e+00 ];

%-- Image #9:
omc_9 = [ -1.363688e+00 ; -1.980537e+00 ; 3.210326e-01 ];
Tc_9  = [ -6.252404e+00 ; -7.505359e+02 ; 2.428804e+03 ];
omc_error_9 = [ 8.314280e-04 ; 1.067784e-03 ; 1.375853e-03 ];
Tc_error_9  = [ 2.638706e+00 ; 2.394898e+00 ; 1.496562e+00 ];

%-- Image #10:
omc_10 = [ -1.513262e+00 ; -2.086815e+00 ; 1.882477e-01 ];
Tc_10  = [ -9.868030e+01 ; -1.001444e+03 ; 2.867188e+03 ];
omc_error_10 = [ 1.014080e-03 ; 1.214062e-03 ; 1.829629e-03 ];
Tc_error_10  = [ 3.171084e+00 ; 2.846878e+00 ; 1.986304e+00 ];

%-- Image #11:
omc_11 = [ -1.793083e+00 ; -2.064812e+00 ; -4.799201e-01 ];
Tc_11  = [ -5.035023e+02 ; -7.845521e+02 ; 2.349138e+03 ];
omc_error_11 = [ 9.096950e-04 ; 1.145602e-03 ; 1.969086e-03 ];
Tc_error_11  = [ 2.599637e+00 ; 2.437957e+00 ; 1.964997e+00 ];

%-- Image #12:
omc_12 = [ -1.839111e+00 ; -2.087341e+00 ; -5.155414e-01 ];
Tc_12  = [ -4.449253e+02 ; -5.907714e+02 ; 2.016568e+03 ];
omc_error_12 = [ 7.754979e-04 ; 1.100863e-03 ; 1.816586e-03 ];
Tc_error_12  = [ 2.214198e+00 ; 2.061440e+00 ; 1.642953e+00 ];

%-- Image #13:
omc_13 = [ -1.919017e+00 ; -2.116532e+00 ; -5.941673e-01 ];
Tc_13  = [ -4.422981e+02 ; -4.785386e+02 ; 1.815992e+03 ];
omc_error_13 = [ 7.233879e-04 ; 1.089621e-03 ; 1.785961e-03 ];
Tc_error_13  = [ 1.988224e+00 ; 1.845233e+00 ; 1.491093e+00 ];

%-- Image #14:
omc_14 = [ -1.954382e+00 ; -2.124573e+00 ; -5.844117e-01 ];
Tc_14  = [ -4.119843e+02 ; -4.571478e+02 ; 1.636331e+03 ];
omc_error_14 = [ 6.808321e-04 ; 1.067887e-03 ; 1.748429e-03 ];
Tc_error_14  = [ 1.794127e+00 ; 1.661066e+00 ; 1.338241e+00 ];

%-- Image #15:
omc_15 = [ -2.110766e+00 ; -2.253834e+00 ; -4.948418e-01 ];
Tc_15  = [ -6.637943e+02 ; -4.483699e+02 ; 1.583457e+03 ];
omc_error_15 = [ 7.858159e-04 ; 1.000132e-03 ; 1.905600e-03 ];
Tc_error_15  = [ 1.759618e+00 ; 1.647403e+00 ; 1.442317e+00 ];

%-- Image #16:
omc_16 = [ 1.886911e+00 ; 2.336198e+00 ; -1.735874e-01 ];
Tc_16  = [ -5.310417e+01 ; -5.677858e+02 ; 2.318541e+03 ];
omc_error_16 = [ 1.080359e-03 ; 1.141237e-03 ; 2.372381e-03 ];
Tc_error_16  = [ 2.503019e+00 ; 2.272535e+00 ; 1.708090e+00 ];

%-- Image #17:
omc_17 = [ -1.612906e+00 ; -1.953390e+00 ; -3.473508e-01 ];
Tc_17  = [ -4.507688e+02 ; -4.631916e+02 ; 1.633951e+03 ];
omc_error_17 = [ 6.726903e-04 ; 1.028943e-03 ; 1.450282e-03 ];
Tc_error_17  = [ 1.771090e+00 ; 1.647733e+00 ; 1.186103e+00 ];

%-- Image #18:
omc_18 = [ -1.341748e+00 ; -1.692554e+00 ; -2.970114e-01 ];
Tc_18  = [ -6.178918e+02 ; -5.260034e+02 ; 1.470965e+03 ];
omc_error_18 = [ 7.720325e-04 ; 9.996061e-04 ; 1.144956e-03 ];
Tc_error_18  = [ 1.610191e+00 ; 1.501965e+00 ; 1.152160e+00 ];

%-- Image #19:
omc_19 = [ -1.925984e+00 ; -1.837921e+00 ; -1.440322e+00 ];
Tc_19  = [ -3.552122e+02 ; -2.652423e+02 ; 1.113849e+03 ];
omc_error_19 = [ 6.640566e-04 ; 1.170994e-03 ; 1.483912e-03 ];
Tc_error_19  = [ 1.249466e+00 ; 1.146240e+00 ; 1.080586e+00 ];

%-- Image #20:
omc_20 = [ 1.896151e+00 ; 1.593138e+00 ; 1.471914e+00 ];
Tc_20  = [ -4.794408e+02 ; -2.934570e+02 ; 1.320578e+03 ];
omc_error_20 = [ 1.236945e-03 ; 6.843073e-04 ; 1.333360e-03 ];
Tc_error_20  = [ 1.525061e+00 ; 1.366173e+00 ; 1.307255e+00 ];

