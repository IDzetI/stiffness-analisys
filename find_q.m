function q = find_q(x,y,l1,l2)
    cosq2 = (x^2 + y^2 - l1^2 - l2^2) / (2*l1*l2);
    sinq2 = sqrt(1 - cosq2^2);
    q2 = atan2(sinq2,cosq2);
    q1 = atan2(x,y) - atan2(l2*sinq2, l2*cosq2);
    q3 = -q1 -q2;
    q = [q1,q2,q3];
end

