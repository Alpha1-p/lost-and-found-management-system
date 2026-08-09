import 'package:flutter/material.dart';
import 'app.dart';
import 'core/services/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final message = await ApiService.testConnection();

  print('BACKEND RESPONSE: $message');

  runApp(const LostAndFoundApp());
}