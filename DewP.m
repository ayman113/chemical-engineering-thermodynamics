%%%%% made by : ayman adalla A19ET4021 %%%%%%%%
%%%%% 2020/2021/2 %%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% how to use : for example
% Psat=[500 600]; (saturated pressure)
% Y=[0.5 0.5]; (molar fraction)
% gamma=[1 1];
% A=1.22;
%%% >> DewP(Psat,Y,gamma,A)
function DewP(Psat,Y,gamma,A)
for i=1:5
    P(i)=1/((Y(1)/(Psat(1)*gamma(i,1)))+(Y(2)/(Psat(2)*gamma(i,2))));
    X(i,1)=(Y(1)*P(i))/(gamma(i,1)*Psat(1));
    X(i,2)=1-X(i,1);
    gamma(i+1,1)=exp(A*(X(i,2))^2);
    gamma(i+1,2)=exp(A*(X(i,1))^2);
end
i=1:i;
t=[i' P' gamma(2:end,1) gamma(2:end,2) X(:,1) X(:,2)];
l=length(t);
format short g
fprintf('  i          P             gamma1           gamma2             X1             X2\n')
fprintf('  %i %15f %15f %15f %15f %15f\n',t.');
end