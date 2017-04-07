#!/bin/zsh
# appendPath(newPath)
# 如果newPath 已经在PATH下了， 则不添加
appendPath(){
    addPath="$1"
    if [ -d $addPath ]; then
        PATH="${PATH/:$addPath}"     # remove if already there (包括分隔符，)
        PATH="${PATH/$addPath}"      # remove if already there (不包括分隔符,主要在行首时)
        export PATH=$PATH:$addPath
    fi    
}
prependPath(){
    addPath="$1"
    if [ -d $addPath ]; then
        PATH="${PATH/:$addPath}"     # remove if already there (包括分隔符，)
        PATH="${PATH/$addPath}"      # remove if already there (不包括分隔符,主要在行首时)
        export PATH=$addPath:$PATH
    fi    
}


prependPath "$HOME/bin"
appendPath "$HOME/.emacs.d/bin"
appendPath "/usr/local/mysql/bin"
appendPath "/usr/local/sbin"
prependPath "/usr/local/bin"
# appendPath "$HOME/go_appengine"
if [ "$HOME/Library/Android/sdk" ]; then
    export ANDROID_HOME=$HOME/Library/Android/sdk 
    appendPath "$HOME/Library/Android/sdk/platform-tools"
    appendPath "$HOME/Library/Android/sdk/tools"
fi
if [ -d /usr/local/opt/android-sdk ]; then
    export ANDROID_HOME=/usr/local/opt/android-sdk
    export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
    prependPath "$ANDROID_HOME/bin"
    prependPath "$ANDROID_HOME/tools"
    prependPath "$ANDROID_HOME/platform-tools"
fi
if [ "$HOME/Library/Android/ndk" ]; then
    export NDK_ROOT=$HOME/Library/Android/ndk
    export ANDROID_NDK_ROOT=$HOME/Library/Android/ndk
    prependPath "$NDK_ROOT/bin"
fi

if [ -d /usr/local/opt/android-ndk ]; then
    export NDK_ROOT=/usr/local/opt/android-ndk 
    export ANDROID_NDK_ROOT=/usr/local/opt/android-ndk 
    prependPath "$NDK_ROOT/bin"
fi


if [ -d /Applications/adt-bundle-mac-x86_64-20140321 ]; then
    appendPath "/Applications/adt-bundle-mac-x86_64-20140321/sdk/platform-tools"
    appendPath "/Applications/adt-bundle-mac-x86_64-20140321/sdk/tools"
fi

# if [ -d /Library/Frameworks/Python.framework/Versions/3.4/lib/pkgconfig ]; then
#     export PKG_CONFIG_PATH=/Library/Frameworks/Python.framework/Versions/3.4/lib/pkgconfig
# fi

if [ -d $HOME/python/bin/ ]; then
    source $HOME/python/bin/activate
fi
if [ -d /usr/local/java ]; then
    export JAVA_HOME=/usr/local/java
    appendPath "/usr/local/java/bin"
fi
if [ -d /usr/share/jdk ]; then
    export JAVA_HOME=/usr/share/jdk
    appendPath "/usr/share/jdk/bin"
fi


if [ -d /Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home ]; then
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home    
fi

if [ $(uname -s ) = "Darwin" ] ; then
    export JAVA_HOME=`/usr/libexec/java_home`
    #launchctl setenv PATH $PATH
fi

if [ -x ~/.emacs.d/bin/em ]; then
    export EDITOR=~/.emacs.d/bin/em
fi

export GOTRACEBACK=crash prog

export NODE_PATH=/usr/local/lib/node_modules

# # Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# export COCOS_CONSOLE_ROOT=~/repos/cocos2d-x-3/tools/cocos2d-console/bin
# export PATH=$COCOS_CONSOLE_ROOT:$PATH

# # Add environment variable COCOS_X_ROOT for cocos2d-x
# export COCOS_X_ROOT=~/repos
# export PATH=$COCOS_X_ROOT:$PATH

# # Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
# export COCOS_TEMPLATES_ROOT=~/repos/cocos2d-x-3/templates
# export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# # Add environment variable ANT_ROOT for cocos2d-x
# export ANT_ROOT=/usr/local/Cellar/ant/1.9.7/bin
# export PATH=$ANT_ROOT:$PATH


if [ -d /usr/local/go ]; then
    export GOROOT=/usr/local/go
fi
if [ -d /usr/local/opt/go/libexec ]; then
    export GOROOT=/usr/local/opt/go/libexec 
fi
appendPath "$GOROOT/bin"
if [ -d $HOME/go ]; then
	export GOPATH=$HOME/go
else
	export GOPATH=$HOME/repos/proj_golang
fi
appendPath "$GOPATH/bin"
appendPath "/usr/local/texlive/2016/bin/x86_64-darwin"

if [ -d /usr/local/include/ ]; then
    export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/local/include/
    export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/
    export OBJC_INCLUDE_PATH=$OBJC_INCLUDE_PATH:/usr/local/include/
fi
if [ -d /usr/local/lib/ ]; then
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
fi
if [ -d /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include ]; then
    export C_INCLUDE_PATH=$C_INCLUDE_PATH:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include 
    export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include 
    export OBJC_INCLUDE_PATH=$OBJC_INCLUDE_PATH:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include 
fi
if [ -d /usr/local/opt/opencv3 ]; then
    export OpenCV_DIR=/usr/local/opt/opencv3
    export C_INCLUDE_PATH=$C_INCLUDE_PATH:$OpenCV_DIR/include
    export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$OpenCV_DIR/include
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OpenCV_DIR/lib
fi
if [ ! -f /tmp/.zsh-evn-launchctl  ] ; then
    touch /tmp/.zsh-evn-launchctl
    for var in `env`; do
        env_name=`echo  $var | cut -d "=" -f 1`
        env_value=`echo  $var | cut -d "=" -f 2`
        if [ ! -z $env_value ] && [ $env_name != "PS1" ] && [ $env_name != "_" ] ;then
            launchctl setenv $env_name $env_value
        fi
    done
fi

