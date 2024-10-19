# Script de Instalação e Configuração do Krill

Este script automatiza a instalação e configuração do [Krill](https://krill.docs.nlnetlabs.nl/en/stable/), um software RPKI (Resource Public Key Infrastructure) de código aberto, em um sistema baseado em Debian. O script realiza as seguintes tarefas:

1. Atualiza a lista de pacotes.
2. Instala as dependências necessárias.
3. Adiciona o repositório NLnet Labs para o Krill.
4. Instala o Krill.
5. Configura o serviço para escutar em todos os endereços IP (`0.0.0.0`).
6. Habilita e inicia o serviço do Krill.
7. Exibe o status do serviço do Krill.
8. Mostra os logs do serviço do Krill.
9. Extrai e exibe o `admin_token` da configuração do Krill.

## Pré-requisitos

Este script foi projetado para ser executado em sistemas baseados em Debian (por exemplo, Debian, Ubuntu). Você precisa de privilégios `sudo` para executar o script, pois ele instala pacotes e modifica arquivos de configuração do sistema.

## RPKI Web

![Logo do Projeto](img/rpki_web.png)

## Instalação

### 1. Clone o repositório ou baixe o script:

```bash
git clone https://github.com/matheusmoliveira/RPKI.git
cd RPKI
```

### 2. Execute o script:

Para executar o script e instalar o Krill, basta rodar:

```bash
chmod +x install_krill.sh
./install_krill.sh
```

Alternativamente, você pode executá-lo diretamente usando curl:

```bash
curl -fsSL https://raw.githubusercontent.com/matheusmoliveira/RPKI/main/install_krill.sh | bash
```

## Visão Geral do Script

O script realiza as seguintes etapas:

### 1. Atualizar a Lista de Pacotes

O script começa atualizando a lista de pacotes do sistema para garantir que as versões mais recentes dos pacotes sejam instaladas.

```bash
sudo apt update
```

