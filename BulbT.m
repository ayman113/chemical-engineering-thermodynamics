%%%%% made by : ayman adalla A19ET4021 %%%%%%%%
%%%%% 2020/2021/2 %%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% how to use : for example
% i=5; (number of iteration )
% A,B,C are Rault's law coefficients
% X=[0.5 0.5]; (molar fraction)
% gamma =[1.2 2.1]; 
% P=50; (pressure)
% T=50; (temprature)
%%% >> BulbT(i,A,B,C,X,gamma,P,T)
function BulbT(i,A,B,C,X,gamma,P,T)
for i=1:i
    Psat1(i)=exp(A(1)-(B(1)/(C(1)+T(i))));
    Psat2(i)=exp(A(2)-(B(2)/(C(2)+T(i))));
    alpha12(i)=Psat1(i)/Psat2(i);
    Psat1(i+1)=P/((X(1)*gamma(1))+((X(2)*gamma(2))/alpha12(i)));
    T(i+1)=(B(1)/(A(1)-log( Psat1(i+1))))-C(1);
end
Y1=(X(1)*gamma(1)*Psat1(end))/P;
Y2=1-Y1;
i=1:i;
t=[i' T(1:end-1)' Psat1(1:end-1)' Psat2(1:end)' alpha12' Psat1(2:end)' T(2:end)' ];
format short g
fprintf('y1 = %f\ny2 = %f\n',Y1,Y2);
fprintf('  i          Tin            Psat 1         Psat 2            alpha       Psat 1(alpha)         Tout\n')
fprintf('  %i %15f %15f %15f %15f %15f %15f\n',t.');
end