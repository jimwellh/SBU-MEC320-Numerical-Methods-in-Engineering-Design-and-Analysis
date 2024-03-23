clc;
syms HL CP NHR NKW CWT CR WBT
%Enter f1 (equation 10) to f6 (equation 15) 
f1=-45.19*(CP)^4+420*(CP)^3-1442*(CP)^2+2248*(CP)-NHR+6666;
f2=4883*(CP)^4-44890*(CP)^3+152600*(CP)^2-231500*(CP)-NKW+383400;
f3=1.6302-CP-0.50095*((10)^(-1))*(CWT)+0.55796*(10)^(-3)*(CWT)^2+0.32946*(10)^(-3)*(HL)-0.10229*(10)^(-4)*(HL)*(CWT)+0.16253*(10)^(-6)*(HL)*(CWT)^2+0.42658*(10)^(-6)*(HL)^2-0.92331*(10)^(-8)*(HL)^2*(CWT)+0.71265*(10)^(-10)*(HL)^2*(CWT)^2;
f4=-0.10046*(10)^2+33.06145+0.85396*(CR)+0.2699465*(CR)+0.10957*(10)^1*(WBT)-0.3251625*(WBT)-0.11978*(10)^((-1))*(WBT)*(CR)+2.08481*(10)^((-3))*(WBT)*(CR)-CWT;
f5=2000*HL/145000-CR;
f6=((NKW)*(NHR-3412))/10^6-HL;

%The partial derivative of each variables for f1 to f6 (refer to equation 16 to equation 51 in the report)
%equation 16 to equation 21
df1dhl=0;
df1dcp=- (4519*CP^3)/25 + 1260*CP^2 - 2884*CP + 2248;
df1dnhr=-1;
df1dnkw=0;
df1dcwt=0;
df1dcr=0;

%equation 22 to equation 27
df2dhl=0;
df2dcp=19532*CP^3 - 134670*CP^2 + 305200*CP - 231500;
df2dnhr=0;
df2dnkw=-1;
df2dcwt=0;
df2dcr=0;

%equatiom 28 to 33
df3dhl=0.32946*(10)^((-3))-0.10229*(10)^((-4))*(CWT)+0.16253*(10)^((-6))*(CWT)^2+0.85316*(10)^((-6))*(HL)-1.84662*(10)^((-8))*(HL)*(CWT)+1.42530*(10)^((-10))*(HL)*(CWT)^2;
df3dcp=-1;
df3dnhr=0;
df3dnkw=0;
df3dcwt=-0.50095*(10)^((-1))+1.11592*(10)^((-3))*(CWT)-0.10229*(10)^((-4))*(HL)+0.32506*(10)^((-6))*(HL)*(CWT)-0.92331*(10)^((-8))*(HL)^2+1.42530*(10)^((-10))*(HL)^2*(CWT);
df3dcr=0;

%equatiom 34 to 39
df4dhl=0;
df4dcp=0;
df4dnhr=0;
df4dnkw=0;
df4dcwt=-1;
df4dcr=0.85396+0.2699465-0.11978*(10)^((-1))*(WBT)+2.08481*(10)^((-3))*(WBT);

%equatiom 40 to 45
df5dhl=2/145;
df5dcp=0;
df5dnhr=0;
df5dnkw=0;
df5dcwt=0;
df5dcr=-1;

%equatiom 46 to 51
df6dhl=-1;
df6dcp=0;
df6dnhr=NKW/1000000;
df6dnkw=NHR/1000000 - 853/250000;
df6dcwt=0;
df6dcr=0;

%Jacobian matrix J
J=[df1dhl,df1dcp,df1dnhr,df1dnkw,df1dcwt,df1dcr;
    df2dhl,df2dcp,df2dnhr,df2dnkw,df2dcwt,df2dcr;
    df3dhl,df3dcp,df3dnhr,df3dnkw,df3dcwt,df3dcr;
    df4dhl,df4dcp,df4dnhr,df4dnkw,df4dcwt,df4dcr;
    df5dhl,df5dcp,df5dnhr,df5dnkw,df5dcwt,df5dcr;
    df6dhl,df6dcp,df6dnhr,df6dnkw,df6dcwt,df6dcr;];

%Set initial guesses
hl=1000; 
cp=1; 
nhr=8000; 
nkw=250000; 
cwt=50; 
cr=10;

%set error
errs=0.0005;

%initiallize matrixs
B=zeros(6,1);
Xm=[hl;cp;nhr;nkw;cwt;cr];
Xm1=zeros(6,1);
ResultMatrix=zeros(7,91); %matric which save the result
ResultMatrix(1,:)=32:1:122; %set desire WBT range
Xmt=transpose(Xm);
iter=1;


for wbt=32:1:122 %set desire WBT range
    f4s=subs(f4,WBT,wbt);
    %Applying Newton-Raphson method for selected WBT
    for i=1:100 
        Jm=double(subs(J,[HL CP NHR NKW CWT CR WBT],[Xmt,wbt]));
        B(:,:)=double(-1.*[(subs(f1,[HL CP NHR NKW CWT CR],Xmt));
            (subs(f2,[HL CP NHR NKW CWT CR],Xmt));
            (subs(f3,[HL CP NHR NKW CWT CR],Xmt));
            (subs(f4s,[HL CP NHR NKW CWT CR],Xmt));
            (subs(f5,[HL CP NHR NKW CWT CR],Xmt));
            (subs(f6,[HL CP NHR NKW CWT CR],Xmt));
            ]);
        deltaXm=Jm\B;
        Xm1=Xm+deltaXm;
        
        %calculate error for current itteration
        temp=(Xm1-Xm).^2;
        temp2=Xm1.^2;
        err=(sum(temp))^0.5/sum(temp2)^0.5;
        
        %test convergent
        if double(err)<=errs
            ResultMatrix(2:7,iter)=Xm1; %save the estimate result for current WBT
            break;
        end
    
        if i==100
             disp('diverage');
        end
        
        Xmt=transpose(Xm1);
        Xm=Xm1;
    end 

    iter=iter+1;
end

%plot HL, CP, NHR, NKW, CWT, CR vs. WBT
fig1=figure('Name','HL vs. WBT');
plot(ResultMatrix(1,:),ResultMatrix(2,:),"Marker","o","Color","r");
title('HL vs. WBT')
xlabel('WBT (Fahrenheit)')
ylabel('HL')

fig2=figure('Name','CP vs. WBT');
plot(ResultMatrix(1,:),ResultMatrix(3,:),"Marker","o","Color","g");
title('CP vs. WBT')
xlabel('WBT (Fahrenheit)')
ylabel('CP')

fig3=figure('Name','NHR vs. WBT');
plot(ResultMatrix(1,:),ResultMatrix(4,:),"Marker","o","Color","b");
title('NHR vs. WBT')
xlabel('WBT (Fahrenheit)')
ylabel('NHR')

fig4=figure('Name','NKW vs. WBT');
plot(ResultMatrix(1,:),ResultMatrix(5,:),"Marker","o","Color","c");
title('NKW vs. WBT')
xlabel('WBT (Fahrenheit)')
ylabel('NKW')

fig5=figure('Name','CWT vs. WBT');
plot(ResultMatrix(1,:),ResultMatrix(6,:),"Marker","o","Color","m");
title('CWT vs. WBT')
xlabel('WBT (Fahrenheit)')
ylabel('CWT')

fig6=figure('Name','CR vs. WBT');
plot(ResultMatrix(1,:),ResultMatrix(7,:),"Marker","o","Color","y");
title('CR vs. WBT')
xlabel('WBT (Fahrenheit)')
ylabel('CR')