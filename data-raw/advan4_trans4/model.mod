[PK]
KA=THETA_1*exp(ETA_1)
CL=THETA_2*exp(ETA_2)
V2=THETA_3*exp(ETA_3)
V3=THETA_4*exp(ETA_4)
Q=THETA_5*exp(ETA_5)
S2=V2

[DES]
d/dt(A_DEPOT)=-KA*A_DEPOT
d/dt(A_CENTRAL)=KA*A_DEPOT + Q*A_PERIPHERAL/V3 + (-CL/V2 - Q/V2)*A_CENTRAL
d/dt(A_PERIPHERAL)=-Q*A_PERIPHERAL/V3 + Q*A_CENTRAL/V2
d/dt(A_OUTPUT)=CL*A_CENTRAL/V2
F=A_CENTRAL/S2

[ERROR]
CP=F
OBS_CP=CP*(EPS_1 + 1)
Y=OBS_CP
