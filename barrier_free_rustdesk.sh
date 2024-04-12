#!/system/bin/sh
MODDIR=${0%/*}
APPID=com.carriez.flutter_hbb
inputservice="${APPID}/${APPID}.InputService"
mainservice="${APPID}/${APPID}.MainService"
getservice=$(settings get secure enabled_accessibility_services|grep -v 'null')

function Activating_services(){
  service=$1
  am startservice -n $service
}

function put(){
  service=$1
  settings put secure accessibility_enabled 1
  settings put secure enabled_accessibility_services "$service:$getservice"
}

function get(){
  service=$1
  settings get secure enabled_accessibility_services | grep -v 'null' | grep $service | wc -l
}

function message(){
  AppVersion=`pm dump ${APPID} | grep "versionName" | cut -d "=" -f2 | sed -n '1p'`
  sed -i "/^description=/c description=保活策略：重启后将rustdesk转化为系统应用＋开机自启动rustdesk无障碍服务，用crond自动保活。当前rustdesk版本:[ $AppVersion ]" $MODDIR/module.prop
}
message

if test $(get $inputservice) -lt 1 ;then
  put $inputservice
  Activating_services $inputservice
fi

if test $(get $mainservice) -lt 1 ;then
  put $mainservice
  Activating_services $mainservice
fi