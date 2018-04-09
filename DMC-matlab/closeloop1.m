
%  �ջ����ƣ� ������ �������������� Kp =1 
%
%

T0_gp=20  ;	
k0_gp =10;
Ts = 2;

h_gp = T0_gp / 50;			% ���ض��� ���� ʱ�䲽��
a_gp = exp(-h_gp / T0_gp); b_gp = k0_gp*(1-a_gp);

uk = 0 ;
yk = 0;
ysp = 1;

dk = 0;

it = 0;
itEnd = 200;
while (it < itEnd)
	it = it + 1;
	
	if( 50<it && it<70)     dk = 5;		% �����ʩ���Ŷ������� dk = 0 
    else                    dk = 0;
	end

    ydk = 0; % dk;
	
	
	% ���ض������
	yk = a_gp * yk + b_gp * uk ;
	
	yksum = yk + ydk;
    
    
    error = ysp - yksum;
    uk = error;
    
    y_d(it) = ydk;  
    
    u_mv(it) = uk;
    y_pv(it) = yk;    
    y_sum(it) = yksum;		% y_sum = ���ض������� y_pv + �Ŷ����ڵ���� ydk
    
end

figure();
t_time = h_gp : h_gp :  itEnd*h_gp;

subplot(211);
plot( t_time, y_pv, 'r', t_time, y_sum, 'b') ;
subplot(212);
plot(t_time, u_mv, 'r');



    