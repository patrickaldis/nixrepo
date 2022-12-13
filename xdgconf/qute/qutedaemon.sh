while true; do
	if ps auc | grep qute > /dev/null
	then
		sleep 1000
	else
		echo "generating instance"
		qutebrowser -R --nowindow
	fi
done
