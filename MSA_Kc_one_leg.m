function Kc = MSA_Kc_one_leg(R1,R2,D,K11,K12,K21,K22,K_a, h_r_12, h_e_12, h_r_34, h_p_34,h_r_56, h_p_56,h_r_78, h_p_78)
    
    I = eye(6);
    
    Q_l1 = [[R1 zeros(3)]
            [zeros(3) R1]
    ];

    Q_l2 = [[R1*R2 zeros(3)]
            [zeros(3) R1*R2]
    ];
    
    K_agg = [

    % Equation 16 (base)
    [zeros(6,6*9) I zeros(6,6*8)]

    % Equation 17 (4-5)
    [zeros(6,6*3) -I zeros(6,6*8) Q_l1*K11*Q_l1' Q_l1*K12*Q_l1' zeros(6,6*4)]
    [zeros(6,6*4) -I zeros(6,6*7) Q_l1*K21*Q_l1' Q_l1*K22*Q_l1' zeros(6,6*4)]

    %Equation 17 (6-7)
    [zeros(6,6*5) -I zeros(6,6*8) Q_l2*K11*Q_l2' Q_l2*K12*Q_l2' zeros(6,6*2)]
    [zeros(6,6*6) -I zeros(6,6*7) Q_l2*K21*Q_l2' Q_l2*K22*Q_l2' zeros(6,6*2)]

    % Equation 18 (8-e)
    [zeros(6,6*16) D -I]
    [zeros(6,6*7) I D' zeros(6,6*9)]
    %[zeros(6,6*7) I D zeros(6,6*9)]

    % Equation 22 (2-3)
    [zeros(6,6*10) I -I zeros(6,6*6)]
    [zeros(6,6*1) I I zeros(6,6*15)]

    % Equation 23 (1-2) - active elastic joint
    [zeros(5,6*9) h_r_12 h_r_12 zeros(5,6*7)]
    [I I zeros(6,6*16)]
    [h_e_12 zeros(1,6*8) (K_a * h_e_12) -(K_a * h_e_12) zeros(1,6*7)]

    % Equation 30 (3-4)
    [zeros(5,6*11) h_r_34 -h_r_34 zeros(5,6*5)]
    [zeros(5,6*2) h_r_34 h_r_34 zeros(5,6*14)]
    [zeros(1,6*2) h_p_34 zeros(1,6*15)]
    [zeros(1,6*3) h_p_34 zeros(1,6*14)]

    % Equation 30 (5-6)
    [zeros(5,6*13) h_r_56 -h_r_56 zeros(5,6*3)]
    [zeros(5,6*4) h_r_56 h_r_56 zeros(5,6*12)]
    [zeros(1,6*4) h_p_56 zeros(1,6*13)]
    [zeros(1,6*5) h_p_56 zeros(1,6*12)]

    % Equation 30 (7-8)
    [zeros(5,6*15) h_r_78 -h_r_78 zeros(5,6*1)]
    [zeros(5,6*6) h_r_78 h_r_34 zeros(5,6*10)]
    [zeros(1,6*6) h_p_78 zeros(1,6*11)]
    [zeros(1,6*7) h_p_78 zeros(1,6*10)]

    % Equation 37 External load
    [zeros(6,6*8) -I zeros(6,6*9)]
    ];

    A = K_agg(1:102,1:102);
    B = K_agg(1:102,103:108);
    C = K_agg(103:108,1:102);
    D = K_agg(103:108,103:108);
    
    Kc = D - C * inv(A) * B;
end
