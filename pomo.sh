countdown(){
  date1=$((`date +%s` + $1));
  while [ "$date1" -ge `date +%s` ]; do
    echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
  sleep 0.1
  done
}

stopwatch(){
  date1=`date +%s`;
  while true; do
    echo Countdown to $2
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 1
  done
}

echoPomo() {
  notify-send "POMO -> $1" && echo $1
}

PERIOD=$((30 * 60))
SLEEP=$((5 * 60))

echoPomo "ONE MINUTE TO START! Open your work."
for i in `seq 4`
do
  # opening
  countdown 60 'work start' &&
    echoPomo "START! REST OVER. LETS START"
  countdown $((PERIOD - 60)) 'work ending' &&
    echoPomo "ONE MINUTE LEFT! CLOSE YOUR WORK."
  countdown 60 'rest start' &&
    echoPomo "REST! TIME OUT."
  countdown $(($SLEEP - 60)) 'rest ending' &&
    echoPomo "ONE MINUTE TO START! Open your work."
done

echo "Pomo Ended."
