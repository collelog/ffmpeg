# FFmpeg
FROM collelog/buildenv:alpine AS ffmpeg-build

ENV LD_LIBRARY_PATH=/opt/intel/mediasdk/lib64:/usr/local/lib64:/usr/local/lib:/usr/lib:/lib
ENV PKG_CONFIG_PATH=/opt/intel/mediasdk/lib64/pkgconfig:/usr/local/lib64/pkgconfig:/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:/lib/pkgconfig
ENV SRC=/usr/local
ENV PREFIX=/usr/local

RUN apk add --no-cache --update-cache \
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
	lame-dev \
	libass-dev \
	libbluray-dev \
	libcaca-dev \
	libcdio-dev \
	libcdio-paranoia-dev \
	libdc1394-dev \
	libdrm-dev \
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
	mesa-dev \
	mpg123-dev \
	openjpeg-dev \
	openal-soft-dev \
	openssl-dev \
	opus-dev \
	pulseaudio-dev \
	sdl2-dev \
	snappy-dev \
	soxr-dev \
	speex-dev \
	util-linux-dev \
	wavpack-dev \
	x264-dev \
	x265-dev \
	xvidcore-dev \
	zeromq-dev \
	\
	libva-dev \
	libva-intel-driver \
	libvdpau-dev \
	mesa-va-gallium \
	mesa-vdpau-gallium

RUN echo http://dl-2.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --no-cache --update-cache \
	libgme-dev \
	lilv-dev \
	rubberband-dev \
	shine \
	vidstab-dev \
	\
	libva-vdpau-driver

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN apk add --no-cache --update-cache \
	ladspa-dev \
#	libiec61883-dev
	\
	intel-media-driver


# AviSynth+ https://github.com/AviSynth/AviSynthPlus
WORKDIR /tmp/AviSynthPlus
RUN \
	curl -fsSL https://github.com/AviSynth/AviSynthPlus/archive/v3.6.1.tar.gz | \
		tar -xz --strip-components=1 && \
	mkdir avisynth-build && cd avisynth-build && \
	cmake -DCMAKE_BUILD_TYPE=Release ../ -DHEADERS_ONLY:bool=on && \
	make -j $(nproc) install

## bs2b http://bs2b.sourceforge.net/
WORKDIR /tmp/bs2b
RUN \
	curl -fsSL https://downloads.sourceforge.net/project/bs2b/libbs2b/3.1.0/libbs2b-3.1.0.tar.gz | \
		tar -xz --strip-components=1 && \
	cd ./build-aux && \
	curl -fsSL 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD' -o config.guess && \
	curl -fsSL 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD' -o config.sub && \
	cd ../ && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make -j $(nproc) && \
	make -j $(nproc) install

## Codec 2 https://github.com/drowe67/codec2/
WORKDIR /tmp/codec2
RUN \
	curl -fsSL https://github.com/drowe67/codec2/archive/v0.9.2.tar.gz | \
		tar -xz --strip-components=1 && \
	mkdir codec2-build && cd codec2-build && \
	cmake -DCMAKE_BUILD_TYPE=Release ../ && \
	make -j $(nproc) install

## kvazaar https://github.com/ultravideo/kvazaar
WORKDIR /tmp/kvazaar
RUN \
	curl -fsSL https://github.com/ultravideo/kvazaar/archive/v2.0.0.tar.gz | \
		tar -zx --strip-components=1 && \
	./autogen.sh && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make -j $(nproc) && \
	make -j $(nproc) install

## libmysofa https://github.com/hoene/libmysofa/
WORKDIR /tmp/libmysofa
RUN \
	curl -fsSL https://github.com/hoene/libmysofa/archive/v1.1.tar.gz | \
		tar -xz --strip-components=1 && \
	mkdir libmysofa-build && cd libmysofa-build && \
	cmake -DCMAKE_BUILD_TYPE=Release ../ && \
	make -j $(nproc) install

## libsrt https://github.com/Haivision/srt
WORKDIR /tmp/srt
RUN \
	curl -fsSL https://github.com/Haivision/srt/archive/v1.4.1.tar.gz | \
		tar -xz --strip-components=1 && \
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${PREFIX}" . && \
	make -j $(nproc) && \
	make -j $(nproc) install

## opencore-amr https://sourceforge.net/projects/opencore-amr/
WORKDIR /tmp/opencore
RUN \
	curl -fsSL https://versaweb.dl.sourceforge.net/project/opencore-amr/opencore-amr/opencore-amr-0.1.5.tar.gz | \
		tar -zx --strip-components=1 && \
	./configure --prefix="${PREFIX}" --enable-shared  && \
	make -j $(nproc) && \
	make -j $(nproc) install

## TwoLAME https://www.twolame.org/
WORKDIR /tmp/twolame
RUN \
	curl -fsSL https://downloads.sourceforge.net/twolame/twolame-0.4.0.tar.gz | \
		tar -xz --strip-components=1 && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make -j $(nproc) && \
	make -j $(nproc) install

# libopenmpt - libportaudio http://www.portaudio.com/
WORKDIR /tmp/libportaudio
RUN \
	curl -fsSL http://www.portaudio.com/archives/pa_snapshot.tgz | \
		tar -xz --strip-components=1 && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make -j $(nproc) && \
	make -j $(nproc) install && \
	cd ./bindings/cpp && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make -j $(nproc) && \
	make -j $(nproc) install

# libopenmpt - libopenmpt https://lib.openmpt.org/libopenmpt/
WORKDIR /tmp/libopenmpt
RUN \
	curl -fsSL https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-0.5.0+release.autotools.tar.gz | \
		tar -xz --strip-components=1 && \
	./configure --prefix="${PREFIX}" --disable-static --enable-shared && \
	make -j $(nproc) && \
	make -j $(nproc) install

# Intel-Media-SDK https://github.com/Intel-Media-SDK/MediaSDK/
WORKDIR /tmp/libmfx
RUN \
	curl -fsSL https://github.com/Intel-Media-SDK/MediaSDK/archive/intel-mediasdk-20.1.1.tar.gz | \
		tar -xz --strip-components=1 && \
	mkdir libmfx-build && cd libmfx-build && \
	cmake -DCMAKE_BUILD_TYPE=MinSizeRel ../ && \
	make -j $(nproc) && \
	make -j $(nproc) install

ENV CFLAGS="-O2 -pipe -march=x86-64 -mtune=generic"
ENV CXXFLAGS="-O2 -pipe -march=x86-64 -mtune=generic"

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
		--enable-ladspa \
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
		--enable-libgme \
		--enable-libgsm \
#		--enable-libiec61883 \
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
		--enable-librubberband \
		--enable-libshine \
		--enable-libsnappy \
		--enable-libsoxr \
		--enable-libspeex \
		--enable-libsrt \
		--enable-libssh \
		--enable-libtheora \
		--enable-libtwolame \
		--enable-libvidstab \
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
#		--enable-libzvbi \
		--enable-lv2 \
		--enable-nonfree \
		--enable-openal \
		--enable-opengl \
		--enable-openssl \
		--enable-postproc \
		--enable-sdl2 \
		--enable-shared \
		--enable-version3 \
		--extra-cflags="-I${PREFIX}/include ${CFLAGS}" \
		--extra-cxxflags="-I${PREFIX}/include ${CXXFLAGS}" \
		--extra-ldflags="-L${PREFIX}/lib" \
		--extra-libs="-lpthread -lm" \
		--prefix="${PREFIX}" \
		\
		--enable-libmfx \
		--enable-vaapi \
		--enable-vdpau && \
	make -j $(nproc) && \
	make -j $(nproc) install && \
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

RUN cp --archive --parents --no-dereference /opt/intel /build

RUN rm -rf /tmp/* /var/cache/apk/*


# final image
FROM alpine:3.13.5 AS release
LABEL maintainer "collelog <collelog.cavamin@gmail.com>"

ENV LD_LIBRARY_PATH=/opt/intel/mediasdk/lib64:/usr/local/lib64:/usr/local/lib:/usr/lib:/lib

COPY --from=ffmpeg-build /build /
COPY --from=ffmpeg-build /build /build

RUN set -eux && \
	apk upgrade --no-cache --update-cache && \
	apk add --no-cache --update-cache \
		libva-intel-driver \
		mesa-va-gallium \
		mesa-vdpau-gallium && \
	echo http://dl-2.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add --no-cache --update-cache \
		intel-media-driver && \
	echo http://dl-2.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
	apk add --no-cache --update-cache \
		libva-vdpau-driver && \
	\
	# cleaning
	rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT  ["ffmpeg"]
CMD  ["--help"]
