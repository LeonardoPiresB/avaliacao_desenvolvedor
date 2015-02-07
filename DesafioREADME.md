#Desafio Programa 1

Passos para a instalação do sistema:
1. Baixe o conteúdo do projeto, utilizando o comando 'git clone', para sua máquina:
	git clone https://github.com/LeonardoPiresB/avaliacao_desenvolvedor.git
2. Entre no diretório desafio, com o comando 'cd avaliacao_desenvolvedor/desafio'	
3. Após baixar o conteúdo do projeto, execute o comando 'rake db:migrate' para gerar e importar a base em SQLite
4. Em seguida, execute o comando 'rails server', para que o servidor Web seja incializado.
5. Acesso a URL http://localhost:3000 e verifique se a página principal contendo as compras realizadas, são impressas na tela.

Para Testar a importação de dados via arquivo:
1. Clique no botão 'Selecionar Arquivo' e escolha o arquivo que deseja importar, de preferência 'dados.txt'
2. Após escolher devidamente o arquivo, clique no botão 'Carregar' e verifique quantos registros foram importados.
