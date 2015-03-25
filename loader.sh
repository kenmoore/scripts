# loader.sh
# Sends many requests to a URL to simulate traffic load

echo -n "URL to hit: "
read url
echo -n "Number of (synchronous) hits per process: "
read hits
echo -n "Number of concurrent processes: "
read processes
for ((process=1; process<$processes; process++))
do
  echo "curl -s " $url "?[1-" $hits "] > /dev/null &   (" $process ")"
  curl -s $url?[1-$hits] > /dev/null &
done
