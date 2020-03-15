%% Part 1
clear; clc; close all;

load handel
v = y';

% Plot of all the unfiltered music signals
subplot(1,3,1)
plot((1:length(v))/Fs,v);
xlabel('Time [sec]');
ylabel('Amplitude');
title('Handel Signal, v(n)');

subplot(1,3,2)
[S,Fs] = audioread('music1.wav');
S = S';
tr_piano=length(S)/Fs;  % record time in seconds
plot((1:length(S))/Fs,S);
xlabel('Time [sec]'); ylabel('Amplitude');
title('Mary had a little lamb (piano)');

subplot(1,3,3)
[S,Fs] = audioread('music2.wav');
tr_rec=length(S)/Fs;  % record time in seconds
plot((1:length(S))/Fs,S);
xlabel('Time [sec]'); ylabel('Amplitude');
title('Mary had a little lamb (recorder)');

%% Explore Handel
clear; clc; close all;
load handel
v = y';
S = v;
tr_handel=length(S)/Fs;
p8 = audioplayer(v,Fs);
playblocking(p8);

n = length(S);
L = tr_handel;
t = (1:length(S))/Fs ;
k = (1/L)*[0:(n-1)/2 -(n-1)/2:-1];

cwt(v,Fs)
print(gcf,'-dpng','cwt.png')

%% Spectrograms for varying a
a_vec = [20 10 5 1];
for jj = 1:length(a_vec)
    a = a_vec(jj);
    tslide=0:0.01:L;
    Sgt_spec = zeros(length(tslide),n);
    for j=1:length(tslide)
        g=exp(-a*(t-tslide(j)).^2);
        Sg=g.*S;
        Sgt=fft(Sg); 
        Sgt_spec(j,:) = fftshift(abs(Sgt));
    end
    subplot(2,2,jj)
    pcolor(tslide,fftshift(k),Sgt_spec.'),
    shading interp
    title(['a = ',num2str(a),'\Delta tau = .01'],'Fontsize',16)
    set(gca,'Ylim',[0 4000],'Fontsize',16)
    colormap(hot)
end

figure(2)
a_vec = [20 10 5 1];
for jj = 1:length(a_vec)
    a = a_vec(jj);
    tslide=0:.1:L;
    Sgt_spec = zeros(length(tslide),n);
    for j=1:length(tslide)
        g=exp(-a*(t-tslide(j)).^2);
        Sg=g.*S;
        Sgt=fft(Sg); 
        Sgt_spec(j,:) = fftshift(abs(Sgt));
    end
    subplot(2,2,jj)
    pcolor(tslide,fftshift(k),Sgt_spec.'),
    shading interp
    title(['a = ',num2str(a),'\Delta tau = .1'],'Fontsize',16)
    set(gca,'Ylim',[0 4000],'Fontsize',16)
    colormap(hot)
end
print(gcf,'-dpng','spectrogram_tau_1.png')

figure(3)
a_vec = [20 10 5 1];
for jj = 1:length(a_vec)
    a = a_vec(jj);
    tslide=0:1:L;
    Sgt_spec = zeros(length(tslide),n);
    for j=1:length(tslide)
        g=exp(-a*(t-tslide(j)).^2);
        Sg=g.*S;
        Sgt=fft(Sg); 
        Sgt_spec(j,:) = fftshift(abs(Sgt));
    end
    subplot(2,2,jj)
    pcolor(tslide,fftshift(k),Sgt_spec.'),
    shading interp
    title(['a = ',num2str(a),'\Delta tau = 1'],'Fontsize',16)
    set(gca,'Ylim',[0 4000],'Fontsize',16)
    colormap(hot)
end
print(gcf,'-dpng','spectrogram_tau1.png')

%% Part 2
clear; clc; close all;
[S,Fs] = audioread('music1.wav');
S = S';
tr_piano=length(S)/Fs;  % record time in seconds
plot((1:length(S))/Fs,S);
xlabel('Time [sec]'); ylabel('Amplitude');
title('Mary had a little lamb (piano)');
p8 = audioplayer(S,Fs); playblocking(p8);

St = fft(S);
n = length(S);
L = tr_piano;
t = (1:length(S))/Fs ;
k = (1/L)*[0:(n)/2-1 -n/2:-1];

% Plot of what the gabor filter looks like on the signal over time
tau = 1;
a = 10;
g = exp(-a*(t-tau).^2);
tau = 1.5;
a = 10;
g1 = exp(-a*(t-tau).^2);
tau = 2;
a = 10;
g2 = exp(-a*(t-tau).^2);
figure(2)
subplot(3,1,1)
plot(t,S,'k',t,g,'m',t,g1,'g',t,g2,'c','Linewidth',2) 
set(gca,'Fontsize',16), title('Gabor filter over "Mary had a little lamb (piano)"')
tau = 4;
a = 10;
g = exp(-a*(t-tau).^2);

subplot(3,1,2)
plot(t,S,'k',t,g,'m','Linewidth',2) 
set(gca,'Fontsize',16), ylabel('Signal Amplitude')
tau = 6;
a = 10;
g = exp(-a*(t-tau).^2);

subplot(3,1,3)
plot(t,S,'k',t,g,'m','Linewidth',2) 
set(gca,'Fontsize',16), xlabel('Time (t)')
print(gcf,'-dpng','gabor_filter.png')

% Calculate Gabor transform and plot spectrogram
a = 10;
tslide = 0:.1:L;
Sgt_spec = zeros(length(tslide),n);
frequencies = zeros(length(tslide),1);
for j = 1:length(tslide)
    g = exp(-a*(t-tslide(j)).^2);
    Sg = g.*S;
    Sgt = fft(Sg);
    Sgt_spec(j,:) = fftshift(abs(Sgt)); % We don't want to scale it
    frequencies(j) = min(abs(Sgt_spec(j,:)));
end

figure(3)
pcolor(tslide,fftshift(k),Sgt_spec.'),
shading interp 
set(gca,'Ylim',[240 340],'Fontsize',16) 
colormap(hot)
title('Mary had a little lamb (Piano) Spectrogram'),
xlabel('Time (s)'), ylabel('Frequency (Hz)')
print(gcf,'-dpng','piano_spectrogram.png')

% Recorder Analysis
clear; clc; close all;
figure(4)
[S,Fs] = audioread('music2.wav');
S = S';
tr_rec=length(S)/Fs;  % record time in seconds
plot((1:length(S))/Fs,S);
xlabel('Time [sec]'); ylabel('Amplitude');
title('Mary had a little lamb (recorder)');
p8 = audioplayer(S,Fs); playblocking(p8);

n = length(S);
L = tr_rec;
t = (1:length(S))/Fs ;
k = (1/L)*[0:(n)/2-1 -n/2:-1];

% Calculate Gabor transform and plot spectrogram
a = 10;
tslide = 0:.1:L;
Sgt_spec = zeros(length(tslide),n);
frequencies = zeros(length(tslide),1);
for j = 1:length(tslide)
    g = exp(-a*(t-tslide(j)).^2);
    Sg = g.*S;
    Sgt = fft(Sg);
    Sgt_spec(j,:) = fftshift(abs(Sgt)); % We don't want to scale it
    frequencies(j) = min(abs(Sgt_spec(j,:)));
end

figure(5)
pcolor(tslide,fftshift(k),Sgt_spec.'),
shading interp 
set(gca,'Ylim',[775 1025],'Fontsize',16) 
colormap(hot)
title('Mary had a little lamb (Recorder) Spectrogram'),
xlabel('Time (s)'), ylabel('Frequency (Hz)')
print(gcf,'-dpng','recorder_spectrogram.png')

