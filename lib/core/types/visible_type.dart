enum VisibleType { none, visible, invisible }

extension VisibleTypeEx on VisibleType {
  bool get isVisible => this == VisibleType.visible;

  /// Boolean -> 노출 여부
  static VisibleType fromBool(bool isVisible) {
    return isVisible ? VisibleType.visible : VisibleType.invisible;
  }
}
