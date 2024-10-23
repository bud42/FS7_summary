export SUBJECTS_DIR=/OUTPUTS/DATA/SUBJECTS

cd $SUBJECTS_DIR

# Volume stats table for each aparc hemisphere
aparcstats2table --skip --delimiter comma --subjectsfile /OUTPUTS/subjects.txt --hemi lh  --meas volume --tablefile /OUTPUTS/DATA/aparc.lh.volume.csv
aparcstats2table --skip --delimiter comma --subjectsfile /OUTPUTS/subjects.txt --hemi rh  --meas volume --tablefile /OUTPUTS/DATA/aparc.rh.volume.csv

echo DONE
