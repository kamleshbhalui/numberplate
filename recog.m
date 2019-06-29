s=rng(0);
w1=normrnd(0,1,[868 100]);
w2=normrnd(0,1,[100,37]);

%{
b2=normrnd(0,1,1);
w3=normrnd(0,1,[500,400]);
b3=normrnd(0,1,1);
out=normrnd(0,1,[400,37]);
%}

for i=1:100000
    for j=1:947
    l0=x(j,:);
    l1=sigmoid(sum(l0*w1'));
    l2=sigmoid(sum(l1*w2));
    
    l2_error=y-l2;
    if mod(i,1000)==0
        disp(mean2(abs(l2_error)));
    end
    l2_delta=l2_error.*derivsigmoid(l2);
    l1_error=dot(l2_delta,w2,2);
    l1_delta=l1_error.*derivsigmoid(l1);
    w2=w2+dot(l2,l2_delta);
    w1=w1+dot(l1,l1_delta);
    end
end
