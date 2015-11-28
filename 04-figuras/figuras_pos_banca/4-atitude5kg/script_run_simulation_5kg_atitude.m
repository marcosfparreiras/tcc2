control_phi5 = importdata('control_phi5.dat');
control_theta5 = importdata('control_theta5.dat');
phi5 = importdata('phi5.dat');
phidot5 = importdata('phidot5.dat');
theta5 = importdata('theta5.dat');
thetadot5  = importdata('thetadot5.dat');
% Plota gráficos dos scopes do simulink
close all;

% Plota gráficos dos scopes do simulink
var = phi5;
vardot = phidot5;

figure('Name','Reposta de phi e phidot no sistema com m=5kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
% suptitle('Resposta do angulo phi')
subplot(2,1,1);
plot(var(:,1),var(:,2),'k-'); grid;
hold on;
plot(var(:,1),var(:,3),'k--');
% xlim([0 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','northeast');
set(sub,'Interpreter','latex')
ylabel('$\phi$ (rad)','interpreter','latex');
xlabel('Tempo (s)');

% suptitle('Resposta da variacao do angulo phi)')
subplot(2,1,2);
plot(vardot(:,1),vardot(:,2),'k-'); grid;
hold on;
plot(vardot(:,1),vardot(:,3),'k--');
% xlim([0 3])
% ylim([-3 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','northeast');
set(sub,'Interpreter','latex')
ylabel('$\dot{\phi}$ (rad/s)','interpreter','latex');
xlabel('Tempo (s)');



figure('Name','Reposta em detalhes de phi e phidot no sistema com m=5kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
% suptitle('Resposta do angulo phi')
subplot(2,1,1);
plot(var(:,1),var(:,2),'k-'); grid;
hold on;
plot(var(:,1),var(:,3),'k--');
xlim([0 10])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','northeast');
set(sub,'Interpreter','latex')
ylabel('$\phi$ (rad)','interpreter','latex');
xlabel('Tempo (s)');

% suptitle('Resposta da variacao do angulo phi)')
subplot(2,1,2);
plot(vardot(:,1),vardot(:,2),'k-'); grid;
hold on;
plot(vardot(:,1),vardot(:,3),'k--');
xlim([0 10])
% ylim([-3 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','northeast');
set(sub,'Interpreter','latex')
ylabel('$\dot{\phi}$ (rad/s)','interpreter','latex');
xlabel('Tempo (s)');





%------------------------- THETA -------------------------

var = theta5;
vardot = thetadot5;

figure('Name','Reposta de theta e thetadot no sistema com m=5kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
% suptitle('Resposta do angulo theta')
subplot(2,1,1);
plot(var(:,1),var(:,2),'k-'); grid;
hold on;
plot(var(:,1),var(:,3),'k--');
% xlim([0 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','northeast');
set(sub,'Interpreter','latex')
ylabel('$\theta$ (rad)','interpreter','latex');
xlabel('Tempo (s)');

% suptitle('Resposta da variacao do angulo theta)')
subplot(2,1,2);
plot(vardot(:,1),vardot(:,2),'k-'); grid;
hold on;
plot(vardot(:,1),vardot(:,3),'k--');
% xlim([0 3])
% ylim([-3 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','northeast');
set(sub,'Interpreter','latex')
ylabel('$\dot{\theta}$ (rad/s)','interpreter','latex');
xlabel('Tempo (s)');




figure('Name','Reposta em detalhes de theta e thetadot no sistema com m=5kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
% suptitle('Resposta do angulo theta')
subplot(2,1,1);
plot(var(:,1),var(:,2),'k-'); grid;
hold on;
plot(var(:,1),var(:,3),'k--');
xlim([0 10])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','northeast');
set(sub,'Interpreter','latex')
ylabel('$\theta$ (rad)','interpreter','latex');
xlabel('Tempo (s)');

% suptitle('Resposta da variacao do angulo theta)')
subplot(2,1,2);
plot(vardot(:,1),vardot(:,2),'k-'); grid;
hold on;
plot(vardot(:,1),vardot(:,3),'k--');
xlim([0 10])
% ylim([-3 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','northeast');
set(sub,'Interpreter','latex')
ylabel('$\dot{\theta}$ (rad/s)','interpreter','latex');
xlabel('Tempo (s)');


% ---------------------------- Controler Phi ----------------------------

var = control_phi5;

figure('Name','Reposta do controlador de phi no sistema com m=5kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
% suptitle('Resposta do angulo theta')
%subplot(2,1,1);
plot(var(:,1),var(:,2),'k-'); grid;
hold on;
plot(var(:,1),var(:,3),'k--');
xlim([0 4])
% xlim([0 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','southeast');
set(sub,'Interpreter','latex')
ylabel('sinal de controle para $\phi$ ($rad/s^{2}$)','interpreter','latex');
xlabel('Tempo (s)');

% ---------------------------- Controler Theta ----------------------------

var = control_theta5;

figure('Name','Reposta do controlador de theta no sistema com m=5kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
% suptitle('Resposta do angulo theta')
%subplot(2,1,1);
plot(var(:,1),var(:,2),'k-'); grid;
hold on;
plot(var(:,1),var(:,3),'k--');
xlim([0 4])
% xlim([0 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','southeast');
set(sub,'Interpreter','latex')
ylabel('sinal de controle para $\theta$ ($rad/s^{2}$)','interpreter','latex');
xlabel('Tempo (s)');

