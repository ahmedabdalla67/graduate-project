import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/layout/cubit/home_cubit.dart';
import 'package:shop_app/layout/home/home_view.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shared/bloc_observer/shop_bloc_observer.dart';
import 'package:shop_app/shared/themes.dart';
import 'package:shop_app/views/login_register/cubit/login_cubit.dart';
import 'package:shop_app/views/login_register/login_view.dart';
import 'package:shop_app/views/onBoarding/onBoarding_view.dart';
import 'package:shop_app/views/settings/settings_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ShopBlocObserver();
  await CacheHelper.init();
  DioHelper.init;

  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  Widget widget;

  //print(onBoarding);
  log(token!);
  if (onBoarding != null) {
    if (token != null) {
      widget = const HomeView();
    } else {
      widget = const LoginView();
    }
  } else {
    widget = const OnBoardingView();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.startWidget,
  });

  // This widget is the root of your application.
  final Widget startWidget;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(
            create: (context) => HomeCubit()
              ..getHomeData()
              ..getCategoriesdata()
              ..getFavorites()
              ..getProfile()),
      ],
      child: MaterialApp(
        routes: {
          SettingsView.id: (context) => const SettingsView(),
          LoginView.id: (context) => const LoginView()
        },
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: startWidget,
      ),
    );
  }
}
