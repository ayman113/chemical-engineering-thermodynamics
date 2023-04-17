%%%%% made by : ayman adalla A19ET4021 %%%%%%%%
%%%%% 2020/2021/2 %%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% how to use : for example a mixture of 2 components
% Tc=[500 600];
% Vc=[50 60];
% Zc=[0.9 0.8]; 
% W=[0.5 0.6]; (omega)
% R=8.314 or 83.14 (R constant depends on the given units)
% T=450; (given temprature)
% P=50; (given pressure)
% y=[0.4 0.6]; (mole fractions)
%%% >> fugacity(Tc,Vc,Zc,W,R,T,P,y)
function fugacity(Tc,Vc,Zc,W,R,T,P,y)
n=length(Tc);
vc=zeros(n);tc=vc;zc=vc;w=vc;pc=vc;tr=vc;Bo=vc;B1=vc;Bcap=vc;B=vc;
for i=1:n
    for j=1:n
        vc(i,j)=(((Vc(i)^(1/3)+Vc(j)^(1/3)))/2)^3;
        tc(i,j)=(Tc(i)*Tc(j))^0.5;
        zc(i,j)=(Zc(i)+Zc(j))/2;
        w(i,j)=(W(i)+W(j))/2;
        pc(i,j)=(zc(i,j)*R*tc(i,j))/(vc(i,j));
        tr(i,j)=T/tc(i,j);
        Bo(i,j)=0.083-(0.422/(tr(i,j)^1.6));
        B1(i,j)=0.139-(0.172/(tr(i,j)^4.2));
        Bcap(i,j)=Bo(i,j)+w(i,j)*B1(i,j);
        B(i,j)=(Bcap(i,j)*R*tc(i,j))/pc(i,j);
    end
end
if n==3
    for i=1:n
        for j=1:n
            for k=1:n
                s(i,k)=2*B(i,k)-B(i,i)-B(k,k);
                o(k)=exp((P/(R*T))*(B(k,k)+(0.5*y(i)*y(j)*(2*s(i,k)-s(i,j)))));
                f(k)=o(k)*y(k)*P;
            end
        end
    end
else
                s=2*B(1,2)-B(1,1)-B(2,2);
                o(1)=exp((P/(R*T))*(B(1,1)+((y(2)^2)*s)));
                o(2)=exp((P/(R*T))*(B(2,2)+((y(1)^2)*s)));
                f(1)=o(1)*y(1)*P;
                f(2)=o(2)*y(2)*P;
end
format short g
fprintf('Vc : \n');disp(vc);
fprintf('Tc : \n');disp(tc);
fprintf('Zc : \n');disp(zc);
fprintf('w : \n');disp(w);
fprintf('Tr : \n');disp(tr);
fprintf('Bo : \n');disp(Bo);
fprintf('B` : \n');disp(B1);
fprintf('B^ : \n');disp(Bcap);
fprintf('B : \n');disp(B);
fprintf('l : \n');disp(s);
fprintf('phi : \n');disp(o);
fprintf('f : \n');disp(f);
end