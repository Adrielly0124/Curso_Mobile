# sa_app_registro_ponto
## Relatório de Implementação
### Funcionalidades implementadas

O aplicativo permite que funcionários registrem seu ponto de forma digital, com algumas regras de segurança:

- Login com NIF e senha.

- Só usuários com e-mail @rhconnect.com.br podem entrar.

- Registro de ponto com data, hora e localização (GPS).

- Verificação de proximidade: o registro só é permitido se o usuário estiver até 100 metros do local de trabalho.

- Armazenamento dos registros no Firebase Firestore.

### Decisões de design 
- O app foi feito em Flutter, para funcionar em Android e iOS.

- O layout é simples: login, tela principal e botão para registrar ponto.

- A autenticação e os dados ficam seguros usando Firebase.

### API's e integrações
- Firebase Authentication: controla login e senha.

- Firebase Firestore: guarda os registros.

- Geolocalização: verifica a distância do ponto de trabalho usando GPS do celular.

### Desafios e soluções
- GPS: definir os 100 metros do local de trabalho
- Email: filtrar para aceitar so o email corporativo
- Conexão com o firebase

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
- rodar no terminal Flutter run
Usar o login com NIF e senha (@rhconnect.com.br).

- Registrar ponto usando o botão na tela principal.

- O registro será salvo no Firebase com data, hora e localização.

## Observações

- É preciso ativar GPS no celular para registrar o ponto.

- O app funciona offline, mas a validação da distância só funciona quando há internet e GPS ativo.