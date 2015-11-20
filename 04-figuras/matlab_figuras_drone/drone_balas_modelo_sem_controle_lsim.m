close all;		% Fecha todas as figuras abertas
% Definição de parâmetros
m=2.353598;
g=9.81;
Ix=0.1676;
Iy=0.1686;
Iz=0.29743;
l=0.5;
% Definição do estado inicial do posicionamento do quadrotor
phi=0;
theta=0;
psi=0;
u1=m*g;
% Definição da representação no espaço de estados
Amoving=[0 0 0 1 0 0 0 0 0 0 0 0 ; 
    	0 0 0 0 1 0 0 0 0 0 0 0 ; 
    	0 0 0 0 0 1 0 0 0 0 0 0 ;
		0 0 0 0 0 0 0 -u1/m 0 0 0 0 ; 
		0 0 0 0 0 0 u1/m 0 0 0 0 0 ; 
		0 0 0 0 0 0 0 0 0 0 0 0 ;
		0 0 0 0 0 0 0 0 0 1 0 0 ; 
		0 0 0 0 0 0 0 0 0 0 1 0 ;
		0 0 0 0 0 0 0 0 0 0 0 1 ;
		0 0 0 0 0 0 0 0 0 0 0 0 ; 
		0 0 0 0 0 0 0 0 0 0 0 0 ;
		0 0 0 0 0 0 0 0 0 0 0 0 ];
    
  Bmoving=[0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		-1/m 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 cos(psi)/Ix -sin(psi)/Iy 0 ; 
		0 sin(psi)/(cos(phi)*Ix) cos(psi)/(cos(phi)*Iy) 0 ; 
		0 sin(psi)*tan(phi)/Ix cos(psi)*tan(phi)/Iy 1/Iz ];
   
Cmoving=[1 0 0 0 0 0 0 0 0 0 0 0 ; 
		0 1 0 0 0 0 0 0 0 0 0 0 ; 
		0 0 1 0 0 0 0 0 0 0 0 0 ; 
		0 0 0 1 0 0 0 0 0 0 0 0 ; 
		0 0 0 0 1 0 0 0 0 0 0 0 ; 
		0 0 0 0 0 1 0 0 0 0 0 0 ; 
		0 0 0 0 0 0 1 0 0 0 0 0 ; 
		0 0 0 0 0 0 0 1 0 0 0 0 ; 
		0 0 0 0 0 0 0 0 1 0 0 0 ; 
		0 0 0 0 0 0 0 0 0 1 0 0 ; 
		0 0 0 0 0 0 0 0 0 0 1 0 ; 
		0 0 0 0 0 0 0 0 0 0 0 1 ];

Dmoving=[0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ;
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ; 
		0 0 0 0 ];
    
Bmoving=Bmoving*[1 0 0 0 ; 
		0 cos(psi) sin(psi)*cos(phi)*Ix/Iy 0 ; 
		0 -sin(psi)*Iy/Ix cos(psi)*cos(phi) 0 ; 
		0 0 -sin(phi)*Iz/Iy 1];

% Gera sistema 
Smoving=tf(ss(Amoving,Bmoving,Cmoving,Dmoving));

% Define matrizes a serem usadas pelo lsim
AA=Amoving;
BB=Bmoving;
CC=Cmoving;
DD=Dmoving;
% Define sinal de degrau unitário aos 10 segundos
u=[zeros(1,10),ones(1,50)];
%Define intervalo de tempo de 0 s a 60 s
t=1:1:60;

% Gera gráficos de resposta a u1 - saídas 3 e 6
h = lsim(ss(AA,BB(:,1),[CC(3,:);CC(6,:)],DD(3,1)),u,0:1:length(u)-1, 'k')

clear title xlabel ylabel
figure('Name','Entrada 1, saídas 3 e 6','NumberTitle','off')
suptitle('Resposta à entrada u_{1}')
% plot para z
subplot(2,1,1);
plot(t,h(:,1),'k-'); grid;
ylabel('z(m)','interpreter','latex'); xlabel('Tempo (s)');
legend({'Estado z'},'location','southwest');
% plot para z_ponto
subplot(2,1,2);
plot(t,h(:,2),'k-'); grid;
ylabel('$\dot{z}$ (m/s)','interpreter','latex'); xlabel('Tempo (s)');
h = legend({'Estado $\dot{z}$'},'location','southwest');
set(h,'Interpreter','latex')

% Gera gráficos de resposta a u2
h = lsim(ss(AA,BB(:,2),[CC(2,:);CC(5,:);CC(7,:);CC(10,:)],DD(1,1)),u,0:1:length(u)-1)

clear title xlabel ylabel
figure('Name','Entrada 2, saídas 2, 5, 7 e 10 ','NumberTitle','off')
suptitle('Resposta à entrada u_{2}')

% plot para y
subplot(2,2,1);
plot(t,h(:,1),'k-'); grid;
ylabel('y(m)','interpreter','latex'); xlabel('Tempo (s)');
legend({'Estado y'},'location','southwest');
% plot para y_ponto
subplot(2,2,2);
plot(t,h(:,2),'k-'); grid;
ylabel('$\dot{y}$ (m/s)','interpreter','latex'); xlabel('Tempo (s)');
sub = legend({'Estado $\dot{y}$'},'location','southwest');
set(sub,'Interpreter','latex')
% plot para phi
subplot(2,2,3);
plot(t,h(:,3),'k-'); grid;
ylabel('$\phi$ (rad)','interpreter','latex'); xlabel('Tempo (s)');
sub = legend({'Estado $\phi$'},'location','southwest');
set(sub,'Interpreter','latex')
% plot para phi_ponto
subplot(2,2,4);
plot(t,h(:,4),'k-'); grid;
ylabel('$\dot{\phi}$ (rad/s)','interpreter','latex'); xlabel('Tempo (s)');
sub = legend({'Estado $\dot{\phi}$'},'location','southwest');
set(sub,'Interpreter','latex')

% Gera gráficos de resposta a u3 - saídas 1, 4, 8 e 11
h = lsim(ss(AA,BB(:,3),[CC(1,:);CC(4,:);CC(8,:);CC(11,:)],DD(1,1)),u,0:1:length(u)-1)

clear title xlabel ylabel
figure('Name','Entrada 3, saídas 1, 4, 8 e 11 ','NumberTitle','off')
suptitle('Resposta à entrada u_{3}')

% plot para x
subplot(2,2,1);
plot(t,h(:,1),'k-'); grid;
ylabel('x(m)','interpreter','latex'); xlabel('Tempo (s)');
legend({'Estado x'},'location','southwest');
% plot para x_ponto
subplot(2,2,2);
plot(t,h(:,2),'k-'); grid;
ylabel('$\dot{x}$ (m/s)','interpreter','latex'); xlabel('Tempo (s)');
sub = legend({'Estado $\dot{x}$'},'location','southwest');
set(sub,'Interpreter','latex')
% plot para theta
subplot(2,2,3);
plot(t,h(:,3),'k-'); grid;
ylabel('$\theta$ (rad)','interpreter','latex'); xlabel('Tempo (s)');
sub = legend({'Estado $\theta$'},'location','southwest');
set(sub,'Interpreter','latex')
% plot para phi_ponto
subplot(2,2,4);
plot(t,h(:,4),'k-'); grid;
ylabel('$\dot{\theta}$ (rad/s)','interpreter','latex'); xlabel('Tempo (s)');
sub = legend({'Estado $\dot{\theta}$'},'location','southwest');
set(sub,'Interpreter','latex')

% Gera gráficos de resposta a u4 - saídas 9 e 12
h = lsim(ss(AA,BB(:,4),[CC(9,:);CC(12,:)],DD(1,1)),u,0:1:length(u)-1)

clear title xlabel ylabel
figure('Name','Entrada 4, saídas 9 e 12','NumberTitle','off')
suptitle('Resposta à entrada u_{4}')

% plot para psi
subplot(2,1,1);
plot(t,h(:,1),'k-'); grid;
ylabel('$\psi$ (rad)','interpreter','latex'); xlabel('Tempo (s)');
sub = legend({'Estado $\psi$'},'location','southwest');
set(sub,'Interpreter','latex')
% plot para psi_ponto
subplot(2,1,2);
plot(t,h(:,2),'k-'); grid;
ylabel('$\dot{\psi}$ (rad/s)','interpreter','latex'); xlabel('Tempo (s)');
sub = legend({'Estado $\dot{\psi}$'},'location','southwest');
set(sub,'Interpreter','latex')
