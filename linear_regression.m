function linear_regression(file, d, l)

data  = importdata(file);
lambda = str2double(l);
degree = str2double(d);
training = zeros(size(data,1),degree+1);
target = zeros(size(data,1),1);

for k=1:size(data,1)
    target(:,1) = data(:,2);
end

if(lambda <0)
    disp('Valueof lambda can not be zero.');
    exit(-1);
else
    for j=1:degree+1
        training(:,j) = power(data(:,1),j-1);
    end
    training_transpose = training';
    product = training_transpose*training;
    if(degree == 1)
        identity = eye(2,2);
    else
        identity = eye(3,3);
    end
    term1 = identity * lambda;
    part1 = term1 + product;
    semi_final = training_transpose * target;
    final = inv(part1) * semi_final;
    if (degree==1)
        for x=1:size(final,1)
            fprintf('w%d=%.4f\n',x-1,final(x));
        end
        fprintf('w2=%.4f\n',0);
    else 
        for x=1:size(final,1)
            fprintf('w%d=%.4f\n',x-1,final(x));
        end
    end
end