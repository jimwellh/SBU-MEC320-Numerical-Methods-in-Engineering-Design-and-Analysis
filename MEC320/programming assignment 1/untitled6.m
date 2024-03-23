syms HL CP NHR NKW CWT CR WBT



f1=-45.19*(CP)^4+420*(CP)^3-1442*(CP)^2+2248*(CP)-NHR+6666;
f2=4883*(CP)^4-44890*(CP)^3+152600*(CP)^2-231500*(CP)-NKW+383400;
f3=1.6302-CP-0.50095*((10)^(-1))*(CWT)+0.55796*(10)^(-3)*(CWT)^2+0.32946*(10)^(-3)*(HL)-0.10229*(10)^(-4)*(HL)*(CWT)+0.16253*(10)^(-6)*(HL)*(CWT)^2+0.42658*(10)^(-6)*(HL)^2-0.92331*(10)^(-8)*(HL)^2*(CWT)+0.71265*(10)^(-10)*(HL)^2*(CWT)^2;
f4=-0.10046*(10)^2+33.06145+0.85396*(CR)+0.2699465*(CR)+0.10957*(10)^1*(WBT)-0.3251625*(WBT)-0.11978*(10)^((-1))*(WBT)*(CR)+2.08481*(10)^((-3))*(WBT)*(CR)-CWT;
f5=2000*HL/145000-CR;
f6=((NKW)*(NHR-3412))/10^6-HL;

a=[1154,2.26,8051,248824,83.8,15.9,70.0];

double(subs(f1,[HL CP NHR NKW CWT CR WBT],a))
double(subs(f2,[HL CP NHR NKW CWT CR WBT],a))
double(subs(f3,[HL CP NHR NKW CWT CR WBT],a))
double(subs(f4,[HL CP NHR NKW CWT CR WBT],a))
double(subs(f5,[HL CP NHR NKW CWT CR WBT],a))
double(subs(f6,[HL CP NHR NKW CWT CR WBT],a))
