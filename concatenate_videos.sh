# id.list:
#  intro.mp4|video.mp4

# generate the list.txt (to know what video to glue-together)
cat id.list | grep -v  "^#" | while IFS='|' read -r intro video
do
  echo "file '$intro'
        file '$video'" > ${video}_list.txt
done 

# finally concatenate the videos.
cat id.list | grep -v  "^#" | while IFS='|' read -r intro video
do
ffmpeg -f concat -safe 0 -i ${video}_list.txt -c copy ../fin2/${video}
done 










