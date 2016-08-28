#!/bin/bash

BASENAME="/data/backup"
OUTPUTNAME1="ORACLE-EXPDAT-"
CURRENTTIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
OUTPUTNAME2=".DMP"
expdp system/$syspasswd@localhost FULL=Y dumpfile="pump_directory:$OUTPUTNAME1$CURRENTTIMESTAMP$OUTPUTNAME2" exclude=SCHEMA:\"IN \(\'SYSTEM\'\,\'ANONYMOUS\'\,\'APEX_040000\'\,\'APEX_PUBLIC_USER\'\,\'CTXSYS\'\,\'SYS\'\,\'FLOWS_FILES\'\,\'HR\'\,\'MDSYS\'\,\'OUTLN\'\,\'XDB\'\)\"
