#!/bin/bash
commands=(
	"python3 benign_yt_traffic.py"	
	"tshark -f 'udp port 443' -i ens18 -a duration:300 -t r -T fields \
	-e frame.time -e ip.src -e ip.dst -e udp.srcport -e udp.dstport -e quic.version \
	-e quic.packet_length -e _ws.col.Protocol \
	-E separator=, -E quote=d > ./benign_flow/test1.csv"
)

parallel --delay 10 ::: "${commands[@]}"
