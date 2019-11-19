#!/bin/sh
# This script downloads the latest examplify installer package,
# runs the pkg installer either installing or updating an existing install
# Created by Tara Oregon for Creighton University 11/1/18

#Download URL and temp directory variables
examplifyURL='https://releases.examsoft.com/Examplify/Examplify_LATEST_mac.dmg'
tempDir='/tmp/Examplify'

#creates temp directory, downloads examplify dmg file to it
mkdir $tempDir
curl -# -L -o $tempDir/Examplify.dmg $examplifyURL

#mount dmg file, move installer pkg file to temp directory
hdiutil mount $tempDir/Examplify.dmg
cp /Volumes/Examplify/* /$tempDir/Examplify.pkg
installer -pkg $tempDir/Examplify.pkg -target /

#cleanup, unmount dmg, delete temp files
hdiutil unmount /Volumes/Examplify/
rm -rf $tempDir