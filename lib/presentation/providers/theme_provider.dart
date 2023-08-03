
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado inmutable de colores
final colorListProvider = Provider((ref) => colorList);

//boolean state
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

//int state
final indexColorProvider = StateProvider<int>((ref) => 0);
