#!/bin/bash

for url in $(cat $1)
do
  echo curl -LO $url
  curl -LO $url
done
