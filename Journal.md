# Starting / Stopping MySQL Sever

For whatever reason, attempting to start the server via the workbench fails citing `could not start server: argument 2`. The community seems to believe this is a bug. 

To start the server, run command prompt as administrator and issue `net start MySQL80` in the prompt. To later stop the server, run `net stop MySQL80`. 

Solution found here: https://stackoverflow.com/questions/66083106/trying-to-start-mysql-server-and-getting-could-not-start-server-argument-2-c
