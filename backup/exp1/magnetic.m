exp1_a1 = [0
4
8
12
16
20
-4
-8
-12
-16
-20] / 1000

exp1_a2 = [0
4
8
12
16
20
-4
-8
-12
-16
-20] / 1000

exp1_i1 = [0
0.032
0.0679
0.1058
0.1494
0.1891
-0.0326
-0.07
-0.1096
-0.1504
-0.1974] * (-1)

exp1_i2 = [0
0.0399
0.0848
0.133
0.1838
0.2363
-0.0421
-0.0871
-0.1352
-0.1855
-0.244] * (-1)

exp1_Va1 = [1083
1083
1083
1083
1083
1083
1083
1083
1083
1083
1083]

exp1_Va2 = [1616
1616
1616
1616
1616
1616
1616
1616
1616
1616
1616]

exp1_i_sqrtVa1 = exp1_i1 ./ sqrt(exp1_Va1)
exp1_i_sqrtVa2 = exp1_i2 ./ sqrt(exp1_Va2)

exp1_lm1 = fitlm(exp1_a1, exp1_i_sqrtVa1)
exp1_lm2 = fitlm(exp1_a2, exp1_i_sqrtVa2)

exp1_lin1 = (exp1_a1 * exp1_lm1.Coefficients.Estimate(2)) + exp1_lm1.Coefficients.Estimate(1)
exp1_lin2 = (exp1_a2 * exp1_lm2.Coefficients.Estimate(2)) + exp1_lm2.Coefficients.Estimate(1)

hold on
plot(exp1_a1, exp1_i_sqrtVa1, 'xb', exp1_a2, exp1_i_sqrtVa2, 'xr', exp1_a1, exp1_lin1, '-b', exp1_a2, exp1_lin2, '-r')
l = legend('$\displaystyle Exp. V_a=1083[V]$', '$\displaystyle Exp. V_a=1616[V]$', '$\displaystyle Lin. Reg. a = k_1 \cdot \frac{i}{\sqrt{V_a}} + b_1$', '$\displaystyle Lin Reg. a = k_2 \cdot \frac{i}{\sqrt{V_a}} + b_2$', 'Location', 'northeast')
set(l, 'Interpreter', 'LaTex')
xlabel('$a [m]$', 'Interpreter', 'latex')
y = ylabel('$\frac{i}{\sqrt{V_a}} [\frac{amp}{\sqrt{V}}]$')
set(y, 'Interpreter', 'Latex')
hold off
print('magnetic1.png', '-dpng')

Ll = 252 / 1000
dLl = 0.5 / 1000
l = 36.4 / 1000
dl = 0.1 / 1000
d = 2 / 1000
dd = 0.1 / 1000


R = 0.049
b = 2*R
B_B0 = 0.1
K1_1 = exp1_lm1.Coefficients.Estimate(2)
K1_2 = exp1_lm2.Coefficients.Estimate(2)
K1 = mean([ K1_1 K1_2 ])
n = 3250
miu0 = 4*pi*1E-7
e_m = (K1 * 2 * sqrt(2) / (n*miu0*B_B0*b*b))^2
some_const = n*miu0*B_B0 / (2 * sqrt(2))
db = 0.004
dk = 0.002
de_m = sqrt((16*K1^4*db^2/(some_const^4*b^10)) + 4*K1^2*dk^2/(some_const^4*b^8))