function Kc = MSA_Kc(x,y,z)
    params;

    % for x leg
    q = find_q(x,y,l1,l2);
    Kcx = MSA_Kc_one_leg(Rz(q(1)),Rz(q(2)),D_rp(p(:,1)),K11,K12,K21,K22,K_a, h_rx_12, h_ex_12, h_rx_34, h_px_34,h_rx_56, h_px_56,h_rx_78, h_px_78);

    % for y leg
    q = find_q(y,z,l1,l2);
    Kcy = MSA_Kc_one_leg(Rx(q(1)),Rx(q(2)),D_rp(p(:,2)),K11,K12,K21,K22,K_a, h_ry_12, h_ey_12, h_ry_34, h_py_34,h_ry_56, h_py_56,h_ry_78, h_py_78);

    % for z leg
    q = find_q(z,x,l1,l2);
    Kcz = MSA_Kc_one_leg(Ry(q(1)),Ry(q(2)),D_rp(p(:,3)),K11,K12,K21,K22,K_a, h_rz_12, h_ez_12, h_rz_34, h_pz_34,h_rz_56, h_pz_56,h_rz_78, h_pz_78);
    Kc = Kcx + Kcy + Kcz;
end

