function q=deltajoint(delta)

    kuka=mykuka_search(delta);
   
%--- Calibration Foundings   ----------------------------------------%
    X1=[459.26 -40.92 79.82];
    X2=[538.83 -51.03 80.45];
    X3=[661.38 -13.80 79.84];

    Q1=[-0.0853    0.9671   -0.8501   -0.1042    1.5666   -0.0330];
    Q2=[-0.1833    0.8699   -0.5859   -0.3773    1.4265    0.0621];
    Q3=[0.0058    0.6831   -0.0881    0.0014    0.9989   -0.0333];
%-------------------------------------------------------------------%



%     H1=forward_kuka(kuka,Q1);
%     H2=forward_kuka(kuka,Q2);
%     H3=forward_kuka(kuka,Q3);

    H1=forward_kuka(Q1,kuka);
    H2=forward_kuka(Q2,kuka);
    H3=forward_kuka(Q3,kuka);

    q=norm(H1(1:3,4)-X1)+norm(H2(1:3,4)-X2)+norm(H3(1:3,4)-X3);
end