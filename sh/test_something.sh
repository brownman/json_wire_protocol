trap 'echo trap: term; exit 0;' SIGTERM
trap 'echo trap: term' EXIT


( { echo someerr now; some_err; } || { kill 0; } )&

sleep 10;

echo this line shouldn\'t be reached !
