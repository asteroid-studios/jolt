extension EnumValuesExtension<T extends Enum> on Iterable<T> {
  /// Finds the enum value in this list with name [name].
  ///
  /// Goes through this collection looking for an enum with
  /// name [name], as reported by [EnumName.name].
  /// Returns the first value with the given name. Such a value must be found.
  T? maybeByName(String? enumName) {
    for (var value in this) {
      if (value.name == enumName) return value;
    }
    return null;
  }
}
