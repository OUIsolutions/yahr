## Important
These project use [Darwin](https://github.com/OUIsolutions/Darwin/tree/0.015) on version **0.15** 
and you will need to understand darwin concepts to manipulate these repo 

## Building from Amalagamation Release 
For Building from amalgamation you can just download it with:
```shell
curl -L https://github.com/OUIsolutions/yahr/releases/download/0.0.1/yahr.c -O yahr.c
```
and then , you can compile with 
```shell 
gcc yahr.c -o yahr.out
```

## Build From Docker
if you want to build the project from docker , you need to have docker  and darwin installed in your machine
then , clone the repo into your machine and run
```shell
 darwin build   darwinconf.lua --create_from_docker_images --install_dependencies_from_docker --compile_linux_from_docker --compile_windows_from_docker 
```
## Build Local
if you want to build local you will need to have gcc,
