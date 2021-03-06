#!/bin/bash

echo "start"

install_nvm(){
  if [ -z $NVM_DIR ]
  then
    export NVM_DIR="$HOME/.nvm"
  else
    export NVM_DIR
  fi

  echo $NVM_DIR
  echo "$(ls -a $NVM_DIR)"
  if [ -s "$NVM_DIR/nvm.sh" ]
  then
    . "$NVM_DIR/nvm.sh"
  else
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
    . "$NVM_DIR/nvm.sh"
  fi
}

install_nvm && echo "install_nvm completed" && nvm install 8.2.1 && nvm use 8.2.1 
 
 npm install yarn --no-save --registry=https://registry.npm.taobao.org --prefer-offline
  echo "yarn is installed"
  ./node_modules/yarn/bin/yarn install --registry https://registry.npm.taobao.org/ --prefer-offline
  npm run build && echo 'build finish'

