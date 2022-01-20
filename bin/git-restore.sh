#!/usr/bin/env bash

# Restore the .classpath files that get automatically overwritten by eclipse

classpathFiles=(
  com-mmxlabs-lngdataserver-web-navigator/.classpath
  com-mmxlabs-lngdataserver-web-navigator/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-central/.classpath
  com-mmxlabs-lngdataservice-central/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-common/.classpath
  com-mmxlabs-lngdataservice-common/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-generic-data/.classpath
  com-mmxlabs-lngdataservice-generic-data/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-hub/.classpath
  com-mmxlabs-lngdataservice-hub/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-k/.classpath
  com-mmxlabs-lngdataservice-k/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-m/.classpath
  com-mmxlabs-lngdataservice-m/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-p/.classpath
  com-mmxlabs-lngdataservice-p/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-pricing/.classpath
  com-mmxlabs-lngdataservice-pricing/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-q/.classpath
  com-mmxlabs-lngdataservice-q/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-r/.classpath
  com-mmxlabs-lngdataservice-r/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-s/.classpath
  com-mmxlabs-lngdataservice-s/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-scenarios/.classpath
  com-mmxlabs-lngdataservice-scenarios/.settings/org.eclipse.jdt.core.prefs
  com-mmxlabs-lngdataservice-v/.classpath
  com-mmxlabs-lngdataservice-v/.settings/org.eclipse.jdt.core.prefs
)

for file in ${classpathFiles[@]}; do
  # echo $file
  git restore $file
done
