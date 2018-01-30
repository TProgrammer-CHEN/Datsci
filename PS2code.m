%%poblem d computation
rmvplist=[Means_MVP];smvplist=[Stdev_MVP];
rtglist=[Means_TangP];stglist=[Stdev_TangP];
t=size(industry_ret,1);
for i = 1:1000
    rets = mvnrnd(Means,Covar_matrix,t);
    rmean=mean(rets);rsd=std((rets));rcov = cov((rets));
    rmean=rmean';
    wmvp=inv(rcov)*Ones/(Ones'*inv(rcov)*Ones);
    rwmvp=wmvp'*Means;
    stdwmvp=sqrt(wmvp'*Covar_matrix*wmvp);
    rmvplist=[rmvplist;rwmvp];smvplist=[smvplist;stdwmvp];
    
    wtg=inv(rcov)*(rmean-Ones*rf)/(Ones'*inv(rcov)*(rmean-Ones*rf));
    rwtg=wtg'*Means;
    stdwtg=sqrt(wtg'*Covar_matrix*wtg);
    rtglist=[rtglist;rwtg];stglist=[stglist;stdwtg]; 
end
%% problem d graph plot 1
hold on
scatter(smvplist,rmvplist);
scatter(smvplist(1),rmvplist(1),'red','filled');
title('STD-MEAN Plot of MVP with simulation of Normal Distribution');
legend('Simulation','Real');
xlabel('Standard Deviation');ylabel('Expected Return');
hold off
%% problem d graph plot 2
hold on
scatter(stglist,rtglist);
scatter(stglist(1),rtglist(1),'red','filled');
title('STD-MEAN Plot of tangency portfolios with simulation of Normal Distribution');
legend('Simulation','Real');
xlabel('Standard Deviation');ylabel('Expected Return');
hold off

%% problem e computation
rmvplist=[Means_MVP];smvplist=[Stdev_MVP];
rtglist=[Means_TangP];stglist=[Stdev_TangP];
t=size(industry_ret,1);
for i = 1:1000
    rets =datasample(industry_ret,t);
    rmean=mean(rets);rsd=std((rets));rcov = cov((rets));
    rmean=rmean';
    wmvp=inv(rcov)*Ones/(Ones'*inv(rcov)*Ones);
    rwmvp=wmvp'*Means;
    stdwmvp=sqrt(wmvp'*Covar_matrix*wmvp);
    rmvplist=[rmvplist;rwmvp];smvplist=[smvplist;stdwmvp];
    
    wtg=inv(rcov)*(rmean-Ones*rf)/(Ones'*inv(rcov)*(rmean-Ones*rf));
    rwtg=wtg'*Means;
    stdwtg=sqrt(wtg'*Covar_matrix*wtg);
    rtglist=[rtglist;rwtg];stglist=[stglist;stdwtg]; 
end

%% problem e graph plot 1
hold on
scatter(smvplist,rmvplist);
scatter(smvplist(1),rmvplist(1),'red','filled');
title('STD-MEAN Plot of MVP with simulation of Empirical Distribution');
legend('Simulation','Real');
xlabel('Standard Deviation');ylabel('Expected Return');
hold off
%% problem e graph plot 2
hold on
scatter(stglist,rtglist);
scatter(stglist(1),rtglist(1),'red','filled');
title('STD-MEAN Plot of tangency portfolios with simulation of Empirical Distribution');
legend('Simulation','Real');
xlabel('Standard Deviation');ylabel('Expected Return');
hold off