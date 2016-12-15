#!/bin/bash
add_x(){
    file=$1
    if [ ! -x $file ];then
        chmod u+x $file
    fi
}
current_dir=`pwd`
build_dir=$current_dir/builds
if [ ! -e $build_dir ];then
    mkdir -p $build_dir
fi
root_dir=`readlink -f $current_dir/../`
source_dir="${root_dir}/source"
cmd="$source_dir/configure \
    --prefix=$build_dir \
    --disable-shared \
    --enable-static  \
    "
    #--disable-x11-shared \
    #--disable-video-x11 \
    #--disable-video-x11-dgamouse \
    #--disable-video-x11-vm   \
    #--disable-video-x11-xv   \
    #--disable-video-x11-xinerama \
    #--disable-video-x11-xme  \
    #--disable-video-x11-xrandr \
    #--disable-dga \
    #--disable-video-dga \

add_x ${source_dir}/configure
cd $build_dir
echo $cmd
eval $cmd
make && make install
cd -
