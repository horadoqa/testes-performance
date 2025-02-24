# troubleshoots

## Localizando o Serverest dentro da instância

```bash
find / -name "package.json" 2>/dev/null | grep "serverest"
```

## Instalando

```bash
sudo npm install /usr/local/lib/node_modules/serverest 
```

## Executando

```bash
sudo node /usr/local/lib/node_modules/serverest/src/server.js
```