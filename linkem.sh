#!/bin/bash

component_dirs='binutils-2.42 gcc-13.2.0 newlib-4.4.0.20231231'
#component_dirs='binutils-2.18.50 gcc-4.2.2 gdb-6.8'
unified_src=srcw

mkdir -p ${unified_src}
cd ${unified_src}
ignore_list=". .. CVS .svn .git"
    
for srcdir in ${component_dirs}
do
    echo "Component: $srcdir"
    case srcdir
        in
        /* | [A-Za-z]:[\\/]*)
            ;;
            
        *)
            srcdir="../${srcdir}"
            ;;
    esac
        
    files=`ls -a ${srcdir}`
        
    for f in ${files}
    do
        found=
            
        for i in ${ignore_list}
        do
            if [ "$f" = "$i" ]
            then
                found=yes
            fi
        done
            
        if [ -z "${found}" ]
        then
            echo "$f            ..linked"
            ln -s ${srcdir}/$f .
        fi
    done

    ignore_list="${ignore_list} ${files}"
done

cd ..
