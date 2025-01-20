## Important
These project use [Darwin](https://github.com/OUIsolutions/Darwin/tree/0.015) on version **0.15** 
and you will need to understand darwin concepts to manipulate these repo 

## Building from Amalagamation Release 
For Building from amalgamation you can just download it with:
```shell
curl -L https://github.com/OUIsolutions/yahr/releases/download/0.0.2/yahr.c -O yahr.c
```
and then , you can compile with 
```shell 
gcc yahr.c -o yahr.out
```

## Build From Docker
if you want to build the project from docker , you need to have docker  and [Darwin](https://github.com/OUIsolutions/Darwin/tree/0.015)   installed in your machine
then , clone the repo into your machine and run
```shell
 darwin build   darwinconf.lua --create_from_docker_images --install_dependencies_from_docker --compile_linux_from_docker --compile_windows_from_docker 
```
## Build Local
if you want to build local you will need to have [Darwin](https://github.com/OUIsolutions/Darwin/tree/0.015), **gcc**,**i686-w64-mingw32-gcc**,**unzip** and **curl** installed in your machine,then you can run 

```shell 
 darwin build   darwinconf.lua  --install_dependencies --compile_linux --compile_windows 
```

