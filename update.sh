#!/bin/bash

clear

echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃    MAUTIC UPDATE VERSION    ┃"
echo "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
echo "┃ Iniciando Atualização!      ┃"
echo "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
echo "┃ Atualização em andamento... ┃"
echo "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"

php app/console mautic:update:find

php app/console mautic:update:apply -q -n

php app/console doctrine:migration:status -q -n

php app/console doctrine:migration:migrate -q -n

php app/console doctrine:schema:update --dump-sql -q -n

php app/console doctrine:schema:update --force -q -n

php app/console cache:clear -q

chmod -R g+rw *

php app/console mautic:assets:generate -q

php app/console cache:warmup -q

echo "┃ Atualização Concluída!      ┃"
echo "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
echo "┃ Criado por Alan Mosko       ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
