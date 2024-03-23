clear all
clc

% A=[-1 2 1 0 0;3 2 0 1 0; 1 -1 0 0 1];
% b=[4;14;3];
% C=[3;2;0;0;0];

A=[1.2 2.25 1 0 0;1 1.1 0 1 0; 2.5 1 0 0 1];
b=[14;8;9];
C=[1.75;1.25;0;0;0];

[optimizedXs, optimizedFunVal]=linearProg(C,A,b);
disp("optimizedXs=");
disp(optimizedXs);
disp("optimizedFunVal=");
disp(optimizedFunVal);



% z=C'X (with slack), AX=b (with slack), defult all X>=0 
function [optimizedXs, optimizedFunVal]=linearProg(C,A,b)
    Crow=C';
    Cb=Crow(size(C)-size(b)+1:size(C))';


    while(~all(Crow(:)<=0.00001)) % Check Related Profit, not<=0 since floating point error
        % Find which x to promote
        [~, xPromote]=max(Crow(:));



        % Find which x to demote
        Ratio=b./A(:,xPromote);
        [~, xDemote]=min(abs(Ratio));
        Cb(xDemote)=C(xPromote);


        % Perform pivod operation 
        [A, b]=pivodOperation(A,b,xDemote,xPromote);
        disp("A=");
        disp(A);
        disp("b=");
        disp(b);

        %Compute Related Profit
        Crow=zeros(size(Crow));
        for ii=1:size(Crow,2)
            if(sum(A(:,ii).^2)==1)
                Crow(ii)=0;
            else
                Crow(ii)=C(ii)-sum(Cb.*A(:,ii));
            end
        end
        disp("Crow=");
        disp(Crow);
    end
    
    %Compute optimized Xs and corresponding Z
    Xs=zeros(size(C));
    temp=A.^2;
    for ii=1:size(A,2)
        if(sum(temp(:,ii))==1)
            [~,xposition]=max(A);
            Xs(ii)=b(xposition(ii));
        end
    end
    optimizedXs=Xs;
    optimizedFunVal=C'*optimizedXs;

end


function [pivotted_matrix, pivotted_b]= pivodOperation(A,b,targetRow,targetCol)
    M=[A b];
    C=M(targetRow,:);
    
    for ii=1:targetRow-1
        factor=M(ii,targetCol)/C(targetCol);
        for jj=1:size(M,2)
            M(ii,jj)=M(ii,jj)-factor*C(jj);
        end
    end
    if((targetRow+1)<=size(M,1))
        for ii=targetRow+1:size(M,1)
            factor=M(ii,targetCol)/C(targetCol);
            for jj=1:size(M,2)
                M(ii,jj)=M(ii,jj)-factor*C(jj);
            end
        end
    end

    M(targetRow,:)=M(targetRow,:)./M(targetRow,targetCol);

    pivotted_matrix=M(:,1:size(M,2)-1);
    pivotted_b=M(:,size(M,2));
end

