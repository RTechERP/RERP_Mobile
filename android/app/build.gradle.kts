plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
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

    buildTypes {
        getByName("debug") {
            isMinifyEnabled = false
        }

        getByName("release") {
            isMinifyEnabled = true
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
