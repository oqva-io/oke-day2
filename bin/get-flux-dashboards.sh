#!/bin/bash

tmp_folder="tmp"
flux_repo="https://github.com/fluxcd/flux2.git"
mkdir $tmp_folder || echo "tmp folder exists"
git clone $flux_repo $tmp_folder || rm -rf tmp && git clone $flux_repo $tmp_folder
cp ./tmp/manifests/monitoring/grafana/dashboards/* ./charts/k8s-observability/dashboards/