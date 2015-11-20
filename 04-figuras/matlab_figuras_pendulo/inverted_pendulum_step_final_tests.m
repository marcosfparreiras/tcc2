close all;
% x1 = teta; x2 = teta_ponto; x3 = x; x4 = x_ponto

% Representação no espaço de estados para o sistema de pêndulo invertido
% sem nenhum sistema de controle
A = [0 1 0 0; 20.601 0 0 0; 0 0 0 1; -0.4905 0 0 0];
B = [0; -1; 0; 0.5];
C = [0 0 1 0];
D = [0];

% Representação no espaço de estados para o sistema de pêndulo invertido
% com sitema de controle
KI = -50.9684;
AA = [A - B*K B*KI;-C 0];
BB = [0;0;0;0;1];
CC = [C 0];
DD = [0];

%Definição de tempo de amostragem
t = 0:0.02:6;

% Gráficos para análise do sistema do pêndulo invertido sem 
%controle implementado
sys_uncontrolled = ss(A,B,C,D);
step(sys_uncontrolled, t);
title('x versus t')
xlabel('t (s)');
ylabel('x (m)');
grid;

[y,t,x] = step(sys_uncontrolled,t);
x1 = [1 0 0 0]*x';
x2 = [0 1 0 0]*x';
x3 = [0 0 1 0]*x';
x4 = [0 0 0 1]*x';

figure;
subplot(2,2,1); plot(t,x1); grid
title('$\theta$ versus t','interpreter','latex')
xlabel('t (s)'); ylabel('\theta (rad)')

subplot(2,2,2); plot(t,x2); grid
title('$\dot{\theta}$ versus t','interpreter','latex')
xlabel('t (s)'); ylabel('$\dot{\theta}$ (rad/s)','interpreter','latex')

subplot(2,2,3); plot(t,x3); grid
title('x versus t','interpreter','latex')
xlabel('t (s)'); ylabel('x (m)')

subplot(2,2,4); plot(t,x4); grid
title('$\dot{x}$ versus ','interpreter','latex')
xlabel('t (s)'); ylabel('$\dot{x}$ (m/s)','interpreter','latex')

% Gráficos para análise do sistema do pêndulo invertido com 
% controle implementado
figure;
sys_controlled = ss(AA,BB,CC,DD);
step(sys_controlled, t);
title('x versus t')
xlabel('t (s)');
ylabel('x (m)');
grid;

[y,t,x] = step(sys_controlled,t);
x1 = [1 0 0 0 0]*x';
x2 = [0 1 0 0 0]*x';
x3 = [0 0 1 0 0]*x';
x4 = [0 0 0 1 0]*x';

figure;
subplot(2,2,1); plot(t,x1); grid
title('$\theta$ versus t','interpreter','latex')
xlabel('t (s)'); ylabel('\theta (rad)')

subplot(2,2,2); plot(t,x2); grid
title('$\dot{\theta}$ versus t','interpreter','latex')
xlabel('t (s)'); ylabel('$\dot{\theta}$ (rad/s)','interpreter','latex')

subplot(2,2,3); plot(t,x3); grid
title('x versus t','interpreter','latex')
xlabel('t (s)'); ylabel('x (m)')

subplot(2,2,4); plot(t,x4); grid
title('$\dot{x}$ versus ','interpreter','latex')
xlabel('t (s)'); ylabel('$\dot{x}$ (m/s)','interpreter','latex')



