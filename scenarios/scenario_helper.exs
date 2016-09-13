
Mix.shell.cmd "docker-compose -f docker/docker-compose.yml up -d"
#Mix.shell.cmd "mix run --no-halt"

ExUnit.start()