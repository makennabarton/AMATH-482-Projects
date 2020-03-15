%% Case 1
load('cam1_1.mat')
load('cam1_2.mat')
load('cam1_3.mat')
implay(vidFrames1_1)
% Loop to show each frame of the video
numFrames = size(vidFrames1_1,4);
% Found visually
peak_frame = 50;
% numFrames columns starting at peak, 6 rows for the x and y position at each
% camera angle
matrix1 = zeros(6,numFrames - peak_frame);
for j = 1:numFrames - peak_frame
    X = vidFrames1_1(:,:,:,j + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam1_1x,cam1_1y] = ginput(1)
    matrix1(1,j) = cam1_1x;
    matrix1(2,j) = cam1_1y;
end
save('matrix1.mat','matrix1')
%%
numFrames = size(vidFrames2_1,4);
peak_frame = 100;
matrix1_2 = zeros(2,numFrames - peak_frame);
for j = 1:numFrames - peak_frame
    X = vidFrames2_1(:,:,:,j + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam2_1x,cam2_1y] = ginput(1)
    matrix1_2(1,j) = cam2_1x;
    matrix1_2(2,j) = cam2_1y;
end
save('matrix1_2.mat','matrix1_2')
%%
numFrames = size(vidFrames3_1,4);
peak_frame = 50;
matrix1_3 = zeros(2,numFrames - peak_frame);
for j = 1:numFrames - peak_frame
    X = vidFrames3_1(:,:,:,j + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam3_1x,cam3_1y] = ginput(1)
    matrix1_3(1,j) = cam3_1x;
    matrix1_3(2,j) = cam3_1y;
end
save('matrix1_3.mat','matrix1_3')


%% Case 2 - every other frame to reduce impact from noise
load('cam1_2.mat')
load('cam2_2.mat')
load('cam3_2.mat')
implay(vidFrames1_2)
% Loop to show each frame of the video
numFrames = size(vidFrames1_2,4);
% Found visually
peak_frame = 74;
% numFrames columns starting at peak
matrix2_1 = zeros(4,numFrames - peak_frame);
for j = 1:numFrames - peak_frame
    X = vidFrames1_2(:,:,:,j*2 + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam1_2x,cam1_2y] = ginput(2)
    matrix2_1(1:2,j) = cam1_2x;
    matrix2_1(3:4,j) = cam1_2y;
end
save('matrix2_1.mat','matrix2_1')
%%
numFrames = size(vidFrames2_2,4);
peak_frame = 100;
matrix2_2 = zeros(4,numFrames - peak_frame);
for j = 1:numFrames - peak_frame
    X = vidFrames2_2(:,:,:,j*2 + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam2_2x,cam2_2y] = ginput(2)
    matrix2_2(1:2,j) = cam2_2x;
    matrix2_2(3:4,j) = cam2_2y;
end
save('matrix2_2.mat','matrix2_2')
%%
numFrames = size(vidFrames3_2,4);
peak_frame = 79;
matrix2_3 = zeros(4,(numFrames - peak_frame)/2);
for j = 1:numFrames - peak_frame
    X = vidFrames3_2(:,:,:,j*2 + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam2_3x,cam2_3y] = ginput(2)
    matrix2_3(1:2,j) = cam2_3x;
    matrix2_3(3:4,j) = cam2_3y;
end
save('matrix2_3.mat','matrix2_3')


%% Case 3
load('cam1_3.mat')
load('cam2_3.mat')
load('cam3_3.mat')
implay(vidFrames1_3)
% Loop to show each frame of the video
numFrames = size(vidFrames1_3,4);
% Found visually
peak_frame = 80;
% numFrames columns starting at peak
matrix3_1 = zeros(2,numFrames - peak_frame);
for j = 1:numFrames - peak_frame
    X = vidFrames1_3(:,:,:,j + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam1_3x,cam1_3y] = ginput(1)
    matrix3_1(1,j) = cam1_3x;
    matrix3_1(2,j) = cam1_3y;
end
save('matrix3_1.mat','matrix3_1')
%%
numFrames = size(vidFrames2_3,4);
peak_frame = 66;
matrix3_2 = zeros(2,numFrames - peak_frame);
for j = 1:numFrames - peak_frame
    X = vidFrames2_3(:,:,:,j + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam3_2x,cam3_2y] = ginput(1)
    matrix3_2(1,j) = cam3_2x;
    matrix3_2(2,j) = cam3_2y;
end
save('matrix3_2.mat','matrix3_2')
%%
numFrames = size(vidFrames3_3,4);
peak_frame = 70;
matrix3_3 = zeros(2,numFrames - peak_frame);
for j = 1:numFrames - peak_frame
    X = vidFrames3_3(:,:,:,j + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam3_3x,cam3_3y] = ginput(1)
    matrix3_3(1,j) = cam3_3x;
    matrix3_3(2,j) = cam3_3y;
end
save('matrix3_3.mat','matrix3_3')


%% Case 4
load('cam1_4.mat')
load('cam2_4.mat')
load('cam3_4.mat')
implay(vidFrames1_4)
% Loop to show each frame of the video
numFrames = size(vidFrames1_4,4);
% Found visually
peak_frame = 93;
% numFrames columns starting at peak
matrix4_1 = zeros(2,numFrames - peak_frame);
for j = 1:numFrames - peak_frame
    X = vidFrames1_4(:,:,:,j + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam1_4x,cam1_4y] = ginput(1)
    matrix4_1(1,j) = cam1_4x;
    matrix4_1(2,j) = cam1_4y;
end
save('matrix4_1.mat','matrix4_1')
%%
numFrames = size(vidFrames2_4,4);
% Found visually
peak_frame = 99;
% numFrames columns starting at peak
matrix4_2 = zeros(2,numFrames - peak_frame);

for j = 1:numFrames - peak_frame
    X = vidFrames2_4(:,:,:,j + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam2_4x,cam2_4y] = ginput(1)
    matrix4_2(1,j) = cam2_4x;
    matrix4_2(2,j) = cam2_4y;
end
save('matrix4_2.mat','matrix4_2')
%%
numFrames = size(vidFrames3_4,4);
% Found visually
peak_frame = 91;
% numFrames columns starting at peak
matrix4_3 = zeros(2,numFrames - peak_frame);

for j = 1:numFrames - peak_frame
    X = vidFrames3_4(:,:,:,j + peak_frame - 1);
    imshow(X); 
    drawnow
    [cam3_4x,cam3_4y] = ginput(1)
    matrix4_3(1,j) = cam3_4x;
    matrix4_3(2,j) = cam3_4y;
end
save('matrix4_3.mat','matrix4_3')



%% Case 1 - combine/organize data
matrix1(3:4,:) = matrix1_2(:,1:end-8);
matrix1(5:6,:) = matrix1_3(:,1:end-6);

matrix1(1,:) = matrix1(1,:)/mean(matrix1(1,:));
matrix1(2,:) = matrix1(2,:)/mean(matrix1(2,:));
matrix1(3,:) = matrix1(3,:)/mean(matrix1(3,:));
matrix1(4,:) = matrix1(4,:)/mean(matrix1(4,:));
matrix1(5,:) = matrix1(5,:)/mean(matrix1(5,:));
matrix1(6,:) = matrix1(6,:)/mean(matrix1(6,:));
%% Case 2 - combine/organize data
matrix2_1 = matrix2_1(:,1:120);
matrix2_2 = matrix2_2(:,1:128);
matrix2_1 = [matrix2_1(1,:)-matrix2_1(2,:);
             matrix2_1(3,:)-matrix2_1(4,:)];
matrix2_2 = [matrix2_2(1,:)-matrix2_2(2,:);
             matrix2_2(3,:)-matrix2_2(4,:)];
matrix2_3 = [matrix2_3(1,:)-matrix2_3(2,:);
             matrix2_3(3,:)-matrix2_3(4,:)];
         

%%
matrix2 = [matrix2_1(:,1:120);
    matrix2_2(:,1:120);
    matrix2_3(:,1:120)];
matrix2(1,:) = matrix2(1,:)/mean(matrix2(1,:));
matrix2(2,:) = matrix2(2,:)/mean(matrix2(2,:));
matrix2(3,:) = matrix2(3,:)/mean(matrix2(3,:));
matrix2(4,:) = matrix2(4,:)/mean(matrix2(4,:));
matrix2(5,:) = matrix2(5,:)/mean(matrix2(5,:));
matrix2(6,:) = matrix2(6,:)/mean(matrix2(6,:));
%% Case 3 - combine/organize data
matrix3 = [matrix3_1(:,1:159);
    matrix3_2(:,1:159);
    matrix3_3(:,1:159)];
matrix3(1,:) = matrix3(1,:)/mean(matrix3(1,:));
matrix3(2,:) = matrix3(2,:)/mean(matrix3(2,:));
matrix3(3,:) = matrix3(3,:)/mean(matrix3(3,:));
matrix3(4,:) = matrix3(4,:)/mean(matrix3(4,:));
matrix3(5,:) = matrix3(5,:)/mean(matrix3(5,:));
matrix3(6,:) = matrix3(6,:)/mean(matrix3(6,:));
%% Case 4 - combine/organize data
matrix4 = [matrix4_1(:,1:299);
    matrix4_2(:,1:299);
    matrix4_3(:,1:299)];
matrix4(1,:) = matrix4(1,:)/mean(matrix4(1,:));
matrix4(2,:) = matrix4(2,:)/mean(matrix4(2,:));
matrix4(3,:) = matrix4(3,:)/mean(matrix4(3,:));
matrix4(4,:) = matrix4(4,:)/mean(matrix4(4,:));
matrix4(5,:) = matrix4(5,:)/mean(matrix4(5,:));
matrix4(6,:) = matrix4(6,:)/mean(matrix4(6,:));
%% PCA
[U1,S1,V1] = svd(matrix1,'econ');
[U2,S2,V2] = svd(matrix2,'econ');
[U3,S3,V3] = svd(matrix3,'econ');
[U4,S4,V4] = svd(matrix4,'econ');

sig1 = diag(S1);
sig2 = diag(S2);
sig3 = diag(S3);
sig4 = diag(S4);

energy_case1_1 = sig1(1)^2/sum(sig1.^2);
energy_case1_2 = (sig1(1)^2+sig1(2))/sum(sig1.^2);
energy_case1_3 = (sig1(1)^2+sig1(2)+sig1(3))/sum(sig1.^2);
energy_case1_4 = (sig1(1)^2+sig1(2)+sig1(3)+sig1(4))/sum(sig1.^2);
energy_case1_5 = (sig1(1)^2+sig1(2)+sig1(3)+sig1(4)+sig1(5))/sum(sig1.^2);
energy_case1_6 = (sig1(1)^2+sig1(2)+sig1(3)+sig1(4)+sig1(5)+sig1(6))/sum(sig1.^2);

energy_case2_1 = sig2(1)^2/sum(sig2.^2);
energy_case2_2 = (sig2(1)^2+sig2(2))/sum(sig2.^2);
energy_case2_3 = (sig2(1)^2+sig2(2)+sig2(3))/sum(sig2.^2);
energy_case2_4 = (sig2(1)^2+sig2(2)+sig2(3)+sig2(4))/sum(sig2.^2);
energy_case2_5 = (sig2(1)^2+sig2(2)+sig2(3)+sig2(4)+sig2(5))/sum(sig2.^2);
energy_case2_6 = (sig2(1)^2+sig2(2)+sig2(3)+sig2(4)+sig2(5)+sig2(6))/sum(sig2.^2);

energy_case3_1 = sig3(1)^2/sum(sig3.^2);
energy_case3_2 = (sig3(1)^2+sig3(2))/sum(sig3.^2);
energy_case3_3 = (sig3(1)^2+sig3(2)+sig3(3))/sum(sig3.^2);
energy_case3_4 = (sig3(1)^2+sig3(2)+sig3(3)+sig3(4))/sum(sig3.^2);
energy_case3_5 = (sig3(1)^2+sig3(2)+sig3(3)+sig3(4)+sig3(5))/sum(sig3.^2);
energy_case3_6 = (sig3(1)^2+sig3(2)+sig3(3)+sig3(4)+sig3(5)+sig3(6))/sum(sig3.^2);

energy_case4_1 = sig4(1)^2/sum(sig4.^2);
energy_case4_2 = (sig4(1)^2+sig4(2))/sum(sig4.^2);
energy_case4_3 = (sig4(1)^2+sig4(2)+sig4(3))/sum(sig4.^2);
energy_case4_4 = (sig4(1)^2+sig4(2)+sig4(3)+sig4(4))/sum(sig4.^2);
energy_case4_5 = (sig4(1)^2+sig4(2)+sig4(3)+sig4(4)+sig4(5))/sum(sig4.^2);
energy_case4_6 = (sig4(1)^2+sig4(2)+sig4(3)+sig4(4)+sig4(5)+sig4(6))/sum(sig4.^2);



matrix1_rank1 = S1(1,1) * U1(:,1) * V1(:,1)';
figure(1)
plot(matrix1_rank1(1,:),matrix1_rank1(2,:),'r.');

matrix2_rank1 = S2(1,1) * U2(:,1) * V2(:,1)';
figure(2)
plot(matrix2_rank1(1,:),matrix2_rank1(2,:),'r.');

matrix3_rank1 = S3(1,1) * U3(:,1) * V3(:,1)';
figure(3)
plot(matrix3_rank1(1,:),matrix3_rank1(2,:),'r.');

matrix4_rank1 = S4(1,1) * U4(:,1) * V4(:,1)';
figure(4)
plot(matrix4_rank1(1,:),matrix4_rank1(2,:),'r.');

%%
figure(5)
subplot(2,2,1)
plot(1,1-energy_case1_1,'ko',2,1-energy_case1_2,'ko',3,1-energy_case1_3,'ko',4,1-energy_case1_4,'ko',5,1-energy_case1_5,'ko',6,1-energy_case1_6,'ko')
title('Case 1 Energies')
xlabel('Dimension (n)')
ylabel('1 - Energy at Dimension (n)')

subplot(2,2,2)
plot(1,1-energy_case2_1,'ko',2,1-energy_case2_2,'ko',3,1-energy_case2_3,'ko',4,1-energy_case2_4,'ko',5,1-energy_case2_5,'ko',6,1-energy_case2_6,'ko')
title('Case 2 Energies')
xlabel('Dimension (n)')
ylabel('1 - Energy at Dimension (n)')

subplot(2,2,3)
plot(1,1-energy_case3_1,'ko',2,1-energy_case3_2,'ko',3,1-energy_case3_3,'ko',4,1-energy_case3_4,'ko',5,1-energy_case3_5,'ko',6,1-energy_case3_6,'ko')
title('Case 3 Energies')
xlabel('Dimension (n)')
ylabel('1 - Energy at Dimension (n)')
ylabel('1 - Energy at Dimension (n)')

subplot(2,2,4)
plot(1,1-energy_case4_1,'ko',2,1-energy_case4_2,'ko',3,1-energy_case4_3,'ko',4,1-energy_case4_4,'ko',5,1-energy_case4_5,'ko',6,1-energy_case4_6,'ko')
title('Case 4 Energies')
xlabel('Dimension (n)')
ylabel('1 - Energy at Dimension (n)')
print(gcf,'energies.png','-dpng')