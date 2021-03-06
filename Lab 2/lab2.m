% close all
% 
% %Make myrobot
dh =[0 400 25 pi/2 ;
     0 0 315 0 ;
     0 0 35 pi/2 ;
     0 365 0 -pi/2 ;
     0 0 0 pi/2 ;
     0 161.44 -296.23 0 ];
% 
% %3.3 prelab
% kuka = mykuka(dh);
% H=forward_kuka([pi/5 pi/3 -pi/4 pi/4 pi/3 pi/4]', kuka)
% inverse_kuka(H, kuka
% setHome(0.04);

%Callibration points
X1=[468.71 -51.34 79.73];
X2=[535.74 132.14 79.89];
X3=[661.38 -13.80 79.84];

%Callibration Qs
Q1=[-0.1318    1.0022   -0.7501   -0.1361    1.3170    0.0346];
Q2=[0.2255    0.8758   -0.5212   -0.1361    1.2711    0.0346];
Q3=[0.0058    0.6831   -0.0881    0.0014    0.9989   -0.0333];
delta=fminunc(@deltajoint,[0 0]);
myrobot=mykuka_search(delta);

%Using X3 to go back to callibration point
H=[0 0 1 661.38;0 -1 0 -13.80;1 0 0 79.84; 0 0 0 1];
q=inverse_kuka(H, myrobot);

p_workspace=[600; 100;-10];
p_baseframe=FrameTransformation(p_workspace);
%Orientation of pen
R=[0 0 1; 0 -1 0; 1 0 0]
H=[R p_baseframe; zeros(1,3) 1]
q=inverse_kuka(H, myrobot)

%Get path
X_workspace = mysegment()'
%run
for i = 1:100
    cordinates = X_workspace(:,i)
    cordinate_baseframe = FrameTransformation(cordinates);
    H=[R cordinate_baseframe; zeros(1,3) 1]
    q=inverse_kuka(H, myrobot)
    setAngles(q,0.04)
    
end
