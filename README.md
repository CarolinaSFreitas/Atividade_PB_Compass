# 🖥️ Atividade do PB da Compass.UOL 

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

5. Após o Download, salve o arquivo '.csv' em um local seguro e vá no botão "Done".

<div align="center">
<img src="/src/print-AMI5.jpg" width="950px">
</div>

-----

## Criando a instância EC2 

+ Selecione o serviço de EC2 no console AWS e vá em "Instances" no menu lateral esquerdo. Na janela que será aberta vá no botão "Launch instances".

<div align="center">
<img src="/src/print-EC21.jpg" width="950px">
</div>

Com a janela de criação de instâncias EC2 aberta, comece a preencher os campos com os requisitos.

<div align="center">
<img src="/src/print-EC21.1.jpg" width="950px">
</div>

+ No campo "Name" digite o nome da sua EC2.

+ Em "Application and OS Images (Amazon Machine Image)" busque pela AMI "Amazon Linux 2". Abrirá uma janela com o resultado da sua pesquisa, então escolha a correta clicando no botão "Select".

<div align="center">
<img src="/src/print-EC23.1.jpg" width="550px">
</div>

+ No campo "Instance type" escolha a família da máquina que rodará a sua EC2, a "t3.small".

<div align="center">
<img src="/src/print-EC23.2.jpg" width="550px">
</div>

+ Em "Key pair(login)" escolha o par de chaves que dará acesso a sua instância EC2. Se não tiver um par de chaves já criado, clique em "Create key pair".
Na tela que se abrirá digite o nome do seu par de chaves, seguido do tipo - RSA - e o formato da chave privada como ".pem".

<div align="center">
<img src="/src/print-EC24.jpg" width="550px">
</div>

Será gerado o arquivo ".pem" com a sua chave privada, **guarde-o em segurança, pois é o que dá acesso à sua instância EC2**.

+ Em "Network settings" você pode selecionar um Security group já criado ou criar um, seguindo os seguintes passos:
	1. Escolha o nome do seu Security group e descreva para que ele servirá.
	2. Em "Inbound security groups rules" você aplica as regras de acesso às portas de comunicação desejadas. Nesse caso, escolheremos as seguintes regras:

##
| Type         | Protocol | Port Range | Source Type | Source      |
|--------------|----------|------------|-------------|-------------|
| SSH          | TCP      | 22         | Anywhere    | 0.0.0.0/0   |
| Custom TCP   | TCP      | 111        | Anywhere    | 0.0.0.0/0   |
| Custom UDP   | UDP      | 111        | Anywhere    | 0.0.0.0/0   |
| Custom TCP   | TCP      | 2049       | Anywhere    | 0.0.0.0/0   |
| Custom UDP   | UDP      | 2049       | Anywhere    | 0.0.0.0/0   |
| Custom TCP   | TCP      | 80         | Anywhere    | 0.0.0.0/0   |
| Custom TCP   | TCP      | 443        | Anywhere    | 0.0.0.0/0   |
##

<div align="center">
<img src="/src/print-rule1.jpg" width="450px">
</div>
<div align="center">
<img src="/src/print-rule2.jpg" width="450px">
</div>
<div align="center">
<img src="/src/print-rule3.jpg" width="450px">
</div>
<div align="center">
<img src="/src/print-rule4.jpg" width="450px">
</div>
<div align="center">
<img src="/src/print-rule5.jpg" width="450px">
</div>
<div align="center">
<img src="/src/print-rule6.jpg" width="450px">
</div>
<div align="center">
<img src="/src/print-rule7.jpg" width="450px">
</div>

+ Em "Configure storage" defina o volume do armazenamento e o tipo de disco. Nesse caso, usaremos  16GB e gp2 (General purpose SSD).

<div align="center">
<img src="/src/print-volume.jpg" width="550px">
</div>

+ Com tudo isso feito, vá no botão "Launch instance" abaixo do sumário da sua instância em criação (onde você pode conferir as configurações feitas por você de forma mais resumida) para criar a sua instância.

<div align="center">
<img src="/src/print-summary.jpg" width="245px">
</div>

- Agora que sua instância foi criada, volte em "Instances" no painel lateral esquerdo para conferir o status da sua EC2.

<div align="center">
<img src="/src/print-ec2iniciando.jpg" width="950px">
</div>

- Pode ser que demore alguns segundos/minutos para que sua instância EC2 esteja 100% pronta para uso, então atualize em seguida (no botão de seta ao lado do botão "Connect") até que apareça "Running" abaixo de "Instance state" e "2/2 checks passed" abaixo de "Status check".

<div align="center">
<img src="/src/print-ec2pronta.jpg" width="950px">
</div>

-----

## Gerando e anexando 1 elastic IP à instância EC2
1. Dentro do menu lateral esquerdo no serviço de EC2 vá em "Elastic IPs".
Ali clique em "Allocate Elastic IP address" para gerar o seu Elastic IP. 

<div align="center">
<img src="/src/print-elastic-ip1.jpg" width="850px">
</div>

Escolha a região desejada, adicione tags se quiser e clique no botão de "Allocate"

<div align="center">
<img src="/src/print-elastic-ip2.jpg" width="850px">
</div>

2. Agora que você gerou um Elastic IP, devemos anexar à sua EC2 criada anteriormente. 
Ainda em "Elastic IPs" selecione o Elastic IP gerado, vá no botão "Actions" e em "Associate Elastic IP address".

<div align="center">
<img src="/src/print-elastic-ip3.jpg" width="850px">
</div>

Na aba que foi aberta, devemos selecionar "Instance", e no campo "Choose an instance" de Instance escolha a instância que criamos. 

<div align="center">
<img src="/src/print-elastic-ip4.jpg" width="850px">
</div>

Em "Private IP address", escolha o seu endereço de IP que será associado ao Elastic IP

<div align="center">
<img src="/src/print-elastic-ip5.jpg" width="850px">
</div>

Com essas informações configuradas, vá em "Associate". 

-----

## Gerando uma chave pública para acesso ao ambiente

Para gerar uma chave pública no Linux basta usar a linha de comando:
	"ssh-keygen -y -f /caminho/para/sua-chave-privada.pem > chave-publica.pub"

1. No Windows, abra o programa PuttyGen. Vá em "Load" e carregue o seu arquivo ".pem" do seu Key Pair que está vinculado à sua instância EC2.

<div align="center">
	<img src="/src/puttygen-1.jpg" width="450px">
</div>

2. Clique primeiro no botão "Save public key" para gerar a sua chave pública. Será criado um arquivo com essa chave, salve no local desejado, ela será o que irá possibilitar o acesso de outras pessoas à sua instância.

3. Clique em "Save private key" e será gerada uma chave em ".ppk", porque ao fazer isso convertemos o arquivo ".pem" em ".ppk" para podermos utilizar via Putty e, assim, executar o acesso na sua instância EC2. Salve no local desejado.

<div align="center">
	<img src="/src/puttygen-2.jpg" width="450px">
</div>

## Como acessar via Putty
1. Abra o programa Putty e no campo "Host Name (or IP address)" cole o IP Público da sua instância EC2. Deixe a porta como 22.

<div align="center">
	<img src="/src/putty-1.jpg" width="450px">
</div>

2. No menu lateral esquerdo do Putty, vá em  "Connection", depois em "SSH", em "Auth" e em "Credentials".
3. No campo "Private key file for authentication:" escolha o caminho do arquivo .ppk da sua chave privada gerada pelo PuttyGen. 
	
<div align="center">
	<img src="/src/putty-2.jpg" width="450px">
</div>

4. Feito isso, vá em "Open" e acesse sua EC2.
	
<div align="center">
	<img src="/src/putty-3.jpg" width="450px">
</div>

### Como configurar a sua conta na AWS CLI após o acesso via Putty

* Execute o comando "aws configure" no terminal
* Informe a AWS Access Key ID
* Informe a AWS Secret Access Key
* A região (ex.: us-east-1)
* O formato da saída (text ou json)

-----

# Dentro do seu ambiente Linux

O Amazon EFS é um serviço de armazenamento de arquivos totalmente gerenciado pela AWS. Ele fornece armazenamento de arquivos altamente disponível e escalável para cargas de trabalho baseadas em nuvem. O EFS é projetado para ser usado com instâncias do Amazon Elastic Compute Cloud (EC2) e permite que várias instâncias acessem simultaneamente o mesmo sistema de arquivos. O EFS tem uma compatibilidade nativa com o protocolo NFS, isso significa que você pode montar sistemas de arquivos EFS em suas instâncias EC2 usando o protocolo NFS, aproveitando as vantagens do armazenamento de arquivos compartilhado e escalável oferecido pelo EFS.

## Como criar um EFS

1. Busque pelo serviço EFS (Elastic File System) dentro do console AWS.

<div align="center">
	<img src="/src/efs-1.jpg" width="950px">
</div>

2. Vá em "Create file system"

3. Escolha o nome do seu EFS (é opcional)

<div align="center">
	<img src="/src/efs-2.jpg" width="650px">
</div>

4. Com seu EFS criado, clique sobre o ID do seu EFS, abaixo do campo "File System ID"
 
<div align="center">
	<img src="/src/efs-3.jpg" width="950px">
</div>

5. Na nova aba aberta, vá na sessão de "Access points" para criar um ponto de acesso à seu EFS. Depois clique no botão "Create access points"
 
<div align="center">
	<img src="/src/efs-4.jpg" width="850px">
</div>

6. Coloque o nome no seu Ponto de acesso (é opcional) e vá no botão "Create access point" no fim da página.

<div align="center">
	<img src="/src/efs-5.jpg" width="650px">
</div>

7. Feito isso, volte para a aba do seu EFS e vá na sessão "Network" onde estão as informações de Security Group. Ali você deve colocar o seu SG criado anteriormente para sua EC2.

<div align="center">
	<img src="/src/efs-6.jpg" width="850px">
</div>

<div align="center">
	<img src="/src/efs-7.jpg" width="850px">
</div>

8. Logado na sua EC2 via Putty, execute os comandos:

		yum -y install amazon-efs-utils
	
		mkdir /mnt/efs
	
<div align="center">
	<img src="/src/efs-8.jpg" width="550px">
</div>

9. Agora que já temos o diretório de montagem criado, devemos executar o comando 'mount' no diretório. Mas antes disso, devemos voltar no serviço EFS no console AWS e copiar o valor do **DNS name do seu EFS**.
 
<div align="center">
	<img src="/src/efs-9.jpg" width="850px">
</div>

   Depois de copiado, devemos executar o seguinte comando na AWS CLI:
   
   	sudo mount -t efs fs-0d87164e862a3b1c3.efs.us-east-1.amazonaws.com /mnt/efs
	
<div align="center">
	<img src="/src/efs-10.jpg" width="750px">
</div>

10. Para criar um diretório dentro do EFS - nesse caso, com o seu nome - basta executar o comando:
	
		sudo mkdir /mnt/efs/SeuNome

<div align="center">
	<img src="/src/efs-11.jpg" width="450px">
</div>

-----

# Como subir o Apache no seu servidor

- Antes de fazermos a instalação do Apache, devemos atualizar os pacotes.
	
		sudo yum update

- Após o update, execute:

		sudo yum install httpd

- Agora que instalamos o Apache, devemos iniciar ele usando o comando:
	
		sudo systemctl start httpd
	
- Para checar se o Apache está realmente ativo, use o comando: 

		 sudo systemctl status httpd

<div align="center">
	<img src="/src/apache1.jpg" width="650px">
</div>

- Para acessar o Apache pelo seu navegador:
 
    * Copie o IP Público da sua EC2

<div align="center">
	<img src="/src/apache3.jpg" width="850px">
</div>

   * Cole o IP Público no seu navegador

<div align="center">
	<img src="/src/apache2.jpg" width="850px">
</div>

-----

## Criando script de validação do Apache que enviará o resultado dessa validação para o diretório EFS que criamos anteriormente com o nosso nome 

* Escolha o caminho onde ficará salvo o seu shell script, nesse caso, eu criarei no '/home/ec2-user/apache_status' e o chamarei de 'check_apache.sh'

<div align="center">
	<img src="/src/script1.jpg" width="550px">
</div>

* Edite o arquivo .sh com seu editor de texto de preferência e insira o seguinte script:

		#!/bin/bash
		
		export TZ=America/Sao_Paulo
		DATE=$(date '+%D-%M-%Y %H:%M:%S')
		
		if systemctl is-active --quiet httpd; then
       			STATUS="Online"
        		MESSAGE="O Apache está online e rodando!"
        		FILENAME="apache_online.txt"
		else
        		STATUS="Offline"
       			MESSAGE="O Apache está offline."
        		FILENAME="apache_offline.txt"
		fi
	
		echo "$DATE httpd $STATUS - $MESSAGE" >> /mnt/efs/SeuNome/saida_script.txt 

<div align="center">
	<img src="/src/printscript.jpg" width="550px">
</div>
	
* Para executar o script criado, use o comando:

		./check_apache.sh

<div align="center">
	<img src="/src/script2.jpg" width="550px">
</div>

-----

## Como automatizar essa verificação do status do servidor Apache com o Cronie a cada 5 minutos

* Instale o Cronie executando os seguintes comandos: 

		sudo yum update -y
		
		sudo yum install cronie
	
Feito isso, inicie o Cronie:

		sudo systemctl start cronie
		
Para verificar o status do Cronie:

		sudo systemctl status crond
		
Após verificar que ele está como "Active (running)" execute:

		sudo systemctl enable crond

<div align="center">
	<img src="/src/cronie.jpg" width="750px">
</div>

Feita a ativação dele, edite o arquivo da seguinte maneira:

		sudo nano /etc/crontab
		
Aberto o editor, digite:

	*/5 * * * * ec2-user apache_status/check_apache.sh >> /mnt/efs/SeuNome/saida_script.txt 2>&1

<div align="center">
	<img src="/src/crontab-cronie.jpg" width="750px">
</div>

Isso fará com que o script seja executado a cada 5 minutos e que sempre que isso ocorrer, a saída vá para o caminho do EFS 'mnt/efs/SeuNome/saida_script.txt'.


*Caso você não tenha o diretório 'saida_script.txt', execute o comando abaixo dentro de '/mnt/efs/SeuNome/':*

			mkdir saida_script.txt
			
Com isso feito você poderá verificar as saídas do script com:

 	sudo cat /mnt/efs/SeuNome/saida_script.txt

<div align="center">
	<img src="/src/cronie-saida.jpg" width="850px">
</div>

-----

<div align="center">
  <img src="/src/logo-compass.png" width="250px" margin-top="80px">
</div>
