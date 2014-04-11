#!/bin/sh
<#include "/generic/templates/linuxExportEnvVars.ftl">

# check if the target directory exists 
# if not create it 
if [ -d "${deployed.targetPath}" ] ; then
	rm -rf ${deployed.targetPath}
fi

/bin/rm ${deployed.container.configurationFragmentDirectory}/${deployed.name}.conf

