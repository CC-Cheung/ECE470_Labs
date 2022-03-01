function X_workspace = mysegment()
       Theta = linspace(0,2*pi,100);
       X = 600 + 100*sin(Theta)
       Y = 100*cos(Theta)
       Z = linspace(-10,-10,100);
       
       data=xlsread('jug.xlsx')
       xdata=550 + 10*data(:,1)
       ydata=10*data(:,2)
       zdata=ones(length(data),1)-11
       
    X_workspace =[xdata ydata zdata]
end
    
    
    
    
    
    


