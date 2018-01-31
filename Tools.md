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

---

## Indicação

Caso você não queira se preocupar com esses tipos de manutenção, recomendo que procure contratar alguém de confiança e credibilidade para configurar para você seu Mautic, ou utilize um painel completo de fácil utilização para que possa realizar a sua instalação sem problemas.

Se você está a procura de um painel simples e prático, recomendo para você o painel da [Agius Cloud](https://app.agiuscloud.com/ac/20/), que faz a instação e configuração completa do Mautic para você.

[Clique aqui e Saiba Mais!](https://app.agiuscloud.com/ac/20/)
