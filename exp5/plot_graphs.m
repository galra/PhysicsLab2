I0_over_VG_gen = @(f) 1/(RT*sqrt(1+Q^2*(f/f0 - f0/f)^2));
I0_over_VG = vertcat(arrayfun(I0_over_VG_gen, calc_theo_freq ));

figure(1)
 semilogx(calc_theo_freq , I0_over_VG, 'b'); 
 hold on
 semilogx(f,VRVG ./ R,'r.',[peak peak],[0 vert_line_height],'g')
 title('Circuit''s frequency resonance (x-log scale)');
 ylabel('I0/VG [Ohm]');
 xlabel('f [Hz]');
 legend('Theoretical curve for the system', 'Measured values', ...
     'theoretical f0 (resonance freq.)', 'Location', 'NorthWest');
 print(sprintf('exp%d_log_plot.png', exp_num), '-dpng');
figure(2)
 plot(calc_theo_freq ,I0_over_VG,'b'); 
 hold on
 plot(f,VRVG ./ R,'r.',[peak peak],[0 vert_line_height],'g')
 title('Circuit''s frequency resonance');
 ylabel('I0/VG [Ohm]');
 xlabel('f [Hz]');
 legend('Theoretical curve for the system', 'Measured values', 'theoretical f0 (resonance freq.)');
 print(sprintf('exp%d_plot.png', exp_num), '-dpng');