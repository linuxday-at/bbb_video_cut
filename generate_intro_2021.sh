# generate script for png -> video & audio
for intro in $(ls -1 intro*png); 
do
  in_s=$(basename -s .png $intro)
  echo "ffmpeg -r 1/3 -i $intro -c:v libx264 -vf \"fps=25,format=yuv420p,scale=1920x1080\" $in_s.mp4" >> gen_intro_video.sh
  echo "ffmpeg -i $in_s.mp4 -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=48000 \
          -c:v copy -shortest ${in_s}_av.mp4" >> gen_intro_video.sh 
done
