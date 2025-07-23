#!/usr/bin/env bash

# Run desktop installers
for installer in ~/www/setup-ubuntu/install/desktop/*.sh; do source $installer; done