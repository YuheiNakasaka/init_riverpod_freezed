import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/entrypoint.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}
