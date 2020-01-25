# docker-ffmpeg-nvidia
This is based on nvidia's video-codec-sdk to implement gpu transcoding (i.e., nvenc and cuvid)

#### Usage:
Examples below are for transcoding to hevc (i.e., x265) into an mkv container. 
1. Transcode with hardware encode of video, and copying of audio and subtitle streams:  
`docker run -runtime=nvidia --rm -v /mnt/storage/media:/media bchoor/docker-ffmpeg-nvidia /usr/bin/ffmpeg -i /media/input.mkv -c:v hevc_nvenc -preset:v main -profile:v fast -rc vbr_hq -c:a copy -c:s copy output.mkv`

2. Transcode with both hardware decoding (using cuvid if input is h264) and encoding (nvenc):  
`docker run -runtime=nvidia -rm -v /mnt/storage/media:/media bchoor/docker-ffmpeg-nvidia /usr/bin/ffmepg -hwaccel cuvid -c:v h264_cuvid -i /media/input.mkv -c:v hevc_nvenc -preset:v main -profile:v fast -rc vbr_hq -c:a copy -c:s copy output.mkv`

#### Prerequisites:
1. gpu capability - first check if your gpu has the capability to do video encoding and which encoders are supported.
2. nvidia drivers - find your drivers https://www.nvidia.com/download/index.aspx and follow instructions 
3. nvidia-docker2 - follow instructions here: https://github.com/NVIDIA/nvidia-docker

#### References:
* https://developer.nvidia.com/ffmpeg
* https://hub.docker.com/r/nvidia/video-codec-sdk/

