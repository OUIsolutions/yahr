### plotage
plotage , refers to files you want to be observed, its very usefull to ignore parts
that are generated by compilers
(In these example , only **src** and **release** will be observed)
```shell
yahr --plotage src release
```
### delay
delay , refers to the time betwen each verification from client to server
(in these example , it will verify the code ,each 5 seconds)
```shell
yahr --delay 5000
```
### digest_mode
digest mode,reffers to the way , you want the verification, you can chose betwein
**content** or **time** (default), where time referes to the last modification
and content refers to the content of each file
(Note that , beside **content** be more reliable, its takes much time)
```shell
yahr --diggest_mode content
```
