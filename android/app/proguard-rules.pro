# Flutter / Dart
-keep class io.flutter.** { *; }
-keep class * extends io.flutter.embedding.android.FlutterActivity { *; }
-dontwarn io.flutter.embedding.**

# ML Kit Text Recognition – keep all recognizer options (chinese/devanagari/japanese/korean)
-keep class com.google.mlkit.vision.text.** { *; }
-dontwarn com.google.mlkit.vision.text.**

# ML Kit common
-keep class com.google.mlkit.** { *; }
-dontwarn com.google.mlkit.**

# Google Play Services / Tasks
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**
-keep class com.google.android.odml.** { *; }
-dontwarn com.google.android.odml.**

# TFLite
-keep class org.tensorflow.lite.** { *; }
-dontwarn org.tensorflow.lite.**

# Keep enums and Parcelable
-keepclassmembers enum * { *; }
-keep class * implements android.os.Parcelable { *; }

# Crashlytics / Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# AndroidX core
-dontwarn androidx.**
