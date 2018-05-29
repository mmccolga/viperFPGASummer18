Fs = 1000;
t = 0:1/Fs:0.1;

f = 100;
x = sin(2*pi*t*f);
nfft = 1024;
X = fft(x,nfft);
X = X(1:nfft/2);
mx = abs(X);
f = (0:nfft/2-1)*Fs/nfft;

t2 = 0:1/(100*Fs):0.1;
f5 = 100;
x5 = sin(2*pi*t2*f5);
nfft5 = 1024;
X5 = fft(x5,nfft5);
X5 = X5(1:nfft5/2);
mx5 = abs(X5);
f5 = (0:nfft5/2-1)*Fs/nfft5;
figure(1);
subplot(5,1,1);
plot(t2,x5)

f2 = 200;
x2 = sin(2*pi*t*f2);
nfft2 = 1024;
X2 = fft(x2,nfft2);
X2 = X2(1:nfft2/2);
mx2 = abs(X2);
f2 = (0:nfft2/2-1)*Fs/nfft2;

f6 = 200;
x6 = sin(2*pi*t2*f6);
nfft6 = 1024;
X6 = fft(x6,nfft6);
X6 = X6(1:nfft6/2);
mx6 = abs(X6);
f6 = (0:nfft6/2-1)*Fs/nfft6;
subplot(5,1,2);
plot(t2,x6)

f3 = 300;
x3 = sin(2*pi*t*f3);
nfft3 = 1024;
X3 = fft(x3,nfft3);
X3 = X3(1:nfft3/2);
mx3 = abs(X3);
f3 = (0:nfft3/2-1)*Fs/nfft3;

f7 = 300;
x7 = sin(2*pi*t2*f7);
nfft7 = 1024;
X7 = fft(x7,nfft7);
X7 = X7(1:nfft7/2);
mx7 = abs(X7);
f7 = (0:nfft7/2-1)*Fs/nfft7;
subplot(5,1,3);
plot(t2,x7)

x4 = x + x2 + x3;
nfft4 = 1024;
X4 = fft(x4,nfft4);
X4 = X4(1:nfft4/2);
mx4 = abs(X4);
f4 = (0:nfft4/2-1)*Fs/nfft4;

x8 = x5 + x6 + x7;
nfft8 = 1024;
X8 = fft(x8,nfft8);
X8 = X8(1:nfft8/2);
mx8 = abs(X8);
f8 = (0:nfft8/2-1)*Fs/nfft8;
subplot(5,1,4);
plot(t2,x8)

subplot(5,1,5);
plot(f4,mx4)

fil = (f4 > 90 & f4 < 110);
mx4temp = mx4;
mx4temp(not(fil)) = 0;
figure(2);
subplot(3,1,1);
plot(f4,mx4temp)

fil2 = (f4 > 190 & f4 < 210);
mx4temp2 = mx4;
mx4temp2(not(fil2)) = 0;
subplot(3,1,2);
plot(f4,mx4temp2)

fil3 = (f4 > 290 & f4 < 310);
mx4temp3 = mx4;
mx4temp3(not(fil3)) = 0;
subplot(3,1,3);
plot(f4,mx4temp3)

%---Sinc Filter Examples---%

n = 0:1:50;
sf = (sin(pi*0.1.*n))./(pi*0.1.*n);

figure(3)
subplot(4,1,1);
plot(n,sf)

sf1 = 2 * 0.25 * sinc(2 * 0.25 * (n - ((51 - 1) / 2)));
 
wn1 = 0.42 - (0.5 * cos((2 * pi * n)/(51 - 1))) + (0.08 * cos((4 * pi * n)/(51 - 1)));

ws1 = sf1 .* wn1;

subplot(4,1,2);
plot(n,ws1)

nfft9 = 1024;
X9 = fft(ws1,nfft9);
X9 = X9(1:nfft9/2);
mx9 = abs(X9);
f9 = (0:nfft9/2-1)*Fs/nfft9;

subplot(4,1,3);
plot(f9,mx9)

filsig = mx9.*mx4;
subplot(4,1,4);
plot(f4,filsig)

%---Filter attempt 1---%

%i = 1;

%while i <= 512
 %   if rectangularPulse(95,115,i) == 0    
 %       mx4(i) = rectangularPulse(95,115,i);
 %   end
 %   i = i + 1;
%end
%subplot(5,1,5);
%plot(f4,mx4)

%if (mx4
%    mx4 = 0;
%end

%figure(2);
%plot(f4,mx4)

%---Working solutions---%

%xfft = Fs.*(0:nfft4/2-1)/nfft4;

%cut_off = 650/Fs/2;
%order = 32;

%h = fir1(order,cut_off);

%fh = fft(h,nfft4);
%fh = fh(1:nfft4/2);

%mul = fh.*X4;

%figure(2);
%subplot(4,1,1);
%plot(xfft,abs(X4/max(X4)));
%subplot(4,1,2);
%plot(xfft,abs(fh/max(fh)));
%subplot(4,1,3);
%plot(abs(mul/max(mul)));

%con = conv(x4,h);

%subplot(4,1,4);
%plot(con);