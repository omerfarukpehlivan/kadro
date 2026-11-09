# ==============================================================================
# Kadro KPSS Genel Kültür — Android ProGuard & R8 Küçültme ve Obfuskasyon Kuralları
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. Flutter Framework & Platform Kanalları
# ------------------------------------------------------------------------------
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# JNI ve C/C++ yerel metodların korunması
-keepclasseswithmembernames class * {
    native <methods>;
}

# ------------------------------------------------------------------------------
# 2. Supabase & Ağ Katmanı (OkHttp, WebSockets, Serializer)
# ------------------------------------------------------------------------------
-keepattributes *Annotation*,EnclosingMethod,Signature,InnerClasses,SourceFile,LineNumberTable
-dontwarn okio.**
-dontwarn java.lang.invoke.**
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement

# Supabase Auth & JWT modelleri
-keep class io.supabase.** { *; }
-keep class io.github.jan.** { *; }

# ------------------------------------------------------------------------------
# 3. Desugaring (Java 8+ API Backport Desteği)
# ------------------------------------------------------------------------------
-keep class j$.** { *; }

# ------------------------------------------------------------------------------
# 4. Genel Serileştirilebilir Veri Modelleri
# ------------------------------------------------------------------------------
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    !static !transient <fields>;
    !private <fields>;
    !private <methods>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}
