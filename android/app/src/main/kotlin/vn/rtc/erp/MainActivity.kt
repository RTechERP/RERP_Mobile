package vn.rtc.erp

import android.media.AudioManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.rerp/camera_mute"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "muteShutter" -> {
                    muteShutterSound()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun muteShutterSound() {
        try {
            val audioManager = getSystemService(AUDIO_SERVICE) as AudioManager
            // Save current volume
            val originalVolume = audioManager.getStreamVolume(AudioManager.STREAM_SYSTEM)

            // Set volume to 0
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

            // Restore after 500ms
            android.os.Handler(mainLooper).postDelayed({
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
            // Silently fail
        }
    }
}
