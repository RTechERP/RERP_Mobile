package vn.rtc.erp

// Đổi từ FlutterActivity → FlutterFragmentActivity
// Lý do: flutter_local_notifications yêu cầu FlutterFragmentActivity
// để hiển thị notification đúng (head-up, full-screen intent,
// scheduled notification). Nếu dùng FlutterActivity thường,
// notification có thể bị silent fail hoặc không hiển thị đúng
// trên một số thiết bị Android 12+.
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.content.Intent
import android.net.Uri
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {

    /// Method channel để Flutter có thể yêu cầu mở trang battery
    /// optimization / autostart trên các ROM Trung Quốc (Xiaomi, Huawei,
    /// OPPO, Vivo). Các ROM này mặc định kill background app và
    /// chặn push notification nếu user không bật thủ công.
    private val CHANNEL = "vn.rtc.erp/battery"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "openBatteryOptimizationSettings" -> {
                        try {
                            val intent = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)
                            startActivity(intent)
                            result.success(true)
                        } catch (e: Exception) {
                            result.error("UNAVAILABLE", e.message, null)
                        }
                    }
                    "openAppNotificationSettings" -> {
                        try {
                            val intent = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                                .putExtra(Settings.EXTRA_APP_PACKAGE, packageName)
                            startActivity(intent)
                            result.success(true)
                        } catch (e: Exception) {
                            result.error("UNAVAILABLE", e.message, null)
                        }
                    }
                    "openAutostartSettings" -> {
                        // Mở trang autostart trên từng vendor.
                        // Thử Xiaomi trước, fallback các vendor khác,
                        // cuối cùng mở app details.
                        val vendors = listOf(
                            "com.miui.securitycenter",
                            "com.huawei.systemmanager",
                            "com.coloros.safecenter",
                            "com.iqoo.secure",
                            "com.vivo.permissionmanager"
                        )
                        var opened = false
                        for (vendor in vendors) {
                            try {
                                val intent = Intent().apply {
                                    component = android.content.ComponentName(
                                        vendor,
                                        "$vendor/com.miui.permcenter.autostart.AutoStartManagementActivity"
                                            .takeIf { vendor.contains("miui") }
                                            ?: when (vendor) {
                                                "com.huawei.systemmanager" ->
                                                    "com.huawei.systemmanager.startupmgr.ui.StartupNormalAppListActivity"
                                                "com.coloros.safecenter" ->
                                                    "com.coloros.safecenter.permission.startup.StartupAppListActivity"
                                                "com.iqoo.secure" ->
                                                    "com.iqoo.secure.ui.phoneoptimize.AddWhiteListActivity"
                                                "com.vivo.permissionmanager" ->
                                                    "com.vivo.permissionmanager.activity.BgStartUpManagerActivity"
                                                else -> ""
                                            }
                                    )
                                    flags = Intent.FLAG_ACTIVITY_NEW_TASK
                                }
                                startActivity(intent)
                                opened = true
                                break
                            } catch (e: Exception) {
                                // try next vendor
                            }
                        }
                        if (!opened) {
                            try {
                                val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
                                    .setData(Uri.fromParts("package", packageName, null))
                                startActivity(intent)
                            } catch (e: Exception) {
                                result.error("UNAVAILABLE", e.message, null)
                                return@setMethodCallHandler
                            }
                        }
                        result.success(true)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Android 13+ – showInForeground dùng cho heads-up notification.
        // Không cần code thêm, FlutterFragmentActivity đã xử lý.
    }
}