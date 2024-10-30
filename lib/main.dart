import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/core/my_app.dart';
import 'package:mvvm_project/core/common/data/model/model_cache.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/di.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  if (kIsWeb) {

  }else{

  }
  await Hive.initFlutter();

  Hive.registerAdapter<Model_Cache>(ModelCacheAdapter());

  await Future.wait([ Hive.openBox<Model_Cache>('${Constant.localKey}')]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ColorManager.white, // navigation bar color
    statusBarColor: ColorManager.black, // status bar color
  ));
  runApp(MyApp());
}
