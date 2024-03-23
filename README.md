## Fetch submodules

```shell
git submodule update
```

## Create unified source directory

```shell
sh linkem.sh
```

## Make a build directory

```shell
mkdir build-all
cd build-all
```

## Configure

```shell
../srcw/configure --target=m68k-elf-rosco --enable-languages=c,c++ --with-newlib --with-arch=m68k --with-cpu=m68000 --prefix="$HOME/opt/cross-newlib" --disable-debug --disable-dependency-tracking --disable-silent-rules --disable-nls
```

## Build (takes a while)

```shell
make -j9 all-build all-binutils all-gas all-ld all-gcc all-target-libgcc all-target-newlib all-target-libgloss
```

## Install

```shell
make install-binutils install-gas install-ld install-gcc install-target-libgcc install-target-newlib install-target-libgloss
```

## Test

```shell
cd ..
PATH="~/opt/cross-newlib/bin:$PATH" m68k-elf-rosco-gcc -o test.elf test.c
m68k-elf-objcopy -O binary test.elf test.bin
```

