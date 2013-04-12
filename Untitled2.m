close all;
k = 0:7;
f16 = [cos(2.*pi*k/8) + 3*cos(4*pi*k/8)+ sin(6*pi*k/8) zeros(1,8)];
f256 = [f16 zeros(1,16)];
f32 = [f16 fliplr(f16)];
figure
hold;
plot(abs(fft(f256)),'o');

plot(abs(fft(f32)),'r');
x = 1:2:31;
plot(x, abs(fft(f16)),'r');
%stem(0:16:255, abs(fft(f16)),'filled');