%---------------------------Q1 Part 1-------------------------------------%
%---------------------------Normal Distribution--------------------------%
N1 = randn(100,1);
N2 = normrnd(0,1,100,1);

phat_randn = fitdist(N1,'Normal');
phat_randn.mean;
phat_randn.var;
figure()
subplot(2,1,1)
phat_randn_hist = histogram(N1)
title('Normal Distribution for T=100 using randn function');

phat_normrnd = fitdist(N2, 'Normal');
phat_normrnd.mean;
phat_normrnd.var;
subplot(2,1,2)
phat_normrnd_hist = histogram(N2)
title('Normal Distribution for T=100 using normrnd function');

%-------------------------------------------------------------------------%
N3 = randn(1000,1);
N4 = normrnd(0,1,1000,1);

phat_randn1 = fitdist(N3,'Normal');
phat_randn1.mean;
phat_randn1.var;
figure()
subplot(2,1,1)
phat_randn1_hist = histogram(N3)
title('Normal Distribution for T=1000 using randn function');

phat_normrnd1 = fitdist(N4, 'Normal');
phat_normrnd1.mean;
phat_normrnd1.var;
subplot(2,1,2)
phat_normrnd1_hist = histogram(N4)
title('Normal Distribution for T=1000 using normrnd function');
%-------------------------------------------------------------------------%
N5 = randn(10000,1);
N6 = normrnd(0,1,10000,1);

phat_randn2 = fitdist(N5,'Normal');
phat_randn2.mean;
phat_randn2.var;
figure()
subplot(2,1,1)
phat_randn2_hist = histogram(N5)
title('Normal Distribution for T=10000 using randn function');

phat_normrnd2 = fitdist(N6, 'Normal');
phat_normrnd2.mean;
phat_normrnd2.var;
subplot(2,1,2)
phat_normrnd2_hist = histogram(N6)
title('Normal Distribution for T=10000 using normrnd function');

%------------------------------------------------------------------------%
%---------------------------Uniform Distribution--------------------------%


X1 = rand(100,1);
[ahat,bhat] = unifit(X1);
figure()
subplot(3,1,1)
M1 = histogram(X1);
title('Uniform Distribution for T=100');

X2 = rand(1000,1);
[ahat1,bhat1] = unifit(X2);
subplot(3,1,2)
M2 = histogram(X2);
title('Uniform Distribution for T=1000');

X3 = rand(10000,1);
[ahat2,bhat2] = unifit(X3);
subplot(3,1,3)
M3 = histogram(X3);
title('Uniform Distribution for T=10000');

%------------------------------------------------------------------------%
%-------------------Exponential Distribution------------------------------%

E1 = exprnd(1,1,100);
muhat = expfit(E1);
figure()
subplot(3,1,1)
histogram(E1);
title('Exponential Distribution for T=100');

E2 = exprnd(1,1,1000);
muhat_1 = expfit(E2);
subplot(3,1,2)
histogram(E2);
title('Exponential Distribution for T=1000');

E3 = exprnd(1,1,10000);
muhat_2 = expfit(E3);
subplot(3,1,3)
histogram(E3);
title('Exponential Distribution for T=10000');

%-------------------------------------------------------------------------%
%---------------------Q1 Part 2-------------------------------------------%
%--------------Rejection Method T=100 for Normal Distribution-------------%
rejection_normal_100 = zeros(100,1);
q = 1;
figure()
while(q<=100)
    u1=rand(1,1);
    u2=rand(1,1);
    y1=-log(u1); 
    y2=-log(u2);
    if(y2>=(y1-1).^2/2)
        u=rand;
       if(u<=0.5)
           rejection_normal_100(q)=y1;
       else
           rejection_normal_100(q)=-y1;
        end
    end
    q=q+1;
end
[muhat,sigmahat] = normfit(rejection_normal_100);
subplot(3,1,1)
histogram(rejection_normal_100);
title('Histogram of Normal Distribution for T=100 by Rejection Method');
%-------------------------------------------------------------------------%
%----------Rejection Method T=1000 for Normal Distribution----------------%
rejection_normal_1000 = zeros(1000,1);
p = 1;
while(p<=1000)
    u1=rand(1,1);
    u2=rand(1,1);
    y1=-log(u1); 
    y2=-log(u2);
    if(y2>=(y1-1).^2/2)
        u=rand;
       if(u<=0.5)
           rejection_normal_1000(p)=y1;
       else
           rejection_normal_1000(p)=-y1;
        end
    end
    p=p+1;
end
[muhat1,sigmahat1] = normfit(rejection_normal_1000);
subplot(3,1,2)
histogram(rejection_normal_1000);
title('Histogram of Normal Distribution for T=1000 by Rejection Method');

%-------------------------------------------------------------------------%
%--------Rejection Method T=10000 for Normal Distribution-----------------%
rejection_normal_10000 = zeros(10000,1);
r = 1;
while(r<=10000)
    u1=rand(1,1);
    u2=rand(1,1);
    y1=-log(u1); 
    y2=-log(u2);
    if(y2>=(y1-1).^2/2)
        u=rand;
       if(u<=0.5)
           rejection_normal_10000(r)=y1;
       else
           rejection_normal_10000(r)=-y1;
        end
    end
    r=r+1;
end
[muhat2,sigmahat2] = normfit(rejection_normal_10000);
subplot(3,1,3)
histogram(rejection_normal_10000);
title('Histogram of Normal Distribution for T=10000 by Rejection Method');
%-------------------------------------------------------------------------%
%--------Rejection Method T=100 for Uniform Distribution-----------------%

rej_uniform_100=zeros(1,100);
rej_uniform_1000=zeros(1,1000);
rej_uniform_10000=zeros(1,10000);
k=1;
while(k<=100)
    q=rand;
    if(q>=0)
        rej_uniform_100(k)=q;
        k=k+1;
    end
end

k=1;
while(k<=1000)
    q=rand;
    if(q>=0)
        rej_uniform_1000(k)=q;
        k=k+1;
    end
end

k=1;
while(k<=10000)
    q=rand;
    if(q>=0)
        rej_uniform_10000(k)=q;
        k=k+1;
    end
end

[ahat_100,bhat_100]=unifit(rej_uniform_100);
mean_rej_100=0.5*(bhat_100+ahat_100);
[ahat_1000,bhat_1000]=unifit(rej_uniform_1000);
mean_rej_1000=0.5*(bhat_1000+ahat_1000);
[ahat_10000,bhat_10000]=unifit(rej_uniform_10000);
mean_rej_10000=0.5*(bhat_10000+ahat_10000);
figure()
subplot(3,1,1)
histogram(rej_uniform_100)
title('Histogram for Uniform Distribution for T=100 by Rejection Method');  
subplot(3,1,2)
histogram(rej_uniform_1000)
title('Histogram for Uniform Distribution for T=1000 by Rejection Method'); 
subplot(3,1,3)
histogram(rej_uniform_10000)
title('Histogram for Uniform Distribution for T=10000 by Rejection Method'); 

%-------------------------------------------------------------------------%
%--------Rejection Method T=100 for Exponential Distribution--------------%
rej_exp_100 = zeros(1,100);
a=10;
for i = 1:100 
    x_hat= (rand*a); 
    while (rand*a)>exp(-x_hat) 
        x_hat = (rand*a); 
    end
    rej_exp_100(i) = x_hat; 
end
mu_rej_exp_100=expfit(rej_exp_100);

%--------Rejection Method T=1000 for Exponential Distribution-------------%

rej_exp_1000 = zeros(1,1000);
for i = 1:1000 
    x_hat= rand*a; 
    while (rand*a) > exp(-x_hat)  
        x_hat = (rand*a); 
    end
    rej_exp_1000(i) = x_hat; 
end
mu_rej_exp_1000=expfit(rej_exp_1000);

%--------Rejection Method T=10000 for Exponential Distribution------------%

rej_exp_10000 = zeros(1,10000);
for i = 1:10000 
    x_hat= (rand*a); 
    while (rand*a) > exp(-x_hat) 
        x_hat = (rand*a); 
    end
    rej_exp_10000(i) = x_hat; 
end
mu_exp_rej_10000=expfit(rej_exp_10000);

figure()
subplot(3,1,1)
histogram(rej_exp_100)
title('Histogram for Exponential Distribution for T=100 by Rejection Method');
subplot(3,1,2)
histogram(rej_exp_1000)
title('Histogram for Exponential Distribution for T=1000 by Rejection Method');
subplot(3,1,3)
histogram(rej_exp_10000)
title('Histogram for Exponential Distribution for T=10000 by Rejection Method');

%--------------------------------------------------------------------------%

%The parameters obtained are close to the theoretical values. 
%------------------------------Q2-----------------------------------------%
%---------------Transformation of Random Variables------------------------%

N1_transformed = zeros(100,1);
s = 0;

for i = 1:1:100
    s = s+N1(i);
    N1_transformed(i) = s/i;
end
figure()
subplot(3,1,1)
histogram(N1_transformed);
title('Histogram of transformed RV of Normal Distribution for T=100');


N3_transformed = zeros(1000,1);
s1 = 0;
for j = 1:1:1000
    s1 = s1+N3(j);
    N3_transformed(j) = s1/j;
end
subplot(3,1,2)
histogram(N3_transformed);
title('Histogram of transformed RV of Normal Distribution for T=1000');


N5_transformed = zeros(10000,1);
s2 = 0;
for k = 1:1:10000
    s2 = s2+N5(k);
    N5_transformed(k) = s2/k;
end
subplot(3,1,3)
histogram(N5_transformed);
title('Histogram of transformed RV of Normal Distribution for T=10000'); 

X1_transformed = zeros(100,1);
s4 = 0;
for i = 1:1:100
    s4 = s4+X1(i);
    X1_transformed(i) = s4/i;
end
figure()
subplot(3,1,1)
histogram(X1_transformed);
title('Histogram of transformed RV of Uniform Distribution for T=100'); 

X2_transformed = zeros(1000,1);
s5 = 0;
for i = 1:1:1000
    s5 = s5+X2(i);
    X2_transformed(i) = s5/i;
end
subplot(3,1,2)
histogram(X2_transformed);
title('Histogram of transformed RV of Uniform Distribution for T=1000');

X3_transformed = zeros(10000,1);
s6 = 0;
for i = 1:1:10000
    s6 = s6+X3(i);
    X3_transformed(i) = s6/i;
end
subplot(3,1,3)
histogram(X3_transformed);
title('Histogram of transformed RV of Uniform Distribution for T=10000');

%-------------------------------------------------------------------------%

E1_transformed = zeros(100,1);
sum = 0;
for i = 1:1:100
    sum = sum+E1(i);
    E1_transformed(i) = sum/i;
end
figure()
subplot(3,1,1)
histogram(E1_transformed);
title('Histogram of transformed RV of Exponential Distribution for T=100');

E2_transformed = zeros(1000,1);
sum = 0;
for i = 1:1:1000
    sum = sum+E2(i);
    E2_transformed(i) = sum/i;
end
subplot(3,1,2)
histogram(E2_transformed);
title('Histogram of transformed RV of Exponential Distribution for T=1000');

E3_transformed = zeros(10000,1);
sum = 0;
for i = 1:1:10000
    sum = sum+E3(i);
    E3_transformed(i) = sum/i;
end
subplot(3,1,3)
histogram(E3_transformed);
title('Histogram of transformed RV of Exponential Distribution for T=10000');

%-------------------------------------------------------------------------%






