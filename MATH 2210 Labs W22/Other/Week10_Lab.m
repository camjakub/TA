clear all 
clc 

format long

syms t y 
syms f(t,y)

f(t,y) = 2*sqrt(t)*y+2; 
yest(1)= -2;
currentt(1)= 0;
h = 0.125;

for i = 1:40
  k1=h*f(currentt(i),yest(i));
  k2=h*f(currentt(i)+0.5*h,yest(i)+0.5*k1);
  k3=h*f(currentt(i)+0.5*h,yest(i)+0.5*k2);
  k4=h*f(currentt(i)+h,yest(i)+k3);

  yest(i+1)=yest(i)+k1/6+k2/3+k3/3+k4/6;
  currentt(i+1)=currentt(i)+h;
end

yest