function xNext = SIM_Plant_RK4(u,x,p,Ts)
global PlantGlobalVariable
isMEnabled = PlantGlobalVariable.isMEnabled;

if isMEnabled
    M = SIM_GEN_M(u,x,p);
    f = SIM_GEN_f(u,x,p);
    k1 = Ts*(M\f);

    M = SIM_GEN_M(u,x+k1/2,p);
    f = SIM_GEN_f(u,x+k1/2,p);
    k2 = Ts*(M\f);

    M = SIM_GEN_M(u,x+k2/2,p);
    f = SIM_GEN_f(u,x+k2/2,p);
    k3 = Ts*(M\f);

    M = SIM_GEN_M(u,x+k3,p);
    f = SIM_GEN_f(u,x+k3,p);
    k4 = Ts*(M\f);
else
    f = SIM_GEN_f(u,x,p);
    k1 = Ts*f;
    
    f = SIM_GEN_f(u,x+k1/2,p);
    k2 = Ts*f;

    f = SIM_GEN_f(u,x+k2/2,p);
    k3 = Ts*f;

    f = SIM_GEN_f(u,x+k3,p);
    k4 = Ts*f;
end
xNext = x + (k1+2*k2+2*k3+k4)/6;
