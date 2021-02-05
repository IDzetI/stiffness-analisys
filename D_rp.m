function D = D_rp(p)
    D = [
        [eye(3) skew(p)]
        [zeros(3) eye(3)]
        ];
end

