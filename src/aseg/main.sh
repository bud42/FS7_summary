export SUBJECTS_DIR=/OUTPUTS/DATA/SUBJECTS

cd $SUBJECTS_DIR

asegstats2table --skip --delimiter comma --subjectsfile /OUTPUTS/subjects.txt --meas volume --tablefile /OUTPUTS/DATA/aseg.volume.csv

echo DONE
