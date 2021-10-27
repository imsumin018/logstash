for day in {1..31}
do
        if [ $day -lt 10 ] ;then
                file="cordoba-complex.2021-02-"0$day

        else
                file="cordoba-complex.2021-02-"$day
        fi
        echo `cat $file* | grep "알파룸" | grep ComplexDeviceReportState |grep Heater >> ../output/heater_alpharoom_$file.json`
done
