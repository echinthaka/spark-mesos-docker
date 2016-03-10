REGISTRY_REPO=$1
RELEASE_TAG=$2

cd $REGISTRY_REPO

echo "====> Building docker image with tag=$REGISTRY_REPO:$RELEASE_TAG"
docker build --tag=$REGISTRY_REPO:$RELEASE_TAG ./

echo "====> Tagging the docker image"
docker tag -f $REGISTRY_REPO:$RELEASE_TAG echinthaka/$REGISTRY_REPO:$RELEASE_TAG

docker login --username=echinthaka --email=eran.chinthaka@gmail.com

echo "====> Pushing the docker image"
docker push echinthaka/$REGISTRY_REPO:$RELEASE_TAG
