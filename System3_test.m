%System 3 test - causal, linear, time varrying, memoryless
%Ariel Motsenyat - motsenya 
%Sharon Cai - cais12

%causality test: causal as the present output of this function is not dependent on future input
n = -5:5;

x1 = [0 0 0 0 0 1 0 0 0 0 0]; %unit impulse
x2 = [0 0 0 0 0 1 1 1 1 1 1]; %step function
x3 = [0 0 0 0 0 0 1 2 3 4 5]; %ramp function

y1 = system3(n,x1); %test with unit impulse
y2 = system3(n,x2); %test with step function
y3 = system3(n,x3); %test with ramp function

%graphs
figure, 
subplot(2,3,1), stem(n,x1), title('x1[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,3,4), stem(n,y1), title('y1[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,3,2), stem(n,x2), title('x2[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,3,5), stem(n,y2), title('y2[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,3,3), stem(n,x3), title('x3[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,3,6), stem(n,y3), title('y3[n]'), xlabel('n'),ylabel('y[n]')
sgtitle('Causality Test');

%Homogeneity test: output is scaled by the same factor as input, therefore
%it is homogenous
n = -5:5;

x4 = [0 0 0 0 0 1 1 1 1 1 1]; %step function
x5 = [0 0 0 0 0 3 3 3 3 3 3]; %step function scaled by 3
x6 = [0 0 0 0 0 1 0 0 0 0 0]; %unit impulse
x7 = [0 0 0 0 0 -5 0 0 0 0 0]; %unit impulse scaled by -5
x8 = [0 0 0 0 0 0 1 2 3 4 5]; %ramp function
x9 = [0 0 0 0 0 0 -1 -2 -3 -4 -5]; %ramp function scaled by -1

y4 = system3(n,x4); %test with step function
y5 = system3(n,x5); %test with scaled step function
y6 = system3(n,x6); %test with unit impulse
y7 = system3(n,x7); %test with unit impulse scaled by -5
y8 = system3(n,x8); %test with ramp function
y9 = system3(n,x9); %test with ramp function scaled by -1

%graphs
figure, 
subplot(2,6,1), stem(n,x4), title('x4[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,7), stem(n,y4), title('y4[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,2), stem(n,x5), title('3*x4[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,8), stem(n,y5), title('3*y4[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,3), stem(n,x6), title('x6[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,9), stem(n,y6), title('y6[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,4), stem(n,x7), title('-5*x6[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,10), stem(n,y7), title('-5*y6[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,5), stem(n,x8), title('x8[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,11), stem(n,y8), title('y8[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,6), stem(n,x9), title('-x8[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,12), stem(n,y9), title('-y8[n]'), xlabel('n'),ylabel('y[n]')
sgtitle('Linearity Test (Homogeneity)');

%Additivity test: function is additive and scales, thus is linear
n = -5:5;
x19 = [0 0 0 0 0 0 1 2 3 4 5]; 
x20 = [0 0 0 0 0 0 5 4 3 2 1]; 
x21 = x19 + x20; %addition of x19 and x20
x22 = [0 0 0 0 0 1 1 1 1 1 1];
x23 = [0 0 0 0 0 -3 -3 -3 -3 -3 -3];
x24 = x22 + x23; %addition of x22 and x23

y19 = system3(n,x19); 
y20 = system3(n,x20); 
y21 = system3(n,x21); %test with added functions y19 and y20
y22 = system3(n,x22); 
y23 = system3(n,x23); 
y24 = system3(n,x24); %test with added functions y22 and y23

%graphs
figure, 
subplot(2,6,1), stem(n,x19), title('x19[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,7), stem(n,y19), title('y19[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,2), stem(n,x20), title('x20[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,8), stem(n,y20), title('y20[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,3), stem(n,x21), title('x19[n] + x20[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,9), stem(n,y21), title('y(x19[n] + x20[n])'), xlabel('n'),ylabel('y[n]')
subplot(2,6,4), stem(n,x22), title('x22[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,10), stem(n,y22), title('y22[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,5), stem(n,x23), title('x23[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,11), stem(n,y23), title('y23[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,6), stem(n,x24), title('x22[n] + x23[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,12), stem(n,y24), title('y22[n] + y23[n]'), xlabel('n'),ylabel('y[n]')
sgtitle('Linearity Test (Additivity)');

%Time varience: Time varrying, when the unit impulse function is shifted to
%the right by 3, the n value is different
n = -5:5;

x10 = [0 0 0 0 0 1 1 1 1 1 1]; %step function u[n]
x11 = [0 0 0 1 1 1 1 1 1 0 0]; %step function shifted by 2 to the left u[n+2]
x12 = [0 0 0 0 0 1 0 0 0 0 0]; %unit impulse d[n]
x13 = [0 0 0 0 0 0 0 0 1 0 0]; %unit impulse shifted by 3 to the right d[n-3]
x14 = [0 0 0 0 0 0 1 2 3 4 5]; %ramp function r[n]
x15 = [0 0 1 2 3 4 5 0 0 0 0]; %ramp function shifted 4 to the left r[n+4]

y10 = system3(n,x10);
y11 = system3(n,x11); %test with u[n+2]
y12 = system3(n,x12);
y13 = system3(n,x13); %test with d[n-3]
y14 = system3(n,x14);
y15 = system3(n,x15); %test with r[n+4]

%graphs
figure, 
subplot(2,6,1), stem(n,x10), title('x10[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,7), stem(n,y10), title('y10[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,2), stem(n,x11), title('x10[n+2]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,8), stem(n,y11), title('y10[n+2]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,3), stem(n,x12), title('x12[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,9), stem(n,y12), title('y12[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,4), stem(n,x13), title('x12[n-3]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,10), stem(n,y13), title('y12[n-3]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,5), stem(n,x14), title('x14[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,11), stem(n,y14), title('y14[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,6,6), stem(n,x15), title('x14[n+4]'), xlabel('n'),ylabel('x[n]')
subplot(2,6,12), stem(n,y15), title('y14[n+4]'), xlabel('n'),ylabel('y[n]')
sgtitle('Time-Variance Test');

%memory: output is produced only at the specified inputs, therefore, it is
%memoryless
n = -5:5;

x16 = [0 0 0 0 0 1 0 0 0 0 0]; %unit impulse d[n]
x17 = [0 0 0 1 0 1 0 0 0 0 0]; %unit impulse + unit impulse shifted left by 1 d[n] + d[n+2]
x18 = [0 0 0 1 0 1 0 1 0 1 0]; %d[n+2] + d[n] + d[n-2] + d[n-4]

y16 = system3(n,x16);
y17 = system3(n,x17); %test with d[n] + d[n+1]
y18 = system3(n,x18); %test with d[n+2] + d[n] + d[n-2] + d[n-4]

%graphs
figure, 
subplot(2,3,1), stem(n,x16), title('x16[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,3,4), stem(n,y16), title('y16[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,3,2), stem(n,x17), title('x16[n+2] + x16[n]'), xlabel('n'),ylabel('x[n]')
subplot(2,3,5), stem(n,y17), title('y16[n+2] + y16[n]'), xlabel('n'),ylabel('y[n]')
subplot(2,3,3), stem(n,x18), title('x16[n+2] + x16[n] + x16[n-2] + x16[n-4]'), xlabel('n'),ylabel('x[n]')
subplot(2,3,6), stem(n,y18), title('y16[n+2] + y16[n] + y16[n-2] + y16[n-4]'), xlabel('n'),ylabel('y[n]')
sgtitle('Memory Test');