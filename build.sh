for image in base bird2 frr
  do docker build -t $image $image
done
