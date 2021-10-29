
for day in {1..31}
do
        if [ $day -lt 10 ] ;then
                file="cordoba-complex.2021-01-"0$day

        else
                file="cordoba-complex.2021-01-"$day
        fi
        echo `cat $file* | grep spGetParcelList >> ../parcel_$file.json`
done
