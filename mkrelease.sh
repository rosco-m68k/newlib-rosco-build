#!/bin/bash
#
#
set -e

TMPDIR=$(mktemp -d)
VERSION=$(date -u +%Y%m%d%H%M%S)

pushd $TMPDIR
git clone https://github.com/rosco-m68k/newlib-rosco-build.git
cd newlib-rosco-build
git submodule update --init --recursive
find . -name '.git*' -print0 | xargs -0 rm -rf
cd ..
mv newlib-rosco-build rosco-m68k-toolchain-$VERSION
tar czf rosco-m68k-toolchain-$VERSION.tar.gz rosco-m68k-toolchain-$VERSION
zip -r rosco-m68k-toolchain-$VERSION.zip rosco-m68k-toolchain-$VERSION
popd
mv $TMPDIR/rosco-m68k-toolchain-$VERSION.tar.gz $TMPDIR/rosco-m68k-toolchain-$VERSION.zip .
rm -rf $TMPDIR

