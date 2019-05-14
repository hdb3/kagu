export REPO="big:5000/"
docker build -t ${REPO}${1} ${1} && docker push ${REPO}${1}
