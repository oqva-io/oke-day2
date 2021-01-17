#!/bin/bash

go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb
brew install jsonnet

tmp_folder="tmp"
flux_repo="https://github.com/kubernetes-monitoring/kubernetes-mixin"
mkdir $tmp_folder || echo "tmp folder exists"
git clone $flux_repo $tmp_folder || rm -rf tmp && git clone $flux_repo $tmp_folder

cd $tmp_folder && jb install && make dashboards_out && cd ..
cp ./tmp/dashboards_out/* ./charts/k8s-observability/dashboards/