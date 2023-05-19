# 🖥️ Atividade do Programa de Bolsas da Compass.UOL 

<div align="center">
  <img src="/src/logo-compass.png" width="350px">
</div>

## Requisitos AWS:
- Gerar uma chave pública para acesso ao ambiente;
- Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Família t3.small,
16 GB SSD);
- Gerar 1 elastic IP e anexar à instância EC2;
- Liberar as portas de comunicação para acesso público: (22/TCP, 111/TCP e UDP,
2049/TCP/UDP, 80/TCP, 443/TCP).

## Requisitos no Linux:
- Configurar o NFS entregue;
- Criar um diretorio dentro do filesystem do NFS com seu nome;
- Subir um apache no servidor - o apache deve estar online e rodando;
- Criar um script que valide se o serviço esta online e envie o resultado da validação
para o seu diretorio no nfs;
- O script deve conter - Data HORA + nome do serviço + Status + mensagem
personalizada de ONLINE ou offline;
- O script deve gerar 2 arquivos de saida: 1 para o serviço online e 1 para o serviço
OFFLINE;
- Preparar a execução automatizada do script a cada 5 minutos.

##

### Antes de executar a criação da instância EC2 podemos criar usuários com suas permissões também especificadas para maior segurança dentro da AWS e também boas práticas, assim o usuário terá acesso somente ao que foi definido para ele.
  #### Nessa instrução iremos criar um usuário com acesso ao AWS CLI

##

1. Selecione o serviço de IAM (Identity and Access Management) dentro do console AWS e no menu esquerdo lateral vá em Access Management > Users, na tela de users vá no botão "Add Users" em azul.

<div align="center">
<img src="/src/print-AMI1.jpg" width="950px">
</div>

2. Escolha o nome do usuário e vá no botão "Next". Na tela seguinte clique novamente no botão "Next e na próxima dela em "Create user".

<div align="center">
<img src="/src/print-AMI2.jpg" width="950px">
</div>

3. Com o usuário criado, o selecione na lista de Users clicando sobre o nome. Abrirá o sumário do usuário, onde ficam todas as informações sobre ele. Aqui clique em "Security credentials" e no botão "Create access key" na sessão "Access Keys".

<div align="center">
<img src="/src/print-AMI3.1.jpg" width="950px">
                                             
<img src="/src/print-AMI3.2.jpg" width="950px">
</div>
  
Na tela seguinte escolha a opção "Command Line Interface (CLI)", onde será criado o acesso ao CLI para aquele usuário. Vá em "Next" e, se desejar, descreva a chave de acesso, e clique em "Create access key".

<div align="center">
<img src="/src/print-AMI4.1.jpg" width="950px">

<img src="/src/print-AMI4.2.jpg" width="950px">
</div> 

4. Abrirá uma tela com as informações da chave de acesso, serão elas: a própria Access Key e a Secret access key. São duas informações cruciais para o acesso via AWS CLI, então você deve ir no botão "Download .csv file" onde estará armazenado essas duas chaves de acesso. **É de grande importância que esse Download seja feito**, pois a Secret access key não poderá ser acessada novamente. 
Após o Download, salve o arquivo '.csv' em um local seguro e vá no botão "Done".

<div align="center">
<img src="/src/print-AMI5.jpg" width="950px">
</div>

-----
