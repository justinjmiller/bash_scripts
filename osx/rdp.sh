#! /bin/bash
rdpConfigDir=~/Documents/RDP/
rdpTemplateFile=${rdpConfigDir}template.rdp
rdpHost=${1}
rdpHostFile=${rdpConfigDir}${rdpHost}.rdp
rdpRunCommand="/Applications/Microsoft Remote Desktop.app/Contents/MacOS/Microsoft Remote Desktop"

echo "rdp config is: " ${rdpHostFile}

if [ ! -f ${rdpHostFile} ]; then
  echo -n "No config file found named  "${rdpHostFile}". Would you like to use the template? [N]"
  read answer
  if [ "${answer}" == "y" ]; then
    cp -f ${rdpTemplateFile} ${rdpHostFile}
    sed -i '' "s|template|${rdpHost}|g" ${rdpHostFile}
  else
    exit
  fi
fi
echo "opening ${rdpHostFile}"
open -na "${rdpRunCommand}" --args ${rdpHostFile}
