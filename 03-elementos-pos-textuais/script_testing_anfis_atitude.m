% lê arquivo fis referente ao controle de atitude
fismat = readfis('fis_atitude.fis'); 

% define número de casos a serem avaliados (treinamento + teste)
n = 300;
% define conjunto de n entradas aleatórias para o sistema fuzzy
% - respeitando o range de cada entrada
input = zeros(n,2);
for i=1:n
    phi_value = rand * 4 - 2;
    phi_dot_value = rand * 3 - 1.5;
    input(i,:) = [ phi_value phi_dot_value ];
end

% avalia resposta fuzzy para cada entrada
output= evalfis(input,fismat);

% define data como vetor relacionando cada conjunto de entradas à saída
% - obtida pelo sistema fuzzy
data = [];
for i=1:n
   data(i,:) = [ input(i,:) output(i) ];
end

% define que 2/3 dos dados obtidos serão usasdos para treinamento
% - e 1/3 será usado para teste da rede
train = data(1:2*n/3,:);    % dados para treinamento
test = data(2*n/3+1:n,:);   % dados para validação do sistema treinado

% gera modelo fuzzy Sugeno a partir do Mamdani modelado
sugFIS = mam2sug(fismat);
% salva modelo Sugeno em disco com o nome fis_atitude_neuro.fis
writefis(sugFIS, 'fis_atitude_neuro.fis');
