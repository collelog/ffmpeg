# FFmpeg
FROM collelog/buildenv:alpine AS ffmpeg-build

ENV \
	AVISYNTH_PLUS_VERSION=3.6.1 \
	BS2B_VERSION=3.1.0 \
	CODEC2_VERSION=0.9.2 \
	KVAZAAR_VERSION=2.0.0 \
	LIBMYSOFA_VERSION=1.1 \
	LIBSRT_VERSION=1.4.1 \
	OPENCOREAMR_VERSION=0.1.5 \
	TWOLAME_VERSION=0.4.0

ENV LD_LIBRARY_PATH=/opt/vc/lib:/usr/local/lib:/usr/lib:/lib
ENV PKG_CONFIG_PATH=/opt/vc/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:/lib/pkgconfig
ENV SRC=/usr/local
ENV PREFIX=/usr/local
ENV MAKEFLAGS=-j15

#RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
#RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN apk add --no-cache --update \
	aom-dev \
	chromaprint-dev \
	cunit-dev \
	fdk-aac-dev \
	ffmpeg-libs \
	ffmpeg-dev \
	flite-dev \
	fontconfig-dev \
	freetype-dev \
	frei0r-plugins-dev \
	fribidi-dev \
	gsm-dev \
	jack-dev \
#	ladspa-dev \
	lame-dev \
	libass-dev \
	libbluray-dev \
	libcaca-dev \
	libcdio-dev \
	libcdio-paranoia-dev \
	libdc1394-dev \
	libdrm-dev \
#	libgme-dev \
##	libiec61883-dev \
	libogg-dev \
	libpng-dev \
	librsvg-dev \
	libsndfile-dev \
	libssh-dev \
	libtheora-dev \
	libvorbis-dev \
	libvpx-dev \
	libwebp-dev \
	libxau-dev \
	libxcb-dev \
	libxml2-dev \
#	lilv-dev \
	mesa-dev \
	mpg123-dev \
	openjpeg-dev \
	openal-soft-dev \
	openssl-dev \
	opus-dev \
	pulseaudio-dev \
#	rubberband-dev \
	sdl2-dev \
#	shine \
	snappy-dev \
	soxr-dev \
	speex-dev \
	util-linux-dev \
#	vidstab-dev \
	wavpack-dev \
	x264-dev \
	x265-dev \
	xvidcore-dev \
	zeromq-dev \
	\
	linux-rpi \
	linux-rpi-dev \
	raspberrypi-libs \
	raspberrypi-dev


# AviSynth+ https://github.com/AviSynth/AviSynthPlus
WORKDIR /tmp/AviSynthPlus
RUN \
	curl -fsSL https://github.com/AviSynth/AviSynthPlus/archive/v${AVISYNTH_PLUS_VERSION}.tar.gz | \
		tar -xz --strip-components=1 && \
	mkdir avisynth-build && cd avisynth-build && \
	cmake ../ -DHEADERS_ONLY:bool=on && \
	make install

## bs2b http://bs2b.sourceforge.net/
WORKDIR /tmp/bs2b
RUN \
	curl -fsSL http://downloads.sourceforge.net/project/bs2b/libbs2b/${BS2B_VERSION}/libbs2b-${BS2B_VERSION}.tar.gz | \
		tar -xz --strip-components=1 && \
	cd ./build-aux && \
	curl -fsSL 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD' -o config.guess && \
	curl -fsSL 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD' -o config.sub && \
	cd ../ && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make ${MAKEFLAGS} && \
	make install

## Codec 2 https://github.com/drowe67/codec2/
WORKDIR /tmp/codec2
RUN \
	curl -fsSL https://github.com/drowe67/codec2/archive/v${CODEC2_VERSION}.tar.gz | \
		tar -xz --strip-components=1 && \
	mkdir codec2-build && cd codec2-build && \
	cmake ../ && \
	make install

## kvazaar https://github.com/ultravideo/kvazaar
WORKDIR /tmp/kvazaar
RUN \
	curl -fsSL https://github.com/ultravideo/kvazaar/archive/v${KVAZAAR_VERSION}.tar.gz | \
		tar -zx --strip-components=1 && \
	./autogen.sh && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make ${MAKEFLAGS} && \
	make install

## libmysofa https://github.com/hoene/libmysofa/
WORKDIR /tmp/libmysofa
RUN \
	curl -fsSL https://github.com/hoene/libmysofa/archive/v${LIBMYSOFA_VERSION}.tar.gz | \
		tar -xz --strip-components=1 && \
	mkdir libmysofa-build && cd libmysofa-build && \
	cmake ../ && \
	make install

## libsrt https://github.com/Haivision/srt
WORKDIR /tmp/srt
RUN \
	curl -fsSL https://github.com/Haivision/srt/archive/v${LIBSRT_VERSION}.tar.gz | \
		tar -xz --strip-components=1 && \
	cmake -DCMAKE_INSTALL_PREFIX="${PREFIX}" . && \
	make ${MAKEFLAGS} && \
	make install

## opencore-amr https://sourceforge.net/projects/opencore-amr/
WORKDIR /tmp/opencore
RUN \
	curl -fsSL https://versaweb.dl.sourceforge.net/project/opencore-amr/opencore-amr/opencore-amr-${OPENCOREAMR_VERSION}.tar.gz | \
		tar -zx --strip-components=1 && \
	./configure --prefix="${PREFIX}" --enable-shared  && \
	make ${MAKEFLAGS} && \
	make install

## TwoLAME https://www.twolame.org/
WORKDIR /tmp/twolame
RUN \
	curl -fsSL https://downloads.sourceforge.net/twolame/twolame-${TWOLAME_VERSION}.tar.gz | \
		tar -xz --strip-components=1 && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make ${MAKEFLAGS} && \
	make install

# libopenmpt - libportaudio http://www.portaudio.com/
WORKDIR /tmp/libportaudio
RUN \
	curl -fsSL http://www.portaudio.com/archives/pa_snapshot.tgz | \
		tar -xz --strip-components=1 && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make ${MAKEFLAGS} && \
	make install && \
	cd ./bindings/cpp && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make ${MAKEFLAGS} && \
	make install

# libopenmpt - libopenmpt https://lib.openmpt.org/libopenmpt/
WORKDIR /tmp/libopenmpt
RUN \
	curl -fsSL https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-0.5.0+release.autotools.tar.gz | \
		tar -xz --strip-components=1 && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make ${MAKEFLAGS} && \
	make install


## ffmpeg https://ffmpeg.org/
WORKDIR /tmp/ffmpeg
RUN  \
	mkdir -p /build${PREFIX}/bin/ && \
	curl -fsSL https://ffmpeg.org/releases/ffmpeg-4.1.6.tar.bz2 | \
		tar -jx --strip-components=1 && \
	./configure \
		--disable-debug \
		--disable-doc \
		--disable-ffplay \
		--disable-filter=resample \
		--disable-stripping \
		--disable-thumb \
		--enable-avisynth \
		--enable-avresample \
		--enable-chromaprint \
		--enable-fontconfig \
		--enable-frei0r \
		--enable-gpl \
#		--enable-ladspa \
		--enable-libaom \
		--enable-libass \
		--enable-libbluray \
		--enable-libbs2b \
		--enable-libcaca \
		--enable-libcdio \
		--enable-libcodec2 \
		--enable-libdc1394 \
		--enable-libdrm \
		--enable-libfdk_aac \
		--enable-libflite \
		--enable-libfontconfig \
		--enable-libfreetype \
		--enable-libfribidi \
#		--enable-libgme \
		--enable-libgsm \
##		--enable-libiec61883 \
		--enable-libjack \
		--enable-libkvazaar \
		--enable-libmp3lame \
		--enable-libmysofa \
		--enable-libopencore-amrnb \
		--enable-libopencore-amrwb \
		--enable-libopenjpeg \
		--enable-libopenmpt \
		--enable-libopus \
		--enable-libpulse \
		--enable-librsvg \
#		--enable-librubberband \
#		--enable-libshine \
		--enable-libsnappy \
		--enable-libsoxr \
		--enable-libspeex \
		--enable-libsrt \
		--enable-libssh \
		--enable-libtheora \
		--enable-libtwolame \
#		--enable-libvidstab \
		--enable-libvorbis \
		--enable-libvpx \
		--enable-libwavpack \
		--enable-libwebp \
		--enable-libx264 \
		--enable-libx265 \
		--enable-libxcb \
		--enable-libxml2 \
		--enable-libxvid \
		--enable-libzmq \
##		--enable-libzvbi \
#		--enable-lv2 \
		--enable-nonfree \
		--enable-openal \
		--enable-opengl \
		--enable-openssl \
		--enable-postproc \
		--enable-sdl2 \
		--enable-shared \
		--enable-small \
		--enable-version3 \
		--extra-cflags="-I${PREFIX}/include -I/opt/vc/include/IL" \
		--extra-ldflags="-L${PREFIX}/lib" \
		--extra-libs="-lpthread -lm" \
		--prefix="${PREFIX}" \
		\
		--enable-neon \
		--enable-v4l2_m2m \
		--enable-mmal \
		--enable-omx \
		--enable-omx-rpi && \
	make ${MAKEFLAGS} && \
	make install && \
	make tools/zmqsend && \
	cp tools/zmqsend /build${PREFIX}/bin/ && \
	make distclean && \
	hash -r && \
	cd tools && \
	make qt-faststart && \
	cp qt-faststart /build${PREFIX}/bin/


WORKDIR /tmp/build
COPY ./DockerTools/extractlibrary cp.sh
RUN chmod +x ./cp.sh
RUN echo /usr/local/bin/ffmpeg >> cplist
RUN echo /usr/local/bin/ffprobe >> cplist
RUN ./cp.sh cplist /build

RUN rm -rf /tmp/* /var/cache/apk/*


# final image
FROM alpine:3.12 AS release
LABEL maintainer "collelog <collelog.cavamin@gmail.com>"

ENV LD_LIBRARY_PATH=/opt/vc/lib:/usr/local/lib:/usr/lib:/lib

COPY --from=ffmpeg-build /build /
COPY --from=ffmpeg-build /build /build

RUN set -eux && \
	apk upgrade --update && \
	apk add --no-cache --update \
		linux-rpi \
		raspberrypi-libs && \
	\
	# cleaning
	rm -rf /tmp/* /var/cache/apk/*

CMD  ["--help"]
ENTRYPOINT  ["ffmpeg"]
