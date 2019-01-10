function [tt1,e1,cmtx] = myThreshold(rt)

[M,N] =size(rt);
cmtx = zeros(256,256);
for m = 1:M-1
    for n = 1:N-1        
       cmtx(rt(m,n)+1,rt(m,n+1)+1) = cmtx(rt(m,n)+1,rt(m+1,n+1)+1) + 1;
    end
end

scmtx = sum(cmtx(:));
prob = cmtx/scmtx;

emax = -100;  
for i=1:255
    
    probA = 0;
    probC = 0;
    
    subProbA = prob(1:i,1:i);
    probA = sum(subProbA(:));
    HA(i) = -0.5*(probA*log2(probA+0.00001));
    
    subProbC = prob(i+1:256,i+1:256);
    probC = sum(subProbC(:));
    HC(i) = -0.5*(probC*log2(probC+0.00001));
        
    e1(i) = HA(i) + HC(i); 
    if e1(i) >= emax
        emax = e1(i);
        tt1 = i;
    end
end