import 'dart:html'; // ignore: avoid_web_libraries_in_flutter

import 'package:flutter/widgets.dart';
import 'package:web_browser_detect/web_browser_detect.dart';

import 'abstract.dart';

class FlutterIssue106664Workaround extends Abstract {
  const FlutterIssue106664Workaround();

  static const instance = FlutterIssue106664Workaround();

  @override
  void apply() {
    if (window.parent?.location == window.location) {
      return;
    }

    final browser = Browser.detectOrNull();
    if (browser == null) {
      return;
    }

    switch (browser.browserAgent) {
      case BrowserAgent.Safari:
        // Safari is not affected by the issue.
        break;

      case BrowserAgent.Firefox:
        defocusOnBlur();
        break;

      default:
        defocusOnMouseOut();
    }
  }

  @override
  void defocusOnBlur() {
    window.addEventListener('blur', (e) {
      FocusManager.instance.primaryFocus?.unfocus();
      e.stopPropagation();
      e.stopImmediatePropagation();
      e.preventDefault();
    });
  }

  @override
  void defocusOnMouseOut() {
    window.addEventListener('mouseout', (e) {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }
}
