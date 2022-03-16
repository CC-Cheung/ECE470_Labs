function tau = att(q,q2,myrobot)

     H1 = [];
     H2 = [];
     
     
     
     for i = 1:length(q)
         
         H1 = cat(3,H1,forward(q(1:i),myrobot));
         H2 = cat(3,H2,forward(q2(1:i),myrobot));
         
         
     end
     
     
    tau =[0;0;0;0;0;0];
     
    for i = 1:length(q)
        
        J=[];
        
        Z = [0;0;1];
        temp = cross(Z,H1(1:3,4,i));
        J = [J temp];
        
        for j = 2:i
            
            

            Z = H1(1:3,3,j-1);
            temp = cross(Z,H1(1:3,4,i)-H1(1:3,4,j-1));
            J = [J temp];
            
            
        end
        
        
        for j = 1:6-i
        
            J =[J [0 ;0 ;0]];
        
        
        end
        
        J;
        
        F = -(H1(1:3,4,i)-H2(1:3,4,i));
        
        
        tau = tau +  J.' * F;
        
        
        
        
        
        
    end
 
    tau = tau/norm(tau);
end    
