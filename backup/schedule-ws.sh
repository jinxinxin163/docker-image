#!/bin/sh
echo "datacener: $datacenter"
echo "cluster: $cluster"
echo "token: $ssotoken"
echo "url postfix: $urlpostfix"
echo "includens: $includens"
echo "excludens: $excludens"
echo "workspace: $workspace"
echo "duration: $duration"
echo "storage: $storage"
nowtime=`date +%Y%m%d%H%M%S`
backupname=${cluster}-${workspace}-${nowtime}
echo "backupname: ${backupname}"
bkapiurl=http://api-backup-ensaas.${datacenter}.${urlpostfix}/v1/backup/backup/datacenter/${datacenter}/cluster/${cluster}/workspace/${workspace}
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