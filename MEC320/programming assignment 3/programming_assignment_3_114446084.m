%known measured data points given from the problem (represent table 1 and 2)
z=[0 50	100	150	225	300	375	450	600];
F=[0 30	40	40	50	50	60	80 100];
M=[0 1500 4000 6000	11250 15000	22500 36000	60000];

n1=newton_interpolation(z,F);
% fOfz : The force distribution curve function obtained by Newton's interpolating polynomial method over data points from table 1
fOfz=@(x) F(1)+ ...
    (x-z(1))*n1(1)+ ...
    (x-z(1))*(x-z(2))*n1(2)+ ...
    (x-z(1))*(x-z(2))*(x-z(3))*n1(3)+ ...
    (x-z(1))*(x-z(2))*(x-z(3))*(x-z(4))*n1(4)+ ...
    (x-z(1))*(x-z(2))*(x-z(3))*(x-z(4))*(x-z(5))*n1(5)+ ...
    (x-z(1))*(x-z(2))*(x-z(3))*(x-z(4))*(x-z(5))*(x-z(6))*n1(6)+ ...
    (x-z(1))*(x-z(2))*(x-z(3))*(x-z(4))*(x-z(5))*(x-z(6))*(x-z(7))*n1(7)+ ...
    (x-z(1))*(x-z(2))*(x-z(3))*(x-z(4))*(x-z(5))*(x-z(6))*(x-z(7))*(x-z(8))*n1(8);%+ ...
    %(x-z(1))*(x-z(2))*(x-z(3))*(x-z(4))*(x-z(5))*(x-z(6))*(x-z(7))*(x-z(8))*(x-z(9))*n1(9);

% this comment out section plots fOfz and shows this is not a proper way to solve the
% problem
% I=0:600;
% for ii=I
%     J(ii+1)=fOfz(ii);
% end
% plot(I,J);
% xlabel('z (m)');
% ylabel('F (kN/m)');

%Actual data points from eye checking the given curve used to solve the problem (represents table 3 in the report)
z=0:25:600;
F=[0 15	30	38	40	40	40	43	47	50 50	50	50	52	57	60	70	75 80	88	90	92	96	99	100];
M=[0 375 1500 2850	4000 5000	6000 7525 9400	11250 12500	13750 15000 16900 19950	22500	28000	31875 36000	41800	45000	48300	52800	56925	60000];

%Calculation of each values
Fnet_trop=trapezoidalRule(z,F);
Fnet_simp=simpsonOneThird(z,F);
Mnet_trop=trapezoidalRule(z,M);
Mnet_simp=simpsonOneThird(z,M);
zeq_trop=Mnet_trop/Fnet_trop;
zeq_simp=Mnet_simp/Fnet_simp;

%Printing the result out
X1=sprintf('The total force Fnet acting on the building calculated by Trapezoidal Rule is %d (kN), which is equal to %s (N)',Fnet_trop,Fnet_trop*1000);
X2=sprintf('The total force Fnet acting on the building calculated by Simposon 1/3 is %d (kN), which is equal to %s (N)',Fnet_simp,Fnet_simp*1000);
X3=sprintf('The line of force Zeq acting on the building calculated by Trapezoidal Rule is %d (m)',zeq_trop);
X4=sprintf('The line of force Zeq acting on the building calculated by Simposon 1/3 is %d (m)',zeq_simp);
disp(X1);
disp(X2);
disp(X3);
disp(X4);

%Trapezoidal Rule method
function intg=trapezoidalRule(x,y)
    %input checking
    if(size(x)~=size(y))
        error('Input size disagree')
    end
    %calculate the value of each minimum unit and summing all units up
    sum=0;
    for ii=2:size(x,2)
        sum=sum+(y(ii)+y(ii-1))*(x(ii)-x(ii-1))/2;
    end
    %return the result
    intg=sum;
end

%Simpson 1/3 method
function intg=simpsonOneThird(x,y)
    %input checking
    if(size(x)~=size(y))
        error('Input size disagree')
    end
    if(mod(size(x,2),2)~=1 || size(x,2)<3)
        error('Unsuficient number of segments')
    end
     %calculate the value of each minimum unit and summing all units up
     sum=0;
     width=x(3)-x(1); 
     for ii=3:2:size(x,2)
         if(width~=(x(ii)-x(ii-2)))
            error('unequal width')  % checking if width between all points are equal
         end
        sum=sum+width*(y(ii-2)+4*y(ii-1)+y(ii))/6;
     end
    %return the result
    intg=sum;
end

%Newton's interpolating polynomial method
function finite_devided_diff= newton_interpolation(x,y)

    if(size(x)~=size(y))
        error('Input size disagree')
    end

    f=zeros(size(x,2),size(x,2)+1); %init matrix
    f(:,1)=x';
    f(:,2)=y';
    %form the table from FIGURE 18.5 in the textbook and claculate the finite devided difference values
    for col=3:size(f,2)
        for row=1:size(f,1)
            if(row+col-2<=size(f,1))
                f(row,col)=(f(row+1,col-1)-f(row,col-1))/(f(row+col-2,1)-f(row,1));
            end
        end
    end
    %return the desire finite devided difference values f[x1,x0] f[x2,x1,x0]...f[xn,xn-1,...x0] only
    finite_devided_diff=f(1,3:size(f,2)); 
end