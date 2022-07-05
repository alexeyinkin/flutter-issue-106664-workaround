A workaround for [Flutter Issue 106664](https://github.com/flutter/flutter/issues/106664)
that locks the focus in iframe with `TextField` if used in web.

## Usage

Add this line to your `main.dart`:

```dart
void main() {
  FlutterIssue106664Workaround.instance.apply();
  // Continue your code.
}
```

## The Workaround

If not in web, do nothing.

If not in iframe, do nothing.

If Safari, do nothing because it is not affected.

If in Firefox, programmatically release focus on iframe's `blur` event.
In Firefox it is sufficient. The downside is that selection is lost on clicking outside.

Otherwise programmatically release focus on iframe's `mouseout` event.
In Chrome the solution for Firefox is insufficient. On the first outside click,
it still scrolls back to the iframe, and only the second click is free to leave the iframe.
