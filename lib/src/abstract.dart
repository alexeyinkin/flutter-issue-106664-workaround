abstract class Abstract {
  const Abstract();

  /// Applies the fix based on the current platform and browser.
  void apply() {}

  /// In web, unconditionally applies the fix with de-focusing on blur.
  void defocusOnBlur() {}

  /// In web, unconditionally applies the fix with de-focusing on mouse out.
  void defocusOnMouseOut() {}
}
