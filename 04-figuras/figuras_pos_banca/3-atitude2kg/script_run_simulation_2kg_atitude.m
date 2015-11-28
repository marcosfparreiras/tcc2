control_phi2 = importdata('control_phi2.dat');
control_theta2 = importdata('control_theta2.dat');
phi2 = importdata('phi2.dat');
phidot2 = importdata('phidot2.dat');
theta2 = importdata('theta2.dat');
thetadot2  = importdata('thetadot2.dat');
% Plota gráficos dos scopes do simulink
close all;

var = phi2;
vardot = phidot2;

figure('Name','Reposta de phi e phidot no sistema com m=2kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
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




figure('Name','Reposta em detalhes de phi e phidot no sistema com m=2kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
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


% ---------------------------- Theta ----------------------------

var = theta2;
vardot = thetadot2;

figure('Name','Reposta de theta e thetadot no sistema com m=2kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
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




figure('Name','Reposta em detalhes de theta e thetadot no sistema com m=2kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
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

var = control_phi2;

figure('Name','Reposta do controlador de phi no sistema com m=2kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
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

var = control_theta2;

figure('Name','Reposta do controlador de theta no sistema com m=2kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
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


