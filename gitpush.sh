#!/bin/bash

read -p "Введите Сообщение коммита: " MESSAGE

APP_CORE='../../core/components/app'
APP_ASSETS='../../assets/components/app'
BUILD_CORE='core/components/app'
BUILD_ASSETS='assets/components/app'

if [ -L $BUILD_ASSETS ]
then
    echo 'Unlink assets'
    unlink $BUILD_ASSETS

    echo 'Copying assets'
    cp -rf $APP_ASSETS $BUILD_ASSETS
else
    echo 'Assets not symlink'
fi

if [ -L $BUILD_CORE ]
then
    echo 'Unlink core'
    unlink $BUILD_CORE

    echo 'Copying core'
    cp -rf $APP_CORE $BUILD_CORE
else
    echo 'Core not symlink'
fi

git add ./
git commit -m $MESSAGE
git push