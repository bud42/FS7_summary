export SUBJECTS_DIR=/OUTPUTS/DATA/SUBJECTS

cp -r /usr/local/freesurfer/subjects/fsaverage $SUBJECTS_DIR

cd $SUBJECTS_DIR

for i in *;do
   for h in lh rh;do
    
    echo $i $h

    mri_surf2surf \
      --hemi $h \
      --srcsubject fsaverage \
      --trgsubject $i \
      --sval-annot $SUBJECTS_DIR/fsaverage/label/$h.Schaefer2018_100Parcels_7Networks_order.annot \
      --tval $SUBJECTS_DIR/$i/label/$h.Schaefer2018_100Parcels_7Networks_order.annot

    mris_anatomical_stats -f $SUBJECTS_DIR/$i/stats/$h.Schaefer2018_100Parcels_7Networks.stats -b -a $SUBJECTS_DIR/$i/label/$h.Schaefer2018_100Parcels_7Networks_order.annot $i $h

   done
done

# Write stats table for each hemisphere for thickness, volume, area    
aparcstats2table --skip --delimiter comma --subjectsfile /OUTPUTS/subjects.txt --hemi lh --parc Schaefer2018_100Parcels_7Networks --tablefile /OUTPUTS/DATA/Schaefer100.lh.area.csv
aparcstats2table --skip --delimiter comma --subjectsfile /OUTPUTS/subjects.txt --hemi rh --parc Schaefer2018_100Parcels_7Networks --tablefile /OUTPUTS/DATA/Schaefer100.rh.area.csv
aparcstats2table --skip --delimiter comma --subjectsfile /OUTPUTS/subjects.txt --hemi lh --parc Schaefer2018_100Parcels_7Networks --meas thickness --tablefile /OUTPUTS/DATA/Schaefer100.lh.thickness.csv
aparcstats2table --skip --delimiter comma --subjectsfile /OUTPUTS/subjects.txt --hemi rh --parc Schaefer2018_100Parcels_7Networks --meas thickness --tablefile /OUTPUTS/DATA/Schaefer100.rh.thickness.csv
aparcstats2table --skip --delimiter comma --subjectsfile /OUTPUTS/subjects.txt --hemi lh --parc Schaefer2018_100Parcels_7Networks --meas volume --tablefile /OUTPUTS/DATA/Schaefer100.lh.volume.csv
aparcstats2table --skip --delimiter comma --subjectsfile /OUTPUTS/subjects.txt --hemi rh --parc Schaefer2018_100Parcels_7Networks --meas volume --tablefile /OUTPUTS/DATA/Schaefer100.rh.volume.csv

# Volume stats
asegstats2table --skip --delimiter comma --subjectsfile /OUTPUTS/subjects.txt --meas volume --tablefile /OUTPUTS/DATA/aseg.volume.csv

echo DONE
