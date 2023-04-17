%%%%% made by : ayman adalla A19ET4021 %%%%%%%%
%%%%% 2020/2021/2 %%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% how to use : for example
% To=500; (initial Temprature)
% T=600; (final Temprature)
% A,B,C,D are constants
% type='H' (to calculate <Cp>H) or type='S' (to calculate <Cp>s)
%%% >> Cp(To,T,A,B,C,D,type)
function []=Cp(To,T,A,B,C,D,type)
t=T/To;
switch type
    case 'H'
        CpH=8.314*(A+((B/2)*(To)*((t)+1))+((C/3)*(To^2)*((t^2)+t+1))+((D/(t*To^2))));
        fprintf('t= %f\n',t);
        fprintf('<Cp>H = %f\n',CpH);
    case 'S'
        CpS=8.314*(A+(((B*To)*((C*To^2)+((D)/(To*t^2)))*((t+1)/2))*((t-1)/(log(t)))));
        fprintf('t= %f\n',t);
        fprintf('<Cp>s = %f\n',CpS);
end
end