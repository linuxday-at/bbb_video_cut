# generate script for png -> video & audio
for intro in $(ls -1 intro*png); 
do
  echo "ffmpeg -r 1/3 -i $intro -c:v libx264 -vf \"fps=24,format=yuv420p,scale=3360x1080\" $intro.mp4" >> gen_intro_video.sh
  echo "ffmpeg -i $intro.mp4 -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=48000 \
          -c:v copy -shortest ${intro}_av.mp4" >> gen_intro_video.sh 
done
