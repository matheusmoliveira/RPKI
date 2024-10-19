#!/bin/bash

# Atualizando a lista de pacotes
sudo apt update

# Instalando as dependências
sudo apt install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# Baixando a chave de assinatura do repositório NLnet Labs
curl -fsSL https://packages.nlnetlabs.nl/aptkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/nlnetlabs-archive-keyring.gpg

# Adicionando o repositório NLnet Labs à lista de fontes do APT
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/nlnetlabs-archive-keyring.gpg] https://packages.nlnetlabs.nl/linux/debian \
$(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/nlnetlabs.list > /dev/null

# Atualizando novamente a lista de pacotes
sudo apt update

# Instalando o Krill
sudo apt install -y krill

# Adicionando a linha 'ip = "0.0.0.0"' no final do arquivo de configuração /etc/krill.conf
sudo bash -c 'echo "ip = \"0.0.0.0\"" >> /etc/krill.conf'

# Habilitando e iniciando o serviço do Krill
sudo systemctl enable --now krill

# Verificando o status do serviço Krill
sudo systemctl status krill

# Exibindo logs do Krill
sudo journalctl --unit=krill

# Exibindo apenas o valor do admin_token do arquivo /etc/krill.conf
echo "O valor do admin_token é:"
echo "admin-token = $(sudo grep 'admin_token' /etc/krill.conf | head -n 1 | cut -d '"' -f2)"
