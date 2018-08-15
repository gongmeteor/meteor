function saving_general_calib(filename, omc, Tc, fc, cc, kc, alpha_c)

fp = fopen(filename, 'w');
fprintf(fp, 'omc = [%f; %f; %f];\n', omc(1), omc(2), omc(3));
fprintf(fp, 'Tc = [%f; %f; %f];\n', Tc(1), Tc(2), Tc(3));
fprintf(fp, 'fc = [ %f ; %f ];\n', fc(1), fc(2));
% fprintf(fp, 'cc = [];'
fclose(fp);

end