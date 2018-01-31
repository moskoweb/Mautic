# Limpeza de Cache e Ajuste de Permissões

Caso você tenha dificuldades para fazer alguns ajustes em sua instalação do Mautic, devido a falta de conhecimento, segue abaixo, um script que irá ajudar você a realizar algumas manutençes que venha a precisar no Mautic.

## Script

```php
<?php

/*
 * Password Generator: https://www.dashlane.com/features/password-generator
 * 
 * Actions:
 * 0 = Limpeza do Cache
 * 1 = Ajustes nas Permissões de Usuário
 * 2 = Ajustes nas Permissões de Arquivos
 */

if ( isset($_GET['pass']) == 'MINHA-SENHA' ) {
	// Get Actions
	if (isset($_GET['actions'])) {
		$actions = $_GET['actions'];

		// Delimite Actions
		$actions = ( strpos($actions, ',') !== false ) ? explode(',', $actions) : [0 => $actions];

		foreach ($actions as $action) {
			switch ($action) {
			    case 0:
			        $mautic_cache = shell_exec('php7.0 app/console cache:clear');
					echo "<h3>Mautic Cache</h3><pre>$mautic_cache</pre><hr>";
			        break;
			    case 1:
			        $permissions_user = shell_exec('chown -R www-data:www-data *');
					echo "<h3>Permissions User</h3><pre>$permissions_user</pre><hr>";
			        break;
			    case 2:
			        $permissions_files = shell_exec('chmod -R g+rw *');
					echo "<h3>Permissions Run</h3><pre>$permissions_run</pre><hr>";
			        break;
			}
		}
	} else {
		exit('Ação Não Encontradas!');
	}
} else {
	echo "<body style='margin: 0;'><div style='width: 100%; height: 100%; background: url(https://screenshotscdn.firefoxusercontent.com/images/bd6c079d-5a2d-438f-887f-dd2d2c7efdf8.png); background-size: cover;'></div></body>";
}

?>
```
