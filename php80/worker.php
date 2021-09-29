<?php

if (is_file("/application/worker.php")) {
    include "/application/worker.php";
}

if (is_file("/opt/worker.exec") === false) {
    file_put_contents('/opt/worker.exec', 'ok');
}
