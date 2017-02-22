# Cronjobs - Mautic

Pensado em ajudar a todos, estou reunindo aqui e peço a colaboração de quem puder/quiser ajudar também, para reunirmos os conjobs esenciais para o bom funcionamento do Mautic.org instaldo em um servidor VPS ou Dedicado.

## Informações Preciosas

Para que possa configurar o cronjob do Mautic corretamente, é recomendado que realize da seguinte form.

1. Acessar o SSH com usuário Root ou com Permissões Root.
2. Para Nginx - Executar ```crontab -u www-data -e``` | Para Apache - Executar ```crontab -u nobody -e```
3. Copie os Cronjobs listados abaixo, e modifique colocando o caminho da pasta raiz do Mautic em seu servidor.
4. Cole os seus Cronjobs e aperte *crtl + x* e depois aperte *y* e *enter*.

## Lista de Cronjobs
```
# Cron para Atualizar as Listas/Segmentos
1,5,9,13,18,22,26,31,35,39,43,48,52,56 * * * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:segments:update --force --batch-limit=300

# Crons para Atualizar as Campanhas e para Executar as Campanhas
3,7,11,16,20,24,28,33,37,41,46,50,54,58 * * * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:campaigns:rebuild --force --batch-limit=100
3,7,11,16,20,24,28,33,37,41,46,50,54,58 * * * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:campaigns:trigger --force --batch-limit=100

# Cron para Envio dos email e Mensagem de Marketing
4,8,12,17,21,25,29,34,38,42,47,51,55,59 * * * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:emails:send
4,8,12,17,21,25,29,34,38,42,47,51,55,59 * * * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:messages:send

# Cron para Processar os Email em Bounce
0,15,30,45 * * * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:email:fetch

# Cron para o Monitoramento de Redes Sociais
10,20,30,40,50 * * * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:social:monitoring

# Cron para Envio de Webhooks
0,20,40 * * * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:webhooks:process

# Cron para Atualização da Base de Localição do Lead pelo IP
0 0 20 * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:iplookup:download

# Limpeza de Contatos sem Ação a Mais de 180 Dias
0 0 20 * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:maintenance:cleanup --days-old=180

# Agendamento de Envio Broadcast - Para Configurar Ajustar Começo com Minuto Hora Dia Mês (*) Semana
# Ex.: Envio de Email Dia 22 de Fevereiro às 08:30 da Manhã = Inicio do Cron 30 8 22 2 * php...
# Para facilitar pode usar o gerado nesse site: http://crontab-generator.org/
0 0 20 * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console mautic:broadcasts:send --channel=email --id=ID


# Cron para Limpar Cache e Ajuste de Permissões de Pasta
# Ajustar CHOWN para as o Usuario:Grupo conforme o do servidor.
30 * * * * php /CAMINHOdaATEaPASTAraizDOmautic/app/console cache:clear
30 * * * * chown -R www-data:www-data /CAMINHOdaATEaPASTAraizDOmautic
30 * * * * chmod -R g+rw /CAMINHOdaATEaPASTAraizDOmautic
```

### Nota

Essas são as minhas configurações e que estão funcionando para mim, então caso encontre algum erro, peço que notifiquem o que aparece para vocês.

## Colaboração

[Alan Mosko](http://fb.com/AlanWebD)
