%%%%% made by : ayman adalla A19ET4021 %%%%%%%%
%%%%% 2020/2021/2 %%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% how to use : for example
% eqn='VDW'; (for Van DerWaals)
% or eqn='RK'; (for Redlich/Kwong) 
% or eqn='SRK'; (for Soave/Redlich/Kwong) 
% or eqn='PR'; (for Peng/Robinson) 
% pr=1.2;
% tr=2.1;
% w=0.56;
%%% >> Z_iteration(eqn,pr,tr,w)
function[]=Z_iteration(eqn,pr,tr,w)
Z=1;
while true
    switch eqn
        case'VDW'
            alpha=1;
            o=0;
            e=0;
            n=1/8;
            u=27/64;
        case'RK'
            alpha=tr^(-0.5);
            o=1;
            e=0;
            n=0.08664;
            u=0.42748;
        case'SRK'
            alpha=(1+(0.48508+(1.574*w)-(0.176*w^2))*(1-(tr^0.5)))^2;
            o=1;
            e=0;
            n=0.08664;
            u=0.42748;
        case'PR'
            alpha=(1+(0.37464+(1.54226*w)-(0.26992*w^2))*(1-(tr^0.5)))^2;
            o=1+sqrt(2);
            e=1-sqrt(2);
            n=0.07780;
            u=0.45724;
    end
    beta=n*(pr/tr);
    q=((u*alpha)/(n*tr));
    for i=1:50
       Z(i+1)=1+beta-((q*beta)*((Z(i)-beta)/((Z(i)+(e*beta))*(Z(i)+(o*beta)))));
if round(Z(i),3)==round(Z(i+1),3)
    break;
end
    end
    Zi=Z(1:end-1);
    Zii=Z(2:end);
    i=1:i;
    tt=[i; Zi; Zii;];
    fprintf('alpha= %f\n beta= %f\n  q=%f\n',alpha,beta,q);
    fprintf('iteration      Z in          Z out      \n');
        fprintf('%5.0f   %12.6f    %12.6f     \n', tt);
    break;
end