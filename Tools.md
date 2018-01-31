# Comandos Úteis para Mautic

Caso você tenha dificuldades para fazer alguns ajustes em sua instalação do Mautic, devido a falta de conhecimento, segue abaixo, um resumo de comandos que irão te ajudar no dia a dia.

Todos os comandos estão ajustados e adaptados para serem executados a partir de você estar na pasta raiz do Mautic.

Para navegar no seu Terminal/Putty até o seu Mautic, basta usar o comando ```cd```, exemplo:

```
cd /var/www/dominio.mautic/htdocs/
```

## Comandos

### Limpeza do Cache do Mautic

```
php app/console cache:clear
```

### Ajustes nas Permissões de Usuário

```
chown -R www-data:www-data *
```

__Ps.:__ Lembrando sempre de trocar o **www-data:www-data** pelo Usuário:Grupo do seu servidor, pois varia conforme configurado o servidor.

### Ajustes nas Permissões de Arquivos

```
chmod -R g+rw *
```

### Atualização de Versão

```
php app/console mautic:update:find && php app/console mautic:update:apply
```

### Atualização do Banco de Dados

```
php app/console doctrine:migration:status && php app/console doctrine:migration:migrate -n && php app/console doctrine:schema:update --dump-sql && php app/console doctrine:schema:update --force
```


### Ajustar Fuso Horário do Servidor

```
dpkg-reconfigure tzdata
```
