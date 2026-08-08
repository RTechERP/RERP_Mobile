# ============================================================================
# R8 / ProGuard rules for RTC ERP (release build).
#
# Release bật isMinifyEnabled = true (xem app/build.gradle.kts). Nếu không
# có rules, R8 có thể obfuscate / strip các class của Flutter, Firebase và
# flutter_local_notifications → background notification (FCM data-only) bị
# hỏng âm thầm: dev build OK (không minify) nhưng release không hiển thị.
# ============================================================================

# ── Flutter engine + plugins ────────────────────────────────────────────────
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }
-dontwarn io.flutter.embedding.**

# ── Firebase (FCM, Analytics, Crashlytics) ──────────────────────────────────
# Firebase AAR đã có consumer rules riêng, nhưng keep thêm cho chắc — đặc
# biệt với background FirebaseMessagingService.
-keep class com.google.firebase.** { *; }
-keep class com.google.firebase.messaging.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.firebase.**
-dontwarn com.google.android.gms.**

# Flutter wrapper cho Firebase Messaging.
-keep class io.flutter.plugins.firebase.messaging.** { *; }

# ── flutter_local_notifications (com.dexterous) ────────────────────────────
# Plugin tạo receiver, gson model… nếu strip thì notification channel /
# scheduled notification không hoạt động trên release.
-keep class com.dexterous.** { *; }
-keep class com.dexterous.flutterlocalnotifications.** { *; }
-dontwarn com.dexterous.**

# ── AndroidX core ──────────────────────────────────────────────────────────
-keep class androidx.core.app.NotificationCompat** { *; }

# ── Annotations + enums (giữ reflection) ────────────────────────────────────
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes InnerClasses
-keepattributes EnclosingMethod

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# ── Parcelable / Serializable (cần cho intent extras) ─────────────────────
-keepclassmembers class * implements android.os.Parcelable {
    public static final ** CREATOR;
}

# ── Crashlytics ─────────────────────────────────────────────────────────────
-keep class com.crashlytics.** { *; }
-keep class io.fabric.** { *; }