# generate a script to cut videos
#
# you need a file "cutlist.txt"
# contains:
#    video.mp4|00:01:00|00:24:00
# ( that would cut video.mp4 from minute 1 to minute 24, generating new file. )

cat cutlist.txt | while IFS='|' read -r vname von bis
do
  {
    echo "echo \"cutting $vname, sec $von to $bis\""  
    echo "ffmpeg -i orig/$vname -ss $von -to $bis -c:v copy -c:a copy finish/$vname"
  } >> docut.sh   # this script will be generated, nothing direct executed.
done 
