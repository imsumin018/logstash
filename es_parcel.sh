
for day in {1..31}
do
        if [ $day -lt 10 ] ;then
                file="cordoba-complex.2021-08-"0$day

        else
                file="cordoba-complex.2021-08-"$day
        fi
        echo `cat $file* | grep spGetParcelList >> ../es_parcel/parcel_02$file.json`
done
