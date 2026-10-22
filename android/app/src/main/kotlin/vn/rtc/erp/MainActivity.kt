package vn.rtc.erp

import android.content.ComponentName
import android.content.Intent
import android.media.AudioManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/// Activity chính của RERP Mobile.
///
/// Kế thừa [FlutterFragmentActivity] (thay vì FlutterActivity thường) vì
/// `flutter_local_notifications` cần FlutterFragmentActivity để hiển thị
/// notification đúng (head-up, full-screen intent, scheduled notification)
/// trên Android 12+.
class MainActivity : FlutterFragmentActivity() {

    companion object {
        // Channel dùng cho chức năng tắt tiếng shutter khi chụp ảnh.
        private const val CAMERA_MUTE_CHANNEL = "com.rerp/camera_mute"

        // Channel dùng để mở các trang cài đặt battery optimization /
        // notification / autostart trên các ROM Trung Quốc.
        private const val BATTERY_CHANNEL = "vn.rtc.erp/battery"
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        setupCameraMuteChannel(flutterEngine)
        setupBatteryChannel(flutterEngine)
    }

    /// Đăng ký method channel để Flutter gọi `muteShutter` khi chụp ảnh.
    private fun setupCameraMuteChannel(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CAMERA_MUTE_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "muteShutter" -> {
                        muteShutterSound()
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    /// Đăng ký method channel để Flutter mở các trang cài đặt hệ thống
    /// (battery optimization, app notification, autostart) trên các
    /// ROM Trung Quốc (Xiaomi, Huawei, OPPO, Vivo) — các ROM này mặc
    /// định kill background app và chặn push notification nếu user
    /// không bật thủ công.
    private fun setupBatteryChannel(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, BATTERY_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "openBatteryOptimizationSettings" -> openBatteryOptimizationSettings(result)
                    "openAppNotificationSettings" -> openAppNotificationSettings(result)
                    "openAutostartSettings" -> openAutostartSettings(result)
                    else -> result.notImplemented()
                }
            }
    }

    /// Tắt tiếng shutter của camera bằng cách mute STREAM_SYSTEM tạm thời
    /// trong 500ms rồi khôi phục lại volume ban đầu.
    private fun muteShutterSound() {
        try {
            val audioManager = getSystemService(AUDIO_SERVICE) as AudioManager
            // Lưu volume hiện tại để khôi phục sau.
            val originalVolume = audioManager.getStreamVolume(AudioManager.STREAM_SYSTEM)

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                audioManager.adjustStreamVolume(
                    AudioManager.STREAM_SYSTEM,
                    AudioManager.ADJUST_MUTE,
                    0
                )
            } else {
                audioManager.setStreamVolume(
                    AudioManager.STREAM_SYSTEM,
                    0,
                    0
                )
            }

            // Sau 500ms thì unmute lại và khôi phục volume ban đầu.
            Handler(Looper.getMainLooper()).postDelayed({
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    audioManager.adjustStreamVolume(
                        AudioManager.STREAM_SYSTEM,
                        AudioManager.ADJUST_UNMUTE,
                        0
                    )
                } else {
                    audioManager.setStreamVolume(
                        AudioManager.STREAM_SYSTEM,
                        originalVolume,
                        0
                    )
                }
            }, 500)
        } catch (e: Exception) {
            // Im lặng nếu thất bại — chụp ảnh vẫn hoạt động bình thường.
        }
    }

    /// Mở trang battery optimization của hệ thống.
    private fun openBatteryOptimizationSettings(result: MethodChannel.Result) {
        try {
            val intent = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)
            startActivity(intent)
            result.success(true)
        } catch (e: Exception) {
            result.error("UNAVAILABLE", e.message, null)
        }
    }

    /// Mở trang notification settings của app hiện tại.
    private fun openAppNotificationSettings(result: MethodChannel.Result) {
        try {
            val intent = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                .putExtra(Settings.EXTRA_APP_PACKAGE, packageName)
            startActivity(intent)
            result.success(true)
        } catch (e: Exception) {
            result.error("UNAVAILABLE", e.message, null)
        }
    }

    /// Mở trang autostart trên từng vendor (Xiaomi, Huawei, OPPO, Vivo).
    /// Thử lần lượt các vendor, nếu không vendor nào khả dụng thì fallback
    /// mở trang app details của hệ thống.
    private fun openAutostartSettings(result: MethodChannel.Result) {
        // Mapping từ package vendor sang Activity autostart tương ứng.
        val vendors = listOf(
            "com.miui.securitycenter" to "com.miui.permcenter.autostart.AutoStartManagementActivity",
            "com.huawei.systemmanager" to
                "com.huawei.systemmanager.startupmgr.ui.StartupNormalAppListActivity",
            "com.coloros.safecenter" to
                "com.coloros.safecenter.permission.startup.StartupAppListActivity",
            "com.iqoo.secure" to
                "com.iqoo.secure.ui.phoneoptimize.AddWhiteListActivity",
            "com.vivo.permissionmanager" to
                "com.vivo.permissionmanager.activity.BgStartUpManagerActivity"
        )

        var opened = false
        for ((vendor, autostartClass) in vendors) {
            try {
                val intent = Intent().apply {
                    component = ComponentName(vendor, "$vendor/$autostartClass")
                    flags = Intent.FLAG_ACTIVITY_NEW_TASK
                }
                startActivity(intent)
                opened = true
                break
            } catch (e: Exception) {
                // Thử vendor tiếp theo.
            }
        }

        // Fallback: mở trang app details nếu không có vendor nào khả dụng.
        if (!opened) {
            try {
                val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
                    .setData(Uri.fromParts("package", packageName, null))
                startActivity(intent)
            } catch (e: Exception) {
                result.error("UNAVAILABLE", e.message, null)
                return
            }
        }
        result.success(true)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Android 13+ – heads-up notification đã được FlutterFragmentActivity
        // xử lý, không cần code thêm.
    }
}
