#!/bin/sh
#
# intLabs TeamPostgresql Docker File
#
# https://github.com/intlabs/TeamPostgresql
#
# Copyright 2014 Pete Birley
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Build base container image
sudo docker build -t="intlabs/TeamPostgresql" github.com/intlabs/TeamPostgresql

echo ""
echo "*****************************************************"
echo "*                                                   *"
echo "*         Built base container image                *"
echo "*                                                   *"
echo "*****************************************************"
echo ""

# Make shared directory on host
sudo mkdir -p "/CannyOS/build/TeamPostgresql"
# Ensure that there it is clear
sudo rm -r -f "/CannyOS/build/TeamPostgresql/*"

# Remove any existing containers
sudo docker stop connectedgovernment-postgres
sudo docker rm connectedgovernment-postgres

# Launch built base container image
sudo docker run -i -t -d \
 --volume "/CannyOS/build/TeamPostgresql":"/CannyOS/Host" \
 --name "TeamPostgresql" \
 --hostname "TeamPostgresql" \
 --user "root" \
 -p 8082:8082\
 intlabs/TeamPostgresql 