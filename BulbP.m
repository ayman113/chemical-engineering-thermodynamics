%%%%% made by : ayman adalla A19ET4021 %%%%%%%%
%%%%% 2020/2021/2 %%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% how to use : for example
% Psat=[300 400]; (saturated pressures) 
% X=[0.5 0.5]; (molar fractions)
% type='M' (for modified rault's law) or type ='R' (for raults law)
% gamma =[1.2 2.1];
%%% >> BulbP(Psat,X,type,gamma)
function BulbP(Psat,X,type,gamma)
P=0;
switch type
    case 'R'%rault's law
        for i=1:length(Psat)
            P=P+X(i)*Psat(i);
            
        end
        for i=1:length(Psat)
            Y(i)=(X(i)*Psat(i))/(P);
        end
        
    case 'M'%modified rault's law
        for i=1:length(Psat)
            P=P+X(i)*Psat(i)*gamma(i);
        end
        for i=1:length(Psat)
            Y(i)=(X(i)*Psat(i)*gamma(i))/(P);
        end
end
i=1:length(Psat);
t=[i;Y];
fprintf('P = %f\n',P);
fprintf('Y%i = %f\n',t)
end