#!/bin/bash -xe
REPO="big:5000"
baseimages="ghc base"
exportimages="kakapo relay hbgp bird frr"
for i in $baseimages $exportimages ; do docker build -t $i $i ; done
for ei in $exportimages ; do docker tag ${ei} ${REPO}/${ei}; docker push ${REPO}/${ei} ; done
