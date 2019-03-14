#!/bin/sh

# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# These steps must be executed once the host /var and /lib volumes have
# been mounted, and therefore cannot be done in the docker build stage.

# Set env_variables for Certifying to use .JSON-file
_ServiceAccount_Filename=xxxx

# For creating fluentd service key
mkdir -p /etc/fluentd/svc_key
echo `cat ./$_ServiceAccount_Filename` > /etc/fluentd/svc_key/access_gcs_service_key.json

# For systems without journald
mkdir -p /var/log/journal

exec /usr/local/bin/fluentd "$@"
