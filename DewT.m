%%%%% made by : ayman adalla A19ET4021 %%%%%%%%
%%%%% 2020/2021/2 %%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% how to use : for example
% i=5; (number of iteration )
% A,B,C are Rault's law coefficients
% gamma =[1 1]; (initial values or guesse)
% P=50; (pressure)
% type='M' (for modified rault's law) or type ='R' (for raults law)
% gamma1eqn=@(x1,x2,T) exp((2.771-0.00523*T)*x2^2); (example for type 'M')
% or gamma1eqn=[];(for type 'R'), same with gamma2eqn
%%% >> DewT(i,A,B,C,Y,gamma,P,gamma1eqn,gamma2eqn,type)
function DewT(i,A,B,C,Y,gamma,P,gamma1eqn,gamma2eqn,type)
    Tsat1=(B(1)/(A(1)-log( P)))-C(1);
    Tsat2=(B(2)/(A(2)-log( P)))-C(2);
for i=1:i
    T(i)=Y(1)*Tsat1(i)+Y(2)*Tsat2(i)
    Psat1(i)=exp(A(1)-(B(1)/(C(1)+T(i))))
    Psat2(i)=exp(A(2)-(B(2)/(C(2)+T(i))))
    X1(i)=(Y(1)*P)/(gamma(i,1)*Psat1(i))
    X2=1-X1
    switch type
        case 'M'
    gamma(i+1,1)=gamma1eqn(X1(end),X2(end),T(end))
    gamma(i+1,2)=gamma2eqn(X1(end),X2(end),T(end))
        case 'R'
            gamma(i+1,1)=gamma(i,1)
            gamma(i+1,2)=gamma(i,2)
    end
    alpha12(i)=(Psat1(i))/(Psat2(i))
    Psateqn1(i)=P*((Y(1)/gamma(i+1,1))+(Y(2)/gamma(i+1,2))*alpha12(i))
    Psateqn2(i)=(Y(1)/(gamma(i+1,1)*alpha12(i)))+(Y(2)/gamma(i+1,2))
    Tsat1(i+1)=(B(1)/(A(1)-log( Psateqn1(i))))-C(1)
    Tsat2(i+1)=(B(2)/(A(2)-log( Psateqn2(i))))-C(2)
end
i=1:i;
t=[i' T(1:end-1)' Psat1(1:end-1)' Psat2(1:end)' alpha12' Psat1(2:end)' T(2:end)' ];
format short g
fprintf('X1 = %f\nX2 = %f\n',X1,X2);
fprintf('  i          Tin            Psat 1         Psat 2            alpha       Psat 1(alpha)         Tout\n')
fprintf('  %i %15f %15f %15f %15f %15f %15f\n',t.');
end