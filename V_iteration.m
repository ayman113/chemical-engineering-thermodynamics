%%%%% made by : ayman adalla A19ET4021 %%%%%%%%
%%%%% 2020/2021/2 %%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% how to use : for example
% p=50; (pressure)
% t=60; (temprature)
% b,c,d are constants, if not given then c=0; or d=0;
%%% >> V_iteration(p,t,b,c,d)
function[]=V_iteration(p,t,b,c,d)
r=83.1446;
V=(r*t)/p;
while true
    for i=1:50
       V(i+1)=((r*t)/p)*(1+(b/V(i))+(c/(V(i)^2))+(d/(V(i)^3)));
if round(V(i),2)==round(V(i+1),2)
    break;
end
    end
    Vi=V(1:end-1);
    Vii=V(2:end);
    i=1:i;
    z=(p*V(end))/(r*t);
    tt=[i; Vi; Vii;];
    fprintf('iteration      v in          v out      \n');
        fprintf('%5.0f   %12.6f    %12.6f     \n', tt);
        fprintf('z= %f\n',z);
    break;
end