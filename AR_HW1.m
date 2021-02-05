clear all;

We = [0 100 0 0 0 0]'; % external force
MSA = zeros(10,10,10);
kf = 10;

for i = 1:10
    for j = 1:10
        for k = 1:10
            x = i/kf; y = j/kf; z = k/kf;

            dt = (MSA_Kc(x,y,z)\We)'; 
            MSA(i,j,k) = norm(dt(1:3)); 
        end
    end
end

[X,Y,Z] = ndgrid(1:size(MSA,1), 1:size(MSA,2), 1:size(MSA,3));
pointsize = 1500;
scatter3(X(:)/10, Y(:)/10, Z(:)/10,pointsize, MSA(:),'.');
colorbar
title('Maximum deflections [0 100 0]')
xlabel('X')
ylabel('Y')
zlabel('Z')
