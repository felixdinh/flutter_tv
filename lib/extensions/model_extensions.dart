extension ObjectExtension<T> on T {
  B? getOrNull<B>() {
    if(this is B) return this as B;
    return null;
  }

  bool get isNullOrEmpty {
    if(this == null) return true;
    if(this is List) return (this as List).isEmpty;
    if(this is String) return (this as String).trim().isEmpty;
    if(this is Map) return (this as Map).isEmpty;
    return false;
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;

}
