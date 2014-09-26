#
# TeamPostgresql installer
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

FROM ubuntu
RUN curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/TeamPostgresql-installer.sh | bash

CMD ["java -cp webapp/WEB-INF/lib/log4j-1.2.17.jar-1.0.jar:webapp/WEB-INF/classes:webapp/WEB-INF/lib/* dbexplorer.TeamPostgreSQL 8082"]
