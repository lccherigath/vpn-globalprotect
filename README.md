### Acesso à VPN GlobalProtect com o cliente OpenConnect

- GlobalProtect é um tipo de rede privada virtual (VPN) que integra os firewalls da Palo Alto Networks. \*
- O OpenConnect é um cliente de VPNs criado inicialmente para suportar a VPN Cisco AnyConnect, mas que depois passou a suportar também a Pulse Connect Secure e a Palo Alto Networks GlobalProtect. O suporte a esta última veio com a versão 8.00, lançada em 04/01/2019. \*

\* [kamarada.github.io](<https://kamarada.github.io/pt/2020/03/17/como-conectar-a-uma-vpn-do-globalprotect/#.X_UXGdZv-Wg>)

- Até o Ubuntu 18, utilizar um container docker (imagem do Ubuntu 19 ou 20)

```bash
# Gerar a imagem a partir do Dockerfile
docker build . -t my-ubuntu19

# Criar o container a partir da imagem gerada
docker run -itd --name ubuntu19 --cap-add=NET_ADMIN --device /dev/net/tun:/dev/net/tun my-ubuntu19

# Acessar o container no modo interativo e conectar-se à VPN
docker exec -it ubuntu19 /bin/bash
openconnect --protocol=gp servidor.do.global.protect

# A conexão é estabelecida e o comando fica em execução
# Abrir outro terminal, acessar o container novamente e conectar-se à máquina da empresa
docker exec -it ubuntu19 /bin/bash
ssh usuario@ip.da.maquina
```

- A partir do Ubuntu 19 (versão 8 do OpenConnect), utilizar normalmente no terminal

```bash
sudo apt-get -y update && apt-get -y install ssh openconnect
sudo openconnect --protocol=gp servidor.do.global.protect -v
```
