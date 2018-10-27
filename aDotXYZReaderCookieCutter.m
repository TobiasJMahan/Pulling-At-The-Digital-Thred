clc
clear

% - Read content.
 fid     = fopen('MFCRaw1.xyz', 'r' ) ;
 content = fscanf( fid, '%f', Inf ) ;
 fclose( fid ) ;
%  % - Extact headers and data.
 colHeader = content(1:6).' ;
 content   = reshape( content(7:end), 6, [] ).' ;
 X=content(:,1);
 Y=content(:,3);
 Z=content(:,2);
 n=length(X);
 
a=0;
b=0;
c=0;
d=0;
n=length(X);
maxZ=101.6;
angc=4;
rotAngle1=deg2rad(0-angc);
rotAngle2=deg2rad(60-angc);
rotAngle3=deg2rad(0-angc);
rotAngle4=deg2rad(30-angc);
% factor_datascrub=0;
factor_datascrub=maxZ/80;
% Sorting collection of points into 4 vertical cubes, rotating those cubes
% by a correction factor so their faces line up correctly. 

for i=1:n
     if Z(i)<maxZ/4 - factor_datascrub
         a=a+1;
         X_box_bottom(a)=X(i);
         Y_box_bottom(a)=Y(i);
         Z_box_bottom(a)=Z(i);
         xRot(a) = X_box_bottom(a)*cos(rotAngle1) - Y_box_bottom(a)*sin(rotAngle1);
         yRot(a) = X_box_bottom(a)*sin(rotAngle1) + Y_box_bottom(a)*cos(rotAngle1);
     elseif Z(i)>=maxZ/4  && Z(i)<maxZ/2  -factor_datascrub
         b=b+1;
         X_box_second(b)=X(i);
         Y_box_second(b)=Y(i);
         Z_box_second(b)=Z(i);
         xRot2(b) = X_box_second(b)*cos(rotAngle2) - Y_box_second(b)*sin(rotAngle2);
         yRot2(b) = X_box_second(b)*sin(rotAngle2) + Y_box_second(b)*cos(rotAngle2);
     elseif Z(i)>=maxZ/2 && Z(i)<maxZ*(3/4) -factor_datascrub
         c=c+1;
         X_box_third(c)=X(i);
         Y_box_third(c)=Y(i);
         Z_box_third(c)=Z(i);
         xRot3(c) = X_box_third(c)*cos(rotAngle3) - Y_box_third(c)*sin(rotAngle3);
         yRot3(c) = X_box_third(c)*sin(rotAngle3) + Y_box_third(c)*cos(rotAngle3);
     elseif Z(i)>=maxZ*(3/4)
         d=d+1;
         X_box_top(d)=X(i);
         Y_box_top(d)=Y(i);
         xRot4(d) = X_box_top(d)*cos(rotAngle4) - Y_box_top(d)*sin(rotAngle4);
         yRot4(d) = X_box_top(d)*sin(rotAngle4) + Y_box_top(d)*cos(rotAngle4);
         Z_box_top(d)=Z(i);
     end
end
 
xRot=xRot.';
yRot=yRot.';
zRot=Z_box_bottom.';
bottombox=[xRot,yRot,zRot];

% plot(xRot,yRot,'b.')
% daspect([1 1 1])

a=1;
b=1;
c=1;
d=1;

for i=1:length(xRot)
    if xRot(i)>-5 && xRot(i)<5 && yRot(i)<0 && zRot(i)>5 && zRot(i)<15
        square1face1x(a)=xRot(i);
        square1face1y(a)=yRot(i);
        square1face1z(a)=zRot(i);
        a=a+1;
    elseif xRot(i)>-5 && xRot(i)<5 && yRot(i)>0 && zRot(i)>5 && zRot(i)<15
        square1face2x(b)=xRot(i);
        square1face2y(b)=yRot(i);
        square1face2z(b)=zRot(i);
        b=b+1;
    elseif yRot(i)>-5 && yRot(i)<5 && xRot(i)>0 && zRot(i)>5 && zRot(i)<15
        square1face3x(c)=xRot(i);
        square1face3y(c)=yRot(i);
        square1face3z(c)=zRot(i);
        c=c+1;
    elseif yRot(i)>-5 && yRot(i)<5 && xRot(i)<0 && zRot(i)>5 && zRot(i)<15
        square1face4x(d)=xRot(i);
        square1face4y(d)=yRot(i);
        square1face4z(d)=zRot(i);
        d=d+1;
    end
end
% figure('Name','Bottom Cube')
% plot3(square1face1x,square1face1y,square1face1z,'b.',square1face2x,square1face2y,square1face2z,'g.',square1face3x,square1face3y,square1face3z,'k.',square1face4x,square1face4y,square1face4z,'r.')
% daspect([1 1 1])

xRot2=xRot2.';
yRot2=yRot2.';
zRot2=Z_box_second.';
% secondbox=[xRot,yRot,zRot];

a=1;
b=1;
c=1;
d=1;

for i=1:length(xRot2)
    if xRot2(i)>-5 && xRot2(i)<5 && yRot2(i)<0 && zRot2(i)>30 && zRot2(i)<40
        square2face1x(a)=xRot2(i);
        square2face1y(a)=yRot2(i);
        square2face1z(a)=zRot2(i);
        a=a+1;
    elseif xRot2(i)>-5 && xRot2(i)<5 && yRot2(i)>0 && zRot2(i)>30 && zRot2(i)<40
        square2face2x(b)=xRot2(i);
        square2face2y(b)=yRot2(i);
        square2face2z(b)=zRot2(i);
        b=b+1;
    elseif yRot2(i)>-5 && yRot2(i)<5 && xRot2(i)>0 && zRot2(i)>30 && zRot2(i)<40
        square2face3x(c)=xRot2(i);
        square2face3y(c)=yRot2(i);
        square2face3z(c)=zRot2(i);
        c=c+1;
    elseif yRot2(i)>-5 && yRot2(i)<5 && xRot2(i)<0 && zRot2(i)>30 && zRot2(i)<40
        square2face4x(d)=xRot2(i);
        square2face4y(d)=yRot2(i);
        square2face4z(d)=zRot2(i);
        d=d+1;
    end
end

% figure('Name','Second Cube')
% plot3(square2face1x,square2face1y,square2face1z,'b.',square2face2x,square2face2y,square2face2z,'g.',square2face3x,square2face3y,square2face3z,'k.',square2face4x,square2face4y,square2face4z,'r.')
% daspect([1 1 1])

xRot3=xRot3.';
yRot3=yRot3.';
zRot3=Z_box_third.';
thirdbox=[xRot3,yRot3,zRot3];

a=1;
b=1;
c=1;
d=1;
 
for i=1:length(xRot3)
    if xRot3(i)>-5 && xRot3(i)<5 && yRot3(i)<0 && zRot3(i)>56 && zRot3(i)<66
        square3face1x(a)=xRot3(i);
        square3face1y(a)=yRot3(i);
        square3face1z(a)=zRot3(i);
        a=a+1;
    elseif xRot3(i)>-5 && xRot3(i)<5 && yRot3(i)>0 && zRot3(i)>56 && zRot3(i)<66
        square3face2x(b)=xRot3(i);
        square3face2y(b)=yRot3(i);
        square3face2z(b)=zRot3(i);
        b=b+1;
    elseif yRot3(i)>-5 && yRot3(i)<5 && xRot3(i)>0 && zRot3(i)>56 && zRot3(i)<66
        square3face3x(c)=xRot3(i);
        square3face3y(c)=yRot3(i);
        square3face3z(c)=zRot3(i);
        c=c+1;
    elseif yRot3(i)>-5 && yRot3(i)<5 && xRot3(i)<0 && zRot3(i)>56 && zRot3(i)<66
        square3face4x(d)=xRot3(i);
        square3face4y(d)=yRot3(i);
        square3face4z(d)=zRot3(i);
        d=d+1;
    end
end
 
figure('Name','Third Cube')
plot3(square3face1x,square3face1y,square3face1z,'b.',square3face2x,square3face2y,square3face2z,'g.',square3face3x,square3face3y,square3face3z,'k.',square3face4x,square3face4y,square3face4z,'r.')
daspect([1 1 1])

xRot4=xRot4.';
yRot4=yRot4.';
zRot4=Z_box_top.';
topbox=[xRot4,yRot4,zRot4];

a=1;
b=1;
c=1;
d=1;
 
for i=1:length(xRot4)
    if xRot4(i)>-5 && xRot4(i)<5 && yRot4(i)<0 && zRot4(i)>82 && zRot4(i)<92
        square4face1x(a)=xRot4(i);
        square4face1y(a)=yRot4(i);
        square4face1z(a)=zRot4(i);
        a=a+1;
    elseif xRot4(i)>-5 && xRot4(i)<5 && yRot4(i)>0 && zRot4(i)>82 && zRot4(i)<92
        square4face2x(b)=xRot4(i);
        square4face2y(b)=yRot4(i);
        square4face2z(b)=zRot4(i);
        b=b+1;
    elseif yRot4(i)>-5 && yRot4(i)<5 && xRot4(i)>0 && zRot4(i)>82 && zRot4(i)<92
        square4face3x(c)=xRot4(i);
        square4face3y(c)=yRot4(i);
        square4face3z(c)=zRot4(i);
        c=c+1;
    elseif yRot4(i)>-5 && yRot4(i)<5 && xRot4(i)<0 && zRot4(i)>82 && zRot4(i)<92
        square4face4x(d)=xRot4(i);
        square4face4y(d)=yRot4(i);
        square4face4z(d)=zRot4(i);
        d=d+1;
    end
end
 
% figure('Name','Fourth Cube Edit 2')
% plot3(square4face1x,square4face1y,square4face1z,'b.',square4face2x,square4face2y,square4face2z,'g.',square4face3x,square4face3y,square4face3z,'k.',square4face4x,square4face4y,square4face4z,'r.')
% daspect([1 1 1])

ave_x_s1f1=mean(square1face1x);
std_x_s1f1=std(square1face1x);
median_x_s1f1=median(square1face1x);

ave_y_s1f1=mean(square1face1y);
std_y_s1f1=std(square1face1y);
median_y_s1f1=median(square1face1y);

ave_x_s1f2=mean(square1face2x);
std_x_s1f2=std(square1face2x);
median_x_s1f2=median(square1face2x);
 
ave_y_s1f2=mean(square1face2y);
std_y_s1f2=std(square1face2y);
median_y_s1f2=median(square1face2y);

ave_x_s1f3=mean(square1face3x);
std_x_s1f3=std(square1face3x);
median_x_s1f3=median(square1face3x);
 
ave_y_s1f3=mean(square1face3y);
std_y_s1f3=std(square1face3y);
median_y_s1f3=median(square1face3y);

ave_x_s1f4=mean(square1face4x);
std_x_s1f4=std(square1face4x);
median_x_s1f4=median(square1face4x);
 
ave_y_s1f4=mean(square1face4y);
std_y_s1f4=std(square1face4y);
median_y_s1f4=median(square1face4y);

ave_x_s2f1=mean(square2face1x);
std_x_s2f1=std(square2face1x);
median_x_s2f1=median(square2face1x);
 
ave_y_s2f1=mean(square2face1y);
std_y_s2f1=std(square2face1y);
median_y_s2f1=median(square2face1y);
 
ave_x_s2f2=mean(square2face2x);
std_x_s2f2=std(square2face2x);
median_x_s2f2=median(square2face2x);
 
ave_y_s2f2=mean(square2face2y);
std_y_s2f2=std(square2face2y);
median_y_s2f2=median(square2face2y);
 
ave_x_s2f3=mean(square2face3x);
std_x_s2f3=std(square2face3x);
median_x_s2f3=median(square2face3x);
 
ave_y_s2f3=mean(square2face3y);
std_y_s2f3=std(square2face3y);
median_y_s2f3=median(square2face3y);
 
ave_x_s2f4=mean(square2face4x);
std_x_s2f4=std(square2face4x);
median_x_s2f4=median(square2face4x);
 
ave_y_s2f4=mean(square2face4y);
std_y_s2f4=std(square2face4y);
median_y_s2f4=median(square2face4y);

ave_x_s3f1=mean(square3face1x);
std_x_s3f1=std(square3face1x);
median_x_s3f1=median(square3face1x);
 
ave_y_s3f1=mean(square3face1y);
std_y_s3f1=std(square3face1y);
median_y_s3f1=median(square3face1y);
 
ave_x_s3f2=mean(square3face2x);
std_x_s3f2=std(square3face2x);
median_x_s3f2=median(square3face2x);
 
ave_y_s3f2=mean(square3face2y);
std_y_s3f2=std(square3face2y);
median_y_s3f2=median(square3face2y);
 
ave_x_s3f3=mean(square3face3x);
std_x_s3f3=std(square3face3x);
median_x_s3f3=median(square3face3x);
 
ave_y_s3f3=mean(square3face3y);
std_y_s3f3=std(square3face3y);
median_y_s3f3=median(square3face3y);
 
ave_x_s3f4=mean(square3face4x);
std_x_s3f4=std(square3face4x);
median_x_s3f4=median(square3face4x);
 
ave_y_s3f4=mean(square3face4y);
std_y_s3f4=std(square3face4y);
median_y_s3f4=median(square3face4y);

% ave_x_s4f1=mean(square4face1x);
% std_x_s4f1=std(square4face1x);
std_x_s4f1=0;
% median_x_s4f1=median(square4face1x);
 
% ave_y_s4f1=mean(square4face1y);
% std_y_s4f1=std(square4face1y);
std_y_s4f1=0;
% median_y_s4f1=median(square4face1y);
 
% ave_x_s4f2=mean(square4face2x);
% std_x_s4f2=std(square4face2x);
std_x_s4f2=0;
% median_x_s4f2=median(square4face2x);
 
% ave_y_s4f2=mean(square4face2y);
% std_y_s4f2=std(square4face2y);
std_y_s4f2=0;
% median_y_s4f2=median(square4face2y);
 
% ave_x_s4f3=mean(square4face3x);
% std_x_s4f3=std(square4face3x);
std_x_s4f3=0;
% median_x_s4f3=median(square4face3x);
 
% ave_y_s4f3=mean(square4face3y);
% std_y_s4f3=std(square4face3y);
std_y_s4f3=0;
% median_y_s4f3=median(square4face3y);
 
% ave_x_s4f4=mean(square4face4x);
% std_x_s4f4=std(square4face4x);
std_x_s4f4=0;
% median_x_s4f4=median(square4face4x);
 
% ave_y_s4f4=mean(square4face4y);
% std_y_s4f4=std(square4face4y);
std_y_s4f4=0;
% median_y_s4f4=median(square4face4y);
% 
width_s1=ave_x_s1f3-ave_x_s1f4;
width_s2=ave_x_s2f3-ave_x_s2f4;
width_s3=ave_x_s3f3-ave_x_s3f4;
% width_s4=ave_x_s4f3-ave_x_s4f4;
width_s4=0;
% 
length_s1=ave_y_s1f2-ave_y_s1f1;
length_s2=ave_y_s2f2-ave_y_s2f1;
length_s3=ave_y_s3f2-ave_y_s3f1;
% length_s4=ave_y_s4f2-ave_y_s4f1;
length_s4=0;

data_dimensional=[width_s1,width_s2,width_s3,width_s4;length_s1,length_s2,length_s3,length_s4];
T_dimensional=table(data_dimensional);
writetable(T_dimensional,'MFCRaw1AutoCleanPointCloudWidthLength')


data_geometrical=[std_y_s1f1,std_y_s1f2,std_x_s1f3,std_x_s1f4; std_y_s2f1,std_y_s2f2,std_x_s2f3,std_x_s2f4; std_y_s3f1,std_y_s3f2,std_x_s3f3,std_x_s3f4; std_y_s4f1,std_y_s4f2,std_x_s4f3,std_x_s4f4];
T_geometrical=table(data_geometrical);
writetable(T_geometrical,'MFCRaw1AutoCleanPointCloudStandardDeviation')

figure
plot3(square1face1x,square1face1y,square1face1z,'b.',square1face2x,square1face2y,square1face2z,'g.',square1face3x,square1face3y,square1face3z,'y.',square1face4x,square1face4y,square1face4z,'r.',square2face1x,square2face1y,square2face1z,'b.',square2face2x,square2face2y,square2face2z,'g.',square2face3x,square2face3y,square2face3z,'y.',square2face4x,square2face4y,square2face4z,'r.',square3face1x,square3face1y,square3face1z,'b.',square3face2x,square3face2y,square3face2z,'g.',square3face3x,square3face3y,square3face3z,'y.',square3face4x,square3face4y,square3face4z,'r.');
daspect([1 1 1])
