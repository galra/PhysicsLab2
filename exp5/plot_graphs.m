figure(1)
 semilogx(freq,I0_over_VG.*RT,'b'); 
 hold on
 semilogx(f,VRVG,'r.',[peak peak],[0 1],'g')
figure(2)
 plot(freq,I0_over_VG.*RT,'b'); 
 hold on
 plot(f,VRVG,'r.',[peak peak],[0 1],'g')