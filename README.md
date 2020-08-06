# Docker build for FFmpeg on Alpine Linux (amd64/arm32v7/arm64v8)

## FFmpeg Build
[4.3.1-alpine-amd64.Dockerfile](https://github.com/collelog/ffmpeg/blob/master/4.3.1-alpine-amd64.Dockerfile)
```
ffmpeg version 4.3.1 Copyright (c) 2000-2020 the FFmpeg developers
  built with gcc 9.3.0 (Alpine 9.3.0)
  configuration:
	--disable-debug
	--disable-doc
	--disable-ffplay
	--disable-filter=resample
	--disable-stripping
	--disable-thumb
	--enable-avisynth
	--enable-avresample
	--enable-chromaprint
	--enable-fontconfig
	--enable-frei0r
	--enable-gpl
	--enable-ladspa
	--enable-libaom
	--enable-libaribb24
	--enable-libass
	--enable-libbluray
	--enable-libbs2b
	--enable-libcaca
	--enable-libcdio
	--enable-libcodec2
	--enable-libdc1394
	--enable-libdrm
	--enable-libfdk_aac
	--enable-libflite
	--enable-libfontconfig
	--enable-libfreetype
	--enable-libfribidi
	--enable-libgme
	--enable-libgsm
	--enable-libjack
	--enable-libkvazaar
	--enable-libmp3lame
	--enable-libmysofa
	--enable-libopencore-amrnb
	--enable-libopencore-amrwb
	--enable-libopenjpeg
	--enable-libopenmpt
	--enable-libopus
	--enable-libpulse
	--enable-librsvg
	--enable-librubberband
	--enable-libshine
	--enable-libsnappy
	--enable-libsoxr
	--enable-libspeex
	--enable-libsrt
	--enable-libssh
	--enable-libtheora
	--enable-libtwolame
	--enable-libvidstab
	--enable-libvorbis
	--enable-libvpx
	--enable-libwavpack
	--enable-libwebp
	--enable-libx264
	--enable-libx265
	--enable-libxcb
	--enable-libxml2
	--enable-libxvid
	--enable-libzmq
	--enable-lv2
	--enable-nonfree
	--enable-openal
	--enable-opengl
	--enable-openssl
	--enable-postproc
	--enable-sdl2
	--enable-shared
	--enable-small
	--enable-version3
	--extra-cflags=-I/usr/local/include
	--extra-ldflags=-L/usr/local/lib
	--extra-libs='-lpthread -lm'
	--prefix=/usr/local

libavutil      56. 51.100 / 56. 51.100
libavcodec     58. 91.100 / 58. 91.100
libavformat    58. 45.100 / 58. 45.100
libavdevice    58. 10.100 / 58. 10.100
libavfilter     7. 85.100 /  7. 85.100
libavresample   4.  0.  0 /  4.  0.  0
libswscale      5.  7.100 /  5.  7.100
libswresample   3.  7.100 /  3.  7.100
libpostproc    55.  7.100 / 55.  7.100
```

## 利用ソースコード
[./DockerTools/extractlibrary](https://github.com/collelog/ffmpeg/blob/master/DockerTools/extractlibrary)は以下URLにて配布されているものです。

- **DockerTools**
  - [kurukurumaware/DockerTools](https://github.com/kurukurumaware/DockerTools)
    - [Apache License, Version 2.0](https://github.com/kurukurumaware/DockerTools/blob/master/LICENSE-2.0.txt)
    - [MIT License](https://github.com/kurukurumaware/DockerTools/blob/master/MIT-LICENSE.txt)


当ソースコードは以下のソースコードを参考に作成しています。
- **FFmpeg Docker image**
  - [jrottenberg/ffmpeg](https://github.com/jrottenberg/ffmpeg) : Docker build for FFmpeg on Ubuntu / Alpine / Centos 7 / Scratch
    - [Apache License, Version 2.0](https://github.com/jrottenberg/ffmpeg/blob/master/LICENSE)


## License
このソースコード(Dockerfile)は [MIT License](https://github.com/collelog/tv-recorder/blob/master/LICENSE) のもとでリリースします。  
ただし当Dockerfileで作成されるDockerイメージに内包される各種アプリケーションで使用されるライセンスは異なります。各プロジェクト内のLICENSE, COPYING, COPYRIGHT, READMEファイルまたはソースコード内のアナウンスを参照してください。
