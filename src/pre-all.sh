set -x

mkdir -p /OUTPUTS/DATA/SUBJECTS

cd /INPUTS

# Iterate subjects
for i in *;do

    # Iterate subdirs (sessions)
    cd /INPUTS/$i

    for j in *;do

        # Copy from inputs to outputs concat subject and subdir name
        cp -r /INPUTS/$i/$j /OUTPUTS/DATA/SUBJECTS/${i}_${j}

        # Append to subject list
        echo ${i}_${j} >> /OUTPUTS/subjects.txt
 
# Copy in fsaverage
cp -r /opt/ext/fsaverage /OUTPUTS/DATA/SUBJECTS
