// estado  isDarkModeProvider = boolean
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

final colorListprovider = Provider((ref) => colorList);

final selectedIndexColorProvider = StateProvider((ref) => 0);