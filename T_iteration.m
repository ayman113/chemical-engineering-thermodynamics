%%%%%% made by : ayman abdalla A19ET4021 %%%%%%%%%
%%%%% 2020/2021/2 %%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

%how to use : for example
% To=375.15 (initial temprature in K)
% q=2500; (heat in joles)
% a,b,c,d are constants, if not given then c=0; or d=0;
%%% >> T_iteration(q,To,a,b,c,d)
function[]=T_iteration(q,To,a,b,c,d)
if isempty(c)
    c=0;
elseif isempty(d)
    d=0;
end
if ceil(To)==To
    T=To+1;
else
    T=ceil(To);
end
for i=1:300;
    t(i)=T(i)/To;
    cp(i)=8.314*(a+((b/2)*(To*(t(i)+1)))+((c/3)*(To^2)*((t(i)^2)+t(i)+1))+((d/(t(i)*(To^2)))));
    T(i+1)=(q/cp(i))+To;
    if round(T(i),2)==round(T(i+1),2)
        break;
    end
end
tv=[T];
ti=tv(1:end-1);
tii=tv(2:end);
i=1:i;
tt=[i; ti; t; cp;tii];
fprintf('iteration      Tin                t            cp          Tout\n');
fprintf('%5.0f   %12.6f    %12.6f     %12.6f     %12.6f\n', tt);
T=[i' ti' t' cp'];
end