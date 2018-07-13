#!/bin/bash

set -e

NODE_INSTALLER="$1"

npm i -g yarn
npm i -g bolt@0.20.1

cd /code

bolt
bolt build
bolt lint

DEBUG=electron-installer-snap:snapcraft CI=true bolt ws test -- --installer=$NODE_INSTALLER
