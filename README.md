yahr (Yet Another Hot Reloader) , its another hot reloader
projected to facilitate Front End development, by refreshing the page
each time it happen some modification on the plotage folder,the advantages of
these project ,its that its deamonless, and you can start the observation
with a single command

## Releases
| item          | plataform |
|-------        |-----------|
| [Amalgamation](https://github.com/OUIsolutions/yahr/releases/download/0.0.2/yahr.c)| Source  |
| [yahr.out](https://github.com/OUIsolutions/yahr/releases/download/0.0.2/yahr.out)|Linux binary|
| [yahr.exe](https://github.com/OUIsolutions/yahr/releases/download/0.0.2/yahr.exe)|Windows binary |

## Quick Start
to quick start using , just open your termminal and type (you must be on linux)
```shell
curl -L https://github.com/OUIsolutions/yahr/releases/download/0.0.2/yahr.out -o yahr.out  && 
chmod +x yahr.out 
```
and you can just start with:
```shell 
./yahr.out
```
###  References
| File |
|-------        |
|[Arg Flags](/docs/argv_flags.md)|
| [Build](/docs/build.md)|
| [Comptime Explanation](/docs/comptime_explanation.md)|
| [Dependencies](/docs/dependencies.md)|


### Main Runtime Dependencies 
| Project  |
|-------        |
|[Lua](https://lua.org/)|
|[Serjao Berranteiro](https://serjaoberranteiroserver.com.br/)|
|[LuaCEmbed](https://github.com/OUIsolutions/LuaCEmbed)|
|[LuaDoTheWorld](https://github.com/OUIsolutions/LuaDoTheWorld)|
|[Sha-256](https://github.com/amosnier/sha-2)|

### Main Comptime Dependencies (only required to build)
| Project  |
|-------        |
|[Docker](https://www.docker.com/)|
|[Darwin](https://github.com/OUIsolutions/Darwin)|
|[Curl](https://curl.se/)|
