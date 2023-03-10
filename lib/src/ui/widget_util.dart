// Returns the title of the MaterialApp. Used to set title on pages to
// same one that is defined in each example as its app name. Handy as we only
// need to update in one place, where it belongs and no need to put it as
// a const somewhere and no need to pass it around via a title prop either.
// Also used in the About box as app name.
import 'package:flutter/material.dart';

/// Get the Material App's title from the context
String title(BuildContext context) {
  final contextElement = context as Element;
  final materialApp =
      contextElement.findAncestorWidgetOfExactType<MaterialApp>();
  return materialApp == null ? '' : materialApp.title;
}
