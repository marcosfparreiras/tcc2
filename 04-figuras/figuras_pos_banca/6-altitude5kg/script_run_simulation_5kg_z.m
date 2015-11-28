control_z5 = importdata('control_z5.dat');
z5 = importdata('z5.dat');
zdot5 = importdata('zdot5.dat');

close all;
% Plota gráficos dos scopes do simulink

var = z5;
vardot = zdot5;

var(:,2)=var(:,2)-2; % altura inicial de dois metros
var(:,3)=var(:,3)-2; % altura inicial de dois metros

%------------------ Plota z e zdot ------------------------

figure('Name','Reposta de z e zdot no sistema com m=5kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
% suptitle('Resposta da posição vertical (z)')
subplot(2,1,1);
plot(var(:,1),var(:,2),'k-'); grid;
hold on;
plot(var(:,1),var(:,3),'k--');
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','southeast');
set(sub,'Interpreter','latex')
ylabel('z (m)','interpreter','latex');
xlabel('Tempo (s)');


% suptitle('Resposta da posição vertical (z)')
subplot(2,1,2);
plot(vardot(:,1),vardot(:,2),'k-'); grid;
hold on;
plot(vardot(:,1),vardot(:,3),'k--');
ylim([-3 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','northeast');
set(sub,'Interpreter','latex')
ylabel('$\dot{z}$ (m/s)','interpreter','latex');
xlabel('Tempo (s)');


%------------------ Plota z e zdot em detalhes ------------------------

figure('Name','Reposta de z e zdot no sistema com m=5kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
% suptitle('Resposta da posição vertical (z)')
subplot(2,1,1);
plot(var(:,1),var(:,2),'k-'); grid;
hold on;
plot(var(:,1),var(:,3),'k--');
xlim([0 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','southeast');
set(sub,'Interpreter','latex')
ylabel('z (m)','interpreter','latex');
xlabel('Tempo (s)');


% suptitle('Resposta da posição vertical (z)')
subplot(2,1,2);
plot(vardot(:,1),vardot(:,2),'k-'); grid;
hold on;
plot(vardot(:,1),vardot(:,3),'k--');
xlim([0 3])
ylim([-3 3])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','northeast');
set(sub,'Interpreter','latex')
ylabel('$\dot{z}$ (m/s)','interpreter','latex');
xlabel('Tempo (s)');



% ---------------------------- Controler z ----------------------------

var = control_z5;
var(:,2)=var(:,2)-12; % altura inicial de dois metros
var(:,3)=var(:,3)-12; % altura inicial de dois metros

figure('Name','Reposta do controlador de z no sistema com m=5kg controlados por Fuzzy e Neuro-Fuzzy','NumberTitle','off')
% suptitle('Resposta do angulo theta')
%subplot(2,1,1);
plot(var(:,1),var(:,2),'k-'); grid;
hold on;
plot(var(:,1),var(:,3),'k--');
xlim([0 1])
ylim([-85 0])
sub = legend('Controlador Fuzzy', 'Conrolador Neuro-Fuzzy','location','southeast');
set(sub,'Interpreter','latex')
ylabel('sinal de controle para z ($m/s^{2}$)','interpreter','latex');
xlabel('Tempo (s)');

