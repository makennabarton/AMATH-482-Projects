clear; close all; clc;
load Testdata

L=15; % spatial domain
n=64; % Fourier modes
x2=linspace(-L,L,n+1); x=x2(1:n); y=x; z=x;
k=(2*pi/(2*L))*[0:(n/2-1) -n/2:-1]; ks=fftshift(k);
[X,Y,Z]=meshgrid(x,y,z);
[Kx,Ky,Kz]=meshgrid(ks,ks,ks);
for j=1:20
    Un(:,:,:)=reshape(Undata(j,:),n,n,n);
end
isosurface(X,Y,Z,abs(Un),0.4)
axis([-20 20 -20 20 -20 20]), grid on, drawnow
set(gca,'Fontsize',14)
title('Ultrasound Data','Fontsize',16)
xlabel('X')
ylabel('Y')
zlabel('Z')

print(gcf,'-dpng','original_data.png')

%%
clear; close all; clc;
load Testdata

L = 15; % spatial domain
n = 64; % Fourier modes
x2 = linspace(-L,L,n+1); x = x2(1:n); y = x; z = x;
k = (2*pi/(2*L))*[0:(n/2-1) -n/2:-1]; ks = fftshift(k);

[X,Y,Z] = meshgrid(x,y,z);
[Kx,Ky,Kz] = meshgrid(k,k,k);

UnTAve = zeros(n,n,n);

% Average the transformed data
for j=1:20
    UnT = fftn(reshape(Undata(j,:),n,n,n));
    UnTAve = UnTAve + UnT;
end
UnTAve = abs(UnTAve)/j;

% Get the coodinates of the max frequency
[maxVals,indices1] = max(UnTAve(:));
[kx0,ky0,kz0] = ind2sub(size(UnTAve),indices1);
signatureFreq = [kx0 ky0 kz0]

% Filter the transformed data at each time step
tau = .2;
Kx0 = Kx(kx0,ky0,kz0);
Ky0 = Ky(kx0,ky0,kz0);
Kz0 = Kz(kx0,ky0,kz0);

filter =  exp(-tau.*((Kx-Kx0).^2 + (Ky-Ky0).^2 + (Kz-Kz0).^2));

for jj = 1:20
    UnT = fftn(reshape(Undata(jj,:),n,n,n));
    UnFT = UnT .* filter;
    UnF = ifftn(UnFT);
    [maxVals,indices] = max(abs(UnF(:)));
    [mx,my,mz] = ind2sub(size(UnF),indices);
    marbX(1,jj) = X(mx,my,mz);
    marbY(1,jj) = Y(mx,my,mz);
    marbZ(1,jj) = Z(mx,my,mz);
end
marb20 = [marbX(20) marbY(20) marbZ(20)];

plot3(marbX,marbY,marbZ,'k-','Linewidth',2)
set(gca,'Fontsize',14)
xlabel('X')
ylabel('Y')
zlabel('Z')
title('Path of the marble inside the dog over time','Fontsize',18)
grid on, hold on
plot3(marb20(1),marb20(2),marb20(3),'r.','Markersize',16)
print(gcf,'-dpng','marble_path.png')
