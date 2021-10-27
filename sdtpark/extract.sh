for day in {1..31}
do
        if [ $day -lt 10 ] ;then
                file="cordoba-complex.2021-01-"0$day

        else
                file="cordoba-complex.2021-01-"$day
        fi
        echo `cat $file* | grep ComplexDeviceReportState | grep sdtparkcity >> ../sdtpark/sdtpark_$file.json`
        # echo `cat $file* | grep sdtparkcity | grep ComplexDeviceReportState | grep Light >> ../output/light_202101_sdtpark_$file.json`
        #echo `cat $file* | grep jangamthesharp | grep ComplexDeviceReportState | grep Light >> ../output/light_202101_jangam_$file.json`
        # echo `cat $file* | grep "알파룸" | grep Light >> ../output_all_alpharoom/all_light_202101_alpharoom_$file.json`
done
