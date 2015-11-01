shopt -s globstar;
# Loop through ffmpeg once per extension bc im dumb and this was the laziest way to do it.

echo -e "--- \e[96mConverting FLAC files\e[0m ---"

for track in Music/{,**/}*.flac ; do
  mkdir -p "output/$(dirname "${track}")"
  echo -e "Converting \e[92m${track}\e[0m"
  ffmpeg -i "$track" -c:a mp3 -q:a 0 -map_metadata 0 -id3v2_version 3 -loglevel quiet -y "output/$track.mp3"
done

echo -e "--- \e[96mConverting M4A files\e[0m ---"

for track in Music/{,**/}*.m4a ; do
  mkdir -p "output/$(dirname "${track}")"
  echo -e "Converting \e[92m${track}\e[0m"
  ffmpeg -i "$track" -c:a mp3 -q:a 0 -map_metadata 0 -id3v2_version 3 -loglevel quiet -y "output/$track.mp3"
done

echo -e "--- \e[96mMoving MP3 files\e[0m ---"

for track in Music/{,**/}*.mp3 ; do
  mkdir -p "output/$(dirname "${track}")"
  # echo -e "Moving ${track}"
  cp "$track" "output/$track" > /dev/null
done

echo -e "--- \e[96mMoving covers\e[0m ---"

for cover in Music/{,**/}cover.png ; do
  mkdir -p "output/$(dirname "${cover}")"
  # echo -e "Moving ${cover}"
  cp "$cover" "output/$cover" > /dev/null
done

for cover in Music/{,**/}cover.jpg ; do
  mkdir -p "output/$(dirname "${cover}")"
  # echo -e "Moving ${cover}"
  cp "$cover" "output/$cover" > /dev/null
done
