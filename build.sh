sudo docker build --no-cache -t hdb3/ghc ghc && sudo docker push hdb3/ghc
sudo docker build --no-cache -t hdb3/base ghc && sudo docker push hdb3/base
sudo docker build --no-cache -t hdb3/kakapo kakapo && sudo docker push hdb3/kakapo
sudo docker build --no-cache -t hdb3/relay relay && sudo docker push hdb3/relay
sudo docker build --no-cache -t hdb3/hbgp hbgp && sudo docker push hdb3/hbgp
sudo docker build --no-cache -t hdb3/bird bird && sudo docker push hdb3/bird
sudo docker build --no-cache -t hdb3/frr frr && sudo docker push hdb3/frr
