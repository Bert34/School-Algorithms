function [L, U, P] = luFactor(A)
    [m, n] = size(A);
    L=eye(n); %eye function returns an n-by-n identity matrix with ones on the main diagonal and zeros elsewhere.
    P=eye(n);
    U=A;
if m~=n, error('Matrix has to be square'); end %rows has to equal columns
if nargin<1, error('1 inputs needed');end %if 1 inputs or more aren't entered
    for k=1:m-1 %where we start step 1 and pivot
        pivot=max(abs(U(k:m,k)))
        for j=k:m
            if(abs(U(j,k))==pivot)
                ind=j
                break;
            end
        end
        U([k,ind],k:m)=U([ind,k],k:m) %where we start step 2 and factorize into L and U
        L([k,ind],1:k-1)=L([ind,k],1:k-1)
        P([k,ind],:)=P([ind,k],:)
        for j=k+1:m
            L(j,k)=U(j,k)/U(k,k)
            U(j,k:m)=U(j,k:m)-L(j,k)*U(k,k:m)
        end
        pause;
    end
end
