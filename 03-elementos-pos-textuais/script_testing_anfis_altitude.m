% l� arquivo fis referente ao controle de altitude
fismat = readfis('fis_altitude.fis');

% define n�mero de casos a serem avaliados (treinamento + teste)
n = 300;
% define conjunto de n entradas aleat�rias para o sistema fuzzy
% - respeitando o range de cada entrada
input = zeros(n,2);
for i=1:n    
    z_value = rand * 2 - 1;
    z_dot_value = rand * 10 - 5;
    input(i,:) = [ z_value z_dot_value ];
end

% avalia resposta fuzzy para cada entrada
output= evalfis(input,fismat);

% define data como vetor relacionando cada conjunto de entradas � sa�da
% - obtida pelo sistema fuzzy
data = [];
for i=1:n
   data(i,:) = [ input(i,:) output(i) ];
end

% define que 2/3 dos dados obtidos ser�o usasdos para treinamento
% - e 1/3 ser� usado para teste da rede
train = data(1:2*n/3,:);    % dados para treinamento
test = data(2*n/3+1:n,:);   % dados para valida��o do sistema treinado

% gera modelo fuzzy Sugeno a partir do Mamdani modelado
sugFIS = mam2sug(fismat);
% salva modelo Sugeno em disco com o nome fis_altitude_neuro.fis
writefis(sugFIS, 'fis_altitude_neuro.fis');
