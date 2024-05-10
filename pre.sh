set -x

mkdir -p /OUTPUTS/DATA/SUBJECTS

cd /INPUTS
for i in *;do
  # Copy from inputs to outputs
  cp -r /INPUTS/$i/*/*/SUBJ /OUTPUTS/DATA/SUBJECTS/$i
  
  # Append to subject list
  echo $i >> /OUTPUTS/subjects.txt

done

# Copy in fsaverage
cp -r /opt/ext/fsaverage /OUTPUTS/DATA/SUBJECTS
