syms tt
yy(tt)=exp(1/4*tt^4-1.5*tt);

t=0:0.5:2;
for ii=1:5
    ana(ii)=yy(t(ii));
end
ana=double(ana);
eur05=[1	0.25	0.078125	0.05859375	0.1135253906];
eur025=[1	0.3930664063	0.1884242892	0.1835480747	0.5296948284];
midpoint=[1 0.5361328125 0.3464705944 0.4151556829 1.591801758];
RK4=[1	0.4810959895	0.2869322544	0.3737521928	2.513072473];

plot(t,ana,'-square',t,eur05,'-square',t,eur025,'-square',t,midpoint,'-square',t,RK4,'-square');
