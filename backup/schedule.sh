#!/bin/sh
echo "datacener: $datacenter"
echo "cluster: $cluster"
echo "token: $ssotoken"
echo "url postfix: $urlpostfix"
echo "includens: $includens"
echo "excludens: $excludens"
echo "duration: $duration"
echo "storage: $storage"
echo "atcluster: $atcluster"
echo "schedulename": $schedulename"

nowtime=`date +%Y%m%d%H%M%S`
backupname=${schedulename}-${nowtime}
echo "backupname: ${backupname}"
bkapiurl=http://api-backup-${atcluster}.${urlpostfix}/v1/backup/backup/datacenter/${datacenter}/cluster/${cluster}
echo "api url: ${bkapiurl}"
curl -XPOST $bkapiurl -H 'Content-Type: application/json' -H 'Admin: true' -H "Authorization: $ssotoken" -d"
{
    \"backupname\": \"${backupname}\",
    \"ismanaged\" : true,
    \"includens\": \"${includens}\",
    \"excludens\": \"${excludens}\",
    \"duration\": \"${duration}\",
    \"storage\": \"${storage}\"
}"
