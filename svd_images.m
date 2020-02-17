% Image compression example using SVD
% (singular value decomposition)

% Original image files (grayscale)
files = {'images/butterfly.jpg', ...
         'images/goose.jpg', ...
         'images/rabbit.jpg'};

close all;
for i = 1:3
    
    % Load and show original image
    fn = files{i};
    A = imread(fn);
    subplot(3,3,i);
    imshow(A);
    [r, c] = size(A);
    info = whos('A');
    mem_kb = info.bytes/1000;
    title(['Original (', num2str(r), ' x ', num2str(c), ', ', ...
        num2str(mem_kb), 'kB )']);
    
    % Perform SVD
    [U,S,V] = svd(double(A));
    
    % Plot singular values
    subplot(4,3,3+i)
    plot(log(diag(S)), 'LineWidth', 1);
    title('Singular values on log-scale');
    ylabel('log(\sigma_i)');
    xlabel('i');
    axis tight;
    
    % Create and show reconstruction with 10 singular values
    subplot(4,3,6+i)
    R  = 10;
    Ur = U(:,1:R);
    Sr = S(1:R, 1:R);
    Vr = V(:,1:R);
    B  = uint8(Ur * Sr * Vr');
    imshow(B);
    title('Reconstruction with 10 singular values');
    
    % Create and show reconstruction with 100 singular values
    subplot(4,3,9+i)
    R  = 100;
    Ur = U(:,1:R);
    Sr = S(1:R, 1:R);
    Vr = V(:,1:R);
    B  = uint8(Ur * Sr * Vr');
    imshow(B);
    title('Reconstruction with 100 singular values');
    
    
end

