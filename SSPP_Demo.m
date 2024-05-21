e_eff = 1.6;
SSPP_order = [1,0];
px = 40e-6;
py = 40e-6:1e-6:260e-6;

[Freq_spp,Lattice_Const] = PureSSPP(px,py,e_eff,SSPP_order);
plot(Lattice_Const,Freq_spp)
hold on
SSPP_order = [0,1];
[Freq_spp,Lattice_Const] = PureSSPP(px,py,e_eff,SSPP_order);
plot(Lattice_Const,Freq_spp)

SSPP_order = [1,1];
[Freq_spp,Lattice_Const] = PureSSPP(px,py,e_eff,SSPP_order);
plot(Lattice_Const,Freq_spp)

SSPP_order = [2,0];
[Freq_spp,Lattice_Const] = PureSSPP(px,py,e_eff,SSPP_order);
plot(Lattice_Const,Freq_spp)

legend('10','01','11','20')