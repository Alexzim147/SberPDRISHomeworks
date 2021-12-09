logFile="memLogs.csv"
pidFile="/tmp/pidFile.txt"

function START() {
	while true
	do
		time=$(date +%T)
		
        infoMemTotal=$(sysctl hw.memsize)
        infoMemTotal=$((${infoMemTotal//[^0-9]/} / 1048576))

        infoMem=$(top -l 1 -s 0 | grep PhysMem)
        IFS=' ' read -ra infoMemArr <<< "${infoMem//[^0-9 ]/}"
        infoMemFree=${infoMemArr[2]}

        sub=$(bc <<< "scale=4; 1 - $infoMemFree / $infoMemTotal")
        percent=$(bc <<< "scale=2; $sub * 100")
            
        infoAll="$time;$infoMemTotal;$infoMemFree;$percent"
		echo $infoAll >> $logFile
		sleep 600
	done
}

function STOP() {
    pid=$(cat $pidFile)
	kill $pid
	rm $pidFile
}

option=$1

case $option in
"START")
	if [ ! -e $pidFile ]
	then
		START&
		echo $! > $pidFile
        echo | cat $pidFile
	fi
	;;
	
"STOP")
	if [ ! -e $pidFile ]
	then
		echo "Can't stop process"
	else
		STOP
	fi
	;;

"STATUS")
	if [ -e $pidFile ]
	then
		echo "ACTIVE"
	else
		echo "INACTIVE"
	fi
esac