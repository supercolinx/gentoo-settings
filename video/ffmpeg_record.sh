#!/bin/sh
# @file		record.sh
# @author	Colin X
# @data		Fri Nov  7 22:32:20 2025
# @description: USE="nvenc" ffmpeg
OUTPUT="ffmpeg_$(date +%Y%m%d_%H%M%S).mp4"

#ffmpeg \
#	-hwaccel cuda \			# 启用cuda硬件加速解码
#	-hwaccel_output_format cuda \	# 指定硬件加速输出格式为cuda
#	-probesize 64M \		# 
#	-f x11grab \			# 指定输入格式为X11屏幕抓取
#	-video_size 2560x1440 \		# 设置录制区域的分辨率
#	-framerate 60 \			# 设置录制帧率
#	-i :0.0+0,0 \			# 指定输入源和位置
#	-f alsa \			# 指定音频输入格式为ALSA
#	-ac 6 \				# 设置音频声道数(1,2,6)
#	-ar 48000 \			# 设置音频采样率(44100,48000,96000)
#	-i default \			# 指定音频设备
#	-c:v h264_nvenc \		# ffmpeg -encoders | grep nvenc
#	-preset p6 \			# 设置编码速度与质量平衡(1,2,3,4,5,6,7)
#	-tune hq \			# 优化编码器针对特定内容(hq,ll,ull,lossless)
#	-rc vbr \			# 设置码率控制模式(vbr, cbr, constqp)
#	-b:v 20M \	# 设置视频目标码率(720p:3-5, 1080p:8-12, 1440p:15-20, 4K: 25-40)
#	-maxrate 40M \	# 设置最大码率(通常设置为目标码率的1.5-2倍)
#	-profile:v high \	# 设置H.264编码档次(baseline, main, high)
#	-level 5.1 \		# 设置H.264级别(4.0, 4.1, 5.0, 5.1)
#	-c:a aac \		# 音频编码器(mp3, opus, flac)
#	-b:a 320k \		# 设置音频码率(96, 128, 192, 320)
#	-ac 6 \			# 输出音频声道数
#	-movflags +faststart \	# 优化MP4文件用于网络流媒体, 允许视频在完全下载前开始播放
#	-fflags +genpts \	# 生成缺失的PTS(呈现时间戳)
#	-vsync 1 \		# 视频帧率同步方法(0, 1:CFR, 2:VFR)
#	"$OUTPUT"

ffmpeg \
	-hwaccel cuda \
	-hwaccel_output_format cuda \
	-probesize 64M \
	-f x11grab \
	-video_size 2560x1440 \
	-framerate 60 \
	-i :0.0+0,0 \
	-f alsa \
	-ac 2 \
	-ar 48000 \
	-channel_layout stereo \
	-i default \
	-c:v h264_nvenc \
	-preset p6 \
	-tune hq \
	-rc vbr \
	-b:v 20M \
	-maxrate 40M \
	-profile:v high \
	-level 5.1 \
	-c:a aac \
	-b:a 320k \
	-ac 2 \
	-movflags +faststart \
	-fflags +genpts \
	-fps_mode cfr \
	"$OUTPUT"
