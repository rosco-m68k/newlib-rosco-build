On local:

* Build release archives (`sh mkrelease.sh`)

On Github:

* Create release
  * Tag should be `v<RELEASENUM>` from archives
  * Release notes etc as applicable
  * Upload both binaries as artifacts


In homebrew-toolchain repo:

* Update formula (to use release tarball from this repo)
* Delete old bottles (and config therefore)
* Build new bottles
* Upload new bottles to rosco-m68k.com
* Update formula again with bottle idents

  

