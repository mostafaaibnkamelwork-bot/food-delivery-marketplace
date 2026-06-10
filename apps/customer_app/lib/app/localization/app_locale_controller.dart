import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLocaleControllerProvider = NotifierProvider<AppLocaleController, Locale?>(AppLocaleController.new);

class AppLocaleController extends Notifier<Locale?> {
  @override
  Locale? build() => null;

  void setArabic() => state = const Locale('ar');
  void setEnglish() => state = const Locale('en');
  void useSystem() => state = null;
}
