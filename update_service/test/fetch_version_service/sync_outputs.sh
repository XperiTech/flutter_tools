#!/bin/sh

# Sync files used in fetch_version_service_test.dart with their actual state
curl "https://itunes.apple.com/lookup?bundleId=com.elvefiske.elveguiden" > appstore.out
curl "https://play.google.com/store/apps/details?id=no.elveguiden.app" > playstore_elveguiden.out
curl "https://play.google.com/store/apps/details?id=com.campio.campioapp" > playstore_campio.out
curl "https://play.google.com/store/apps/details?id=org.mozilla.firefox" > playstore_firefox.out