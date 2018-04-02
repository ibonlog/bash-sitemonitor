WEB_URL[0]='https://www.google.es'
#WEB_URL[1]='http://www.sdfsdfsdfsdf.es'


for i in `seq 0 $((${#WEB_URL[*]}-1))`
do
	http_code=`curl -o /dev/null -s -m 10 --connect-timeout 10 -w %{http_code} ${WEB_URL[${i}]}`
	if [ ${http_code} != "200" ]
	then
		echo "Web caida: ${WEB_URL[${i}]}"
		exit 1
	fi
done

exit 0

