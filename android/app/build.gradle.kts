import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // Google services Gradle plugin (Firebase)
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
}
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "vn.rtc.erp"

    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17

        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.rtc.erp"

        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    dependencies {
        coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")

        // Firebase BoM – quản lý version tập trung
        implementation(platform("com.google.firebase:firebase-bom:34.11.0"))

        // Firebase products (không cần version khi dùng BoM)
        implementation("com.google.firebase:firebase-analytics")
        implementation("com.google.firebase:firebase-messaging")
        implementation("com.google.firebase:firebase-crashlytics")
    }

    // ✅ FLAVOR DIMENSION
    flavorDimensions += "env"

    // dev → lib/main_debug.dart | prod → lib/main_production.dart
    // Chạy: flutter run --flavor dev -t lib/main_debug.dart
    //       flutter run --flavor prod -t lib/main_production.dart
    productFlavors {
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".debug"
            versionNameSuffix = "-dev"
        }

        create("prod") {
            dimension = "env"
        }
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String
        }
    }

    buildTypes {
        getByName("debug") {
            isMinifyEnabled = false
        }

        getByName("release") {
            isMinifyEnabled = true
            // Tắt resource shrinker: meta-data kênh notification và icon
            // mặc định của FCM trong AndroidManifest có thể bị strip nếu
            // R8 không thấy Java/Kotlin nào reference tới → notification
            // background không hiện trên release.
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            signingConfig = signingConfigs.getByName("release")
        }
    }


}

flutter {
    source = "../.."
}
