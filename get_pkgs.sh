#!/bin/bash -ex

get_pkg() {
  mkdir -p deb
  mkdir -p files
  pushd deb
  apt download $1
  popd
  dpkg -X deb/$1* files
}
  

get_pkgs() {
  for pkg in frr gobgpd bird
  do
    get_pkg $pkg
  done
}
  

main() {
  get_pkgs
  pushd files
  tar cfv ../pkgs.tar *
  popd
  mv pkgs.tar $1
}


CALLER=$PWD
WORKDIR=`mktemp -d`
pushd $WORKDIR
main $CALLER
popd
rm -rf $WORKDIR

mkdir -p bin/frr bin/gobgp bin/bird
tar xfv pkgs.tar --one-top-level=bin/frr usr/lib/frr/bgpd
tar xfv pkgs.tar --one-top-level=bin/gobgp usr/bin/gobgpd
