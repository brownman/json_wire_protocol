trap 'echo trap: term' SIGTERM
trap 'echo trap: term' EXIT


( { echo someerr now; some_err; } || { kill 0; } )&



echo this line shouldn\'t be reached !
