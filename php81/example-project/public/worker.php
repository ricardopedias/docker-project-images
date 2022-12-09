[program:up-worker]
command=php /application/public/worker.php
autostart=true
autorestart=true
redirect_stderr=true
stderr_logfile=/application/public/worker.err.log
stdout_logfile=/application/public/worker.out.log