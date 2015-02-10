trap 'echo trap: term - try to exit; exit 0;' SIGTERM
trap 'echo trap: exit' EXIT


( { echo someerr now; some_err; } || { kill 0; } )&

sleep 10;

echo this line shouldn\'t be reached !
