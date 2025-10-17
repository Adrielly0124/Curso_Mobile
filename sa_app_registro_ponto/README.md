# SA - APP DE REGISTRO DE PONTO
## Relatório de Implementação
### Funcionalidades implementadas

O projeto é um aplicativo de registro de ponto digital, criado em Flutter com integração ao Firebase.
O objetivo é permitir que os colaboradores registrem o horário de entrada e saída de forma prática, com segurança e validação de localização.

As principais funcionalidades implementadas foram:

- Autenticação de usuários:
    O login é feito com NIF e senha, sendo permitido apenas o acesso de usuários com o domínio corporativo @rhconnect.com.br.
    Essa autenticação é feita através do Firebase Authentication, que garante a segurança das credenciais e a persistência do login.
- Registro de ponto com geolocalização:
    Ao clicar em “Registrar Ponto”, o aplicativo captura automaticamente a data, hora, latitude e longitude do dispositivo.
    Em seguida, verifica se o usuário está dentro do raio de 100 metros do local de trabalho, utilizando o pacote geolocator.
    Caso a localização esteja válida, o registro é salvo no Firestore com os dados correspondentes.
- Histórico de pontos:
    Após cada registro, o usuário é redirecionado para a tela de Histórico, onde pode visualizar todos os pontos batidos anteriormente, com suas respectivas datas, horários e localizações.
- Interface simples e intuitiva:
    As telas foram organizadas de forma objetiva: Login, Tela Principal e Histórico de Pontos.
    O design prioriza a clareza, com botões grandes e mensagens de feedback para o usuário.
### Estrutura das telas
 - Tela de login:
    - Entrada de e-mail corporativo (@rhconnect.com.br) e senha.
 - Tela Home:
    - Botão para registrar ponto.
    - Histórico de pontos exibido logo após cada marcação.
 - Tela de Perfil
    - Exibe informações do usuário logado.
    - Opção de logout.

### Decisões de design e estrutura
Desenvolvi o projeto utilizando uma arquitetura organizada em camadas, com as principais pastas:

lib/
  controllers/  (Lógica e comunicação com Firebase);
  models/ (Estruturas de dados (usuário e ponto));
  views/  (Telas do aplicativo (login, home, perfil, histórico));
  main.dart (Inicialização do app e integração Firebase).

Essa separação facilita a manutenção e a leitura do código.
As decisões principais foram:

- Uso do Firebase para autenticação e banco de dados, evitando a necessidade de um backend próprio.
- Geolocalização integrada diretamente na função de registro, garantindo que o ponto só é aceito se o usuário estiver próximo ao local de trabalho.
- Feedback imediato para o usuário com SnackBars e redirecionamento automático para o histórico após o registro.


### API's e integrações
- Firebase Authentication: controla login e senha.
- Firebase Firestore: banco de dados NoSQL usado para armazenar os registros de ponto.
- Geolocator (API de localização):
Responsável por capturar a posição do dispositivo e calcular a distância até o ponto de trabalho que defini.

### Desafios e soluções
- Erros de dependências e versões: Durante a instalação das bibliotecas (firebase_core, cloud_firestore, firebase_auth, geolocator), aconteceram conflitos de versão, fazendo o projeto não compilar.
Para resolver, atualizei o Flutter e alinhei as versões das dependências no pubspec.yaml para versões compatíveis entre si. Após rodar flutter pub get, o projeto voltou a funcionar.
- Captura de localização(Geolocator): No início, o app não conseguia obter a localização do usuário, mesmo com o GPS ligado.
Para resolver, adicionei as permissões de localização no arquivo AndroidManifest.xml e testar novamente no dispositivo físico, já que o emulador nem sempre fornece localização real. Depois disso, o plugin passou a retornar as coordenadas corretamente.

## Documentação de Uso
### Pré-requisitos
- Flutter SDK instalado.
- Android Studio ou VS Code.
- Emulador ou celular para testar.
- Firebase criado (projeto: sa-app-registro-ponto).

### Configurar o FireBase
- Instalar o Firebase CLI
- Logar no Firebase
- Inicializar o projeto
- Escolher Firestore e Authentication.
- Usar o projeto sa-app-registro-ponto.

## Como rodar o app
- Primeiramente, deve-se rodar no terminal Flutter run
- Depois, abrir o app e fazer login com um email válido(no caso, o corporativo (@rhconnect.com.br))
- Na tela principal, clicar em “Registrar Ponto”.
    - O app pedirá permissão de localização.
    - Ao confirmar, o ponto será registrado no Firebase.
- Após o registro, o usuário é redirecionado automaticamente para o histórico, onde pode visualizar todos os registros anteriores. -> Ainda não feito

## Observações

- É preciso ativar GPS no celular para registrar o ponto.
- O app funciona offline, mas a validação da distância só funciona quando há internet e GPS ativo.