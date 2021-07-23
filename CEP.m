
s=tf('s');
t=0:0.002:20;
[u,t] = gensig("sin",5,20);
[y,t] = gensig("square",5,20);
G=(-5670)/(s^3+350*s^2-1962*s-686667); %open loop transfer function
H=1;
Kp=-197;
Ki=-1.19e3;
Kd=-8.11;
Dc=(Kp+(Ki/s)+(Kd*s));
T=feedback(2*G*Dc,1)
figure(1);
pzmap(T);
grid on
a = findobj(gca,'type','line');
for i = 1:length(a)
    set(a(i),'markersize',12) %change marker size
    set(a(i), 'linewidth',2)  %change linewidth
end
figure(2)
step(T);
set(findall(gcf,'type','line'),'linewidth',2);
title("Step Response")
ylabel("Amplitude")
grid on
figure(3)
lsim(T,u,t);
set(findall(gcf,'type','line'),'linewidth',2);
title("Sine Wave Tracking")
ylabel("Amplitude")
grid on
figure(4)
lsim(T,y,t);
set(findall(gcf,'type','line'),'linewidth',2);
title("Square Wave Tracking")
ylabel("Amplitude")
grid on
figure(5)
rlocus(G*Dc)
title('Root Locus GDc(s)')
set(findall(gcf,'type','line'),'linewidth',2);
% figure(6)
% bode(-G)
% set(findall(gcf,'type','line'),'linewidth',2);
% grid on
