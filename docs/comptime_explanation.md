## Important
These project use [Darwin](https://github.com/OUIsolutions/Darwin/tree/0.015) on version **0.15**
and you will need to understand darwin concepts to manipulate these repo

## The Flags

### create_from_docker_images
create all docker images for building the project,it consist in a **debian** and **alpine** machine, alpine its used to build static **gcc** compilation, and debian to make download of dependencies and to build for **windows**

### install_dependencies
Thes e flags install all dependencies required for the project, some projects like [LuaDoTheWorld](https://github.com/OUIsolutions/LuaDoTheWorld) or [Serjao Berranteiro](https://serjaoberranteiroserver.com.br/) are installed from source
since we want to make a static binary

### compile_linux
Make the compilation on linux
### compile_windows
Make the compilation on windows

### __from_docker sulfix
make the same thing ,but inside a docker container

## The Building process
The build process starts in
```lua
if is_argv_present("--compile_linux") or is_argv_present("--compile_windows") then
```
first we add the C parts that will be required, then we
use the function ** darwin.load_lualib_from_c** to load these libs into the final C
after it, we iterate over **src** folder , adding everything to the final amalmagation
and after, we embed everything into **assets** puting it as a global variable **ASSETS**
