#!/bin/bash
set -x
function usage()
{
    echo "Usage: $0 docker [docker-image]"
    exit 1
}
function check_docker_installed()
{
    local ret=$1
    local ver=""
    local installed='255'

    echo "# Step.$STEPS Check docker whether already installed?"

    ver=`docker --version`
    installed=`echo $?`
    if [ "$installed" -eq '0' ]; then
        echo "-- $ver"
    else
        echo "-- not found docker."
    fi
    STEPS=$(($STEPS+1))

    eval $ret="'$installed'"
}
function check_docker_image_exist()
{
    local ret=$1
    local id=""
    local existed='255'

    echo "# Step.$STEPS Check docker image of arch whether existed?"
    echo "-- Required docker image: $DOCKER_IMG"

    id=`docker images -q $DOCKER_IMG| head -n 1`
    if [ "$id" != "" ]; then
        echo "--- Image ID - $id"
        existed=0
    else
        echo "-- not found $DOCKER_IMG"
    fi
    STEPS=$(($STEPS+1))

    eval $ret="'$existed'"
}
function get_same_container_num()
{
    local ret=$1
    local count='0'

    echo "# Step.$STEPS Get the number of same container."

    count=`docker ps -a| grep $2| wc -l`
    STEPS=$(($STEPS+1))

    eval $ret="'$count'"
}
function setup_dotfiles()
{
    echo "# Step.$STEPS Setup dotfiles."

    for dotfile in $DOTFILES; do
        cp $REPO/$DOTDIR/$dotfile $VOL/.$dotfile
    done

    mkdir -p $VOL/.vim && cp -R $REPO/$DOTDIR/vim/* $VOL/.vim/
    cp $REPO/$DOTDIR/vim/vimrc $VOL/.vimrc

    STEPS=$(($STEPS+1))
}

STEPS=1

DOTDIR="dotfiles"
DOTFILES="git-completion.sh git-prompt.sh gitconfig bashrc bash_profile"
WORK_DIR="Workspace"

VOL_NAME="docker-work-area"
REPO="$HOME/$WORK_DIR/WorkEnvSetup"

case $1 in
    docker)
        if [ "$2" == "" ]; then
            usage
            exit -1
        fi
        DOCKER_BASE_NAME=${2#*/}
        DOCKER_IMG=$2
        VOL="$HOME/$WORK_DIR/$VOL_NAME"
        order=0

        if [ ! -d $VOL ]; then
            mkdir $VOL
        fi

        check_docker_installed res
        [ "$res" -ne 0 ] && exit -1

        check_docker_image_exist res
        [ "$res" -ne 0 ] && exit -1

        get_same_container_num order $DOCKER_BASE_NAME
        order=$(($order+1))
        DOCKER_NAME="${DOCKER_IMG//\//-}-$order"

        setup_dotfiles

        docker run -it --rm -w /home/jeremysu -v $VOL:/home/jeremysu \
        --device=/dev/ttyUSB0 --name $DOCKER_NAME $DOCKER_IMG
        ;;
    *)
        usage
esac
