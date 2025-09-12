import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.firebaseapp.yumemi_flutter_codecheck_dev"
            resValue(type = "string", name = "app_name", value = "Codecheck Dev")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.firebaseapp.yumemi_flutter_codecheck"
            resValue(type = "string", name = "app_name", value = "Codecheck")
        }
    }
}