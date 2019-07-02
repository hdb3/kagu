#!/bin/bash -xe
REPO="localrepo:5000"
baseimages="stack base"
exportimages="kakapo relay hbgp bird2 bird frr bgpd"
for i in $baseimages $exportimages ; do docker build -t $i $i ; done
for ei in $exportimages ; do docker tag ${ei} ${REPO}/${ei}; docker push ${REPO}/${ei} ; done
