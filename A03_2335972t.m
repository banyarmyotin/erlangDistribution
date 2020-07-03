clear
clc
% option : the choice made by the user
fprintf ('Please choose an option : \n');
fprintf ('1. varying in scale parimeter{fixed k} \n');
fprintf ('2. varying in Shape perimeter(fixed lambda \n');
option = 0;
while option ~= 1 & option~= 2
    option= input('Type "1" for varying Scale or "2" for varying shape: ');
    
end
switch option
    case 1
        %case 1 Scale varying, so fixed k
        k=0;
        %k warning
        while k<1
            k=input('Insert the fixed value of shape factor k (must be greater than or equal to 1): ');
        end
        %x_min warning ( must be greater than or equal to 0
        x_min=-1;
        while x_min < 0
            x_min= input('Insert the minimum value of x {must be greater than or equal to 0}: ');
        end
        %x_max warning (must be greater than x_min)
        x_max = x_min -1;
        while x_max <= x_min
            x_max= input('Insert the maximum value of x (must be greater than x minimum): ');
        end
        %value for the difference between the x_max and x_min is set
        x_difference= x_max- x_min;
        %x_inc warning and user input
        x_inc= x_difference;
        while x_inc ==x_difference
            x_inc= input('Insert an increment in x that will be plotted in the graph (must be less than the difference between x_max and x_min) : ');
        end
        %lambda is the scale factor which will be altered.
        lambda_min= -1;
        %warning with a while loop for lambda_min
        while lambda_min<0
            lambda_min=input('Insert the minimum value of lambda (must be greater than or equal to 0): ');
        end
        %lambda_max warning and user input
        lambda_max= lambda_min -1;
        while lambda_max <= lambda_min
            lambda_max= input('Insert the maximum value of lambda (must be greater than minimum lambda) : ');
        end
        %value for the difference between the lamdba_max and lambda_min
        lambda_difference= lambda_max-lambda_min;
        lambda_inc= lambda_difference;
        %lambda_inc warning and user input
        while lambda_inc >= lambda_difference
            lambda_inc= input('Insert an increment in lambda that will be plotted in the graph (must be less than the difference between lambda_max and lambda_min) : ');
        end
        for lambda =(lambda_min:lambda_inc:lambda_max)
            
            
            x_axis= (x_min:x_inc/100:x_max);
            %f is Erlang distribution , k is shape factor,lambda is scale factor.
            %numerator= @(lambda,k,x_axis) ((lambda^k)*(x_axis^(k-1))*exp(-1*lambda*x_axis))
            
            first_term= lambda^k;
            second_term= x_axis.^(k-1);
            third_term= exp((-1)*lambda.*x_axis);
            denominator=1;
            for i=1:1:k-1
                denominator=denominator*i;
            end
            
            y_axis=first_term.*second_term.*third_term./denominator;
            hold on
            plot (x_axis,y_axis)
            
            lambda= lambda+ lambda_inc;
        end
        hold off
        %case 2 for fixed scale but varying shape perimeter
    case 2
        %case 2 so fixed lambda
        lambda=0;
        %lambda warning
        while lambda<0
            lambda=input('Insert the fixed value of scale factor lambda (must be greater than or equal to 0): ');
        end
        %x_min warning ( must be greater than or equal to 0
        x_min=-1;
        while x_min < 0
            x_min= input('Insert the minimum value of x {must be greater than or equal to 0}: ');
        end
        %x_max warning (must be greater than x_min)
        x_max = x_min -1;
        while x_max <= x_min
            x_max= input('Insert the maximum value of x (must be greater than x minimum): ');
        end
        %value for the difference between the x_max and x_min is set
        x_difference= x_max- x_min;
        %x_inc warning and user input
        x_inc= x_difference;
        while x_inc ==x_difference
            x_inc= input('Insert an increment in x that will be plotted in the graph (must be less than the difference between x_max and x_min) : ');
        end
        %k is the shape factor which will be altered.
        k_min= -1;
        %warning with a while loop for k_min
        while k_min<1
            k_min=input('Insert the minimum value of k (must be greater than or equal to 1): ');
        end
        %k_max warning and user input
        k_max= k_min -1;
        while k_max <= k_min
            k_max= input('Insert the maximum value of lambda (must be greater than minimum lambda) : ');
        end
        %value for the difference between the k_max and k_min
        k_difference= k_max-k_min;
        k_inc= k_difference;
        %k_inc warning and user input
        while k_inc >= k_difference
            k_inc= input('Insert an increment in k that will be plotted in the graph (must be less than the difference between lambda_max and lambda_min) : ');
        end
        for k =(k_min:k_inc:k_max)
            
            
            x_axis= (x_min:x_inc/100:x_max);
            %f is Erlang distribution , k is shape factor,lambda is scale factor.
            %numerator= @(lambda,k,x_axis) ((lambda^k)*(x_axis^(k-1))*exp(-1*lambda*x_axis))
            
            first_term= lambda^k;
            second_term= x_axis.^(k-1);
            third_term= exp((-1)*lambda.*x_axis);
            denominator=1;
            for i=1:1:k-1
                denominator=denominator*i;
            end
            
            y_axis=first_term.*second_term.*third_term./denominator;
            hold on
            plot (x_axis,y_axis)
            
            k= k+ k_inc;
        end
        hold off
        
end

