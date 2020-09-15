# Docker build for FFmpeg on Alpine Linux
Docker build for FFmpeg on Alpine Linux. Enable Hardware Encoding and GCC optimization.

## Tags
### FFmpeg
- 4.3.1 (Tags: 4.3.1-[os]-[architecture])
- 4.2.4 (Tags: 4.2.4-[os]-[architecture])
- 4.1.6 (Tags: 4.1.6-[os]-[architecture])
- [0p1pp1/FFmpeg](https://github.com/0p1pp1/FFmpeg/) - Branch:isdb-4.2 (Tags: 0p1pp1-4.2-[os]-[architecture])

### OS
- Alpine Linux 3.12.0 ([ffmpeg]-alpine-[architecture])

### Architecture 
- amd64 (Tags: [ffmpeg]-[os]-amd64)
- arm64v8 (Tags: [ffmpeg]-[os]-arm64v8)
- arm32v7 (Tags: [ffmpeg]-[os]-arm32v7)
- arm32v6 (Tags: [ffmpeg]-[os]-arm32v6)

### Hardware Acceleration
- VA-API, Intel QSV:Intel Media SDK (Tags: [ffmpeg]-[os]-vaapi-amd64)
- Raspberry Pi 4B  
 - 64bit OS (Tags: [ffmpeg]-[os]-rpi4-arm64v8)
 - 32bit OS (Tags: [ffmpeg]-[os]-rpi4-arm32v7)
- Raspberry Pi 3B (Tags: [ffmpeg]-[os]-rpi3-arm32v7)


### GCC optimization
- x86-64 (Tags: [ffmpeg]-[os]-amd64)
- Raspberry Pi 4B  
 - 64bit OS (Tags: [ffmpeg]-[os]-rpi4-arm64v8)
 - 32bit OS (Tags: [ffmpeg]-[os]-rpi4-arm32v7)
- Raspberry Pi 3B (Tags: [ffmpeg]-[os]-rpi3-arm32v7)


## Example of Copy FFmpeg binary and library to base image
Dockerfile
```
# FFmpeg
FROM collelog/ffmpeg:4.3.1-alpine-amd64 AS ffmpeg-image

# final image
FROM alpine:3.12.0

COPY --from=ffmpeg-image /build /
```


## FFmpeg Build
- collelog/ffmpeg:4.3.1-alpine-amd64
```
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
	--extra-cflags=-I/usr/local/include -O2 -march=x86-64 -mtune=generic -fomit-frame-pointer
	--extra-cxxflags=-I/usr/local/include -O2 -march=x86-64 -mtune=generic -fomit-frame-pointer
	--extra-ldflags=-L/usr/local/lib
	--extra-libs='-lpthread -lm'
	--prefix=/usr/local
```


- collelog/ffmpeg:4.3.1-alpine-vaapi-amd64
```
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
	--extra-cflags=-I/usr/local/include -O2 -march=x86-64 -mtune=generic -fomit-frame-pointer
	--extra-cxxflags=-I/usr/local/include -O2 -march=x86-64 -mtune=generic -fomit-frame-pointer
	--extra-ldflags=-L/usr/local/lib
	--extra-libs='-lpthread -lm'
	--prefix=/usr/local
	--enable-libmfx
	--enable-vaapi
	--enable-vdpau
```


- collelog/ffmpeg:4.3.1-alpine-rpi4-arm64v8
```
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
	--extra-cflags=-I/usr/local/include -O2 -march=armv8-a+crc+simd -mtune=cortex-a72 -fomit-frame-pointer
	--extra-cxxflags=-I/usr/local/include -O2 -march=armv8-a+crc+simd -mtune=cortex-a72 -fomit-frame-pointer
	--extra-ldflags=-L/usr/local/lib
	--extra-libs='-lpthread -lm'
	--prefix=/usr/local
	--enable-v4l2_m2m
```

- collelog/ffmpeg:4.3.1-alpine-rpi4-arm32v7
```
  configuration:
	--disable-debug
	--disable-doc
	--disable-ffplay
	--disable-filter=resample
	--disable-stripping
	--disable-thumb
	--enable-avisynth
	--enable-avresample
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
	--enable-nonfree
	--enable-openal
	--enable-opengl
	--enable-openssl
	--enable-postproc
	--enable-sdl2
	--enable-shared
	--enable-small
	--enable-version3
	--extra-cflags=-I/usr/local/include -I/opt/vc/include/IL -O2 -march=armv8-a+crc+simd -mtune=cortex-a72 -fomit-frame-pointer -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits
	--extra-cxxflags=-I/usr/local/include -I/opt/vc/include/IL -O2 -march=armv8-a+crc+simd -mtune=cortex-a72 -fomit-frame-pointer -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits
	--extra-ldflags=-L/usr/local/lib
	--extra-libs='-lpthread -lm'
	--prefix=/usr/local
	--enable-mmal
	--enable-omx
	--enable-omx-rpi
	--enable-v4l2_m2m
```

- collelog/ffmpeg:4.3.1-alpine-rpi3-arm32v7
```
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
	--enable-libsnappy
	--enable-libsoxr
	--enable-libspeex
	--enable-libsrt
	--enable-libssh
	--enable-libtheora
	--enable-libtwolame
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
	--enable-nonfree
	--enable-openal
	--enable-opengl
	--enable-openssl
	--enable-postproc
	--enable-sdl2
	--enable-shared
	--enable-small
	--enable-version3
	--extra-cflags=-I/usr/local/include -I/opt/vc/include/IL -O2 -march=armv8-a+crc+simd -mtune=cortex-a53 -fomit-frame-pointer -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits
	--extra-cxxflags=-I/usr/local/include -I/opt/vc/include/IL -O2 -march=armv8-a+crc+simd -mtune=cortex-a53 -fomit-frame-pointer -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits
	--extra-ldflags=-L/usr/local/lib
	--extra-libs='-lpthread -lm'
	--prefix=/usr/local
	--enable-mmal
	--enable-omx
	--enable-omx-rpi
	--enable-v4l2_m2m
```

- collelog/ffmpeg:4.3.1-alpine-arm64v8
```
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
	--extra-cflags=-I/usr/local/include -O2 -fomit-frame-pointer
	--extra-cxxflags=-I/usr/local/include -O2 -fomit-frame-pointer
	--extra-ldflags=-L/usr/local/lib
	--extra-libs='-lpthread -lm'
	--prefix=/usr/local
	--enable-neon
```

- collelog/ffmpeg:4.3.1-alpine-rpi-arm32v6
- collelog/ffmpeg:4.3.1-alpine-rpi-arm32v7
```
	--disable-debug
	--disable-doc
	--disable-ffplay
	--disable-filter=resample
	--disable-stripping
	--disable-thumb
	--enable-avisynth
	--enable-avresample
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
	--enable-nonfree
	--enable-openal
	--enable-opengl
	--enable-openssl
	--enable-postproc
	--enable-sdl2
	--enable-shared
	--enable-small
	--enable-version3
	--extra-cflags=-I/usr/local/include -O2 -fomit-frame-pointer
	--extra-cxxflags=-I/usr/local/include -O2 -fomit-frame-pointer
	--extra-ldflags=-L/usr/local/lib
	--extra-libs='-lpthread -lm'
	--prefix=/usr/local
	--enable-neon
```


## 利用ソースコード
[./DockerTools/extractlibrary](https://github.com/collelog/ffmpeg/blob/master/DockerTools/extractlibrary)は以下URLにて配布されているものです。

- **DockerTools**
  - [kurukurumaware/DockerTools](https://github.com/kurukurumaware/DockerTools)
    - [Apache License, Version 2.0](https://github.com/kurukurumaware/DockerTools/blob/master/LICENSE-2.0.txt)
    - [MIT License](https://github.com/kurukurumaware/DockerTools/blob/master/MIT-LICENSE.txt)


## License
このソースコード(Dockerfile)は [MIT License](https://github.com/collelog/tv-recorder/blob/master/LICENSE) のもとでリリースします。  
ただし当Dockerfileで作成されるDockerイメージに内包される各種アプリケーションで使用されるライセンスは異なります。各プロジェクト内のLICENSE, COPYING, COPYRIGHT, READMEファイルまたはソースコード内のアナウンスを参照してください。
