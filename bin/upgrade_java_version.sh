#!/usr/bin/env bash

set -euox pipefail

OLD_JAVA_VERSION=11

if [ -n "$1" ]; then
  NEW_JAVA_VERSION="$1"

  echo "Upgrading from java ${OLD_JAVA_VERSION} to ${NEW_JAVA_VERSION}"

  grep -rl "source=$OLD_JAVA_VERSION" ./ | xargs sed -i 's/source=$OLD_JAVA_VERSION/source=$NEW_JAVA_VERSION/g'
  grep -rl "compliance=$OLD_JAVA_VERSION" ./ | xargs sed -i 's/compliance=$OLD_JAVA_VERSION/compliance=$NEW_JAVA_VERSION/g'
  grep -rl "targetPlatform=$OLD_JAVA_VERSION" ./ | xargs sed -i 's/targetPlatform=$OLD_JAVA_VERSION/targetPlatform=$NEW_JAVA_VERSION/g'
  grep -rl "JavaSE-$OLD_JAVA_VERSION" ./ | xargs -d '\n' sed -i 's/JavaSE-$OLD_JAVA_VERSION/JavaSE-$NEW_JAVA_VERSION/g'
else
  echo "Usage: upgrade-java-version.sh <java-version>"
fi
