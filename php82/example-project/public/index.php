<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PHP 8.2</title>
    </head>

    <body>

        <h2>Página de teste</h2>

        <p>
            <?= "Esta é uma página PHP em " . (new DateTime())->format("d/m/Y") ?>
        </p>

        <?= phpinfo() ?>

    </body>
</html>