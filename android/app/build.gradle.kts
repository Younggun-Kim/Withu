import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("app/keystore/key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.conner.withu"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.conner.withu"
        minSdk = 24
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("prod") {
            keyPassword = keystoreProperties["keyPassword"] as String
            storePassword = keystoreProperties["storePassword"] as String
            storeFile = keystoreProperties["prodStoreFile"]?.let { file(it) }
            keyAlias = keystoreProperties["devKeyAlias"] as String
        }
        create("dev") {
            keyPassword = keystoreProperties["keyPassword"] as String
            storePassword = keystoreProperties["storePassword"] as String
            storeFile = keystoreProperties["devStoreFile"]?.let { file(it) }
            keyAlias = keystoreProperties["devKeyAlias"] as String
        }
    }

    flavorDimensions += "env"

    productFlavors {
        create("prod") {
            dimension = "env"
            resValue(type = "string", name = "app_name", value = "위드유")
            signingConfig = signingConfigs.getByName("prod")
        }
        create("dev") {
            dimension = "env"
            resValue(type = "string", name = "app_name", value = "위드유개발")
            applicationIdSuffix = ".dev"
            signingConfig = signingConfigs.getByName("dev")
        }
    }

    buildTypes {
        release {

        }
        debug {

        }
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.3") // 최신 버전 확인 후 업데이트 가능
}


flutter {
    source = "../.."
}
