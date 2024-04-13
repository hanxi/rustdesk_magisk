#!/system/bin/sh
permissions="android.permission.WRITE_SECURE_SETTINGS
android.permission.MANAGE_EXTERNAL_STORAGE
android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS
android.permission.READ_EXTERNAL_STORAGE
android.permission.WRITE_EXTERNAL_STORAGE
android.permission.INTERNET
android.permission.ACCESS_NETWORK_STATE
android.permission.FOREGROUND_SERVICE
android.permission.RECORD_AUDIO
android.permission.WAKE_LOCK
android.permission.RECEIVE_BOOT_COMPLETED
android.permission.SYSTEM_ALERT_WINDOW
android.permission.BIND_ACCESSIBILITY_SERVICE"

for i in $permissions; do
	pm grant com.carriez.flutter_hbb $i 2>/dev/null
done

