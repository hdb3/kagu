sudo docker build -t big:5000/ghc ghc && sudo docker push big:5000/ghc
sudo docker build -t big:5000/base ghc && sudo docker push big:5000/base
sudo docker build -t big:5000/kakapo kakapo && sudo docker push big:5000/kakapo
sudo docker build -t big:5000/relay relay && sudo docker push big:5000/relay
sudo docker build -t big:5000/hbgp hbgp && sudo docker push big:5000/hbgp
sudo docker build -t big:5000/bird bird && sudo docker push big:5000/bird
sudo docker build -t big:5000/frr frr && sudo docker push big:5000/frr
