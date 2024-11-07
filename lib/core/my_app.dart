import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/theme_manager.dart';
import 'package:mvvm_project/core/resources/router/app_router.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_repos/repos_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/counter_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../features/features_home/presentation/bloc/bloc_commits/commits_cubit.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();
  static final MyApp instance = MyApp._internal();
  factory MyApp() => instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ReposCubit reposCubit= instance<ReposCubit>();
  CounterCubit counterCubit= instance<CounterCubit>();
  CommitsCubit commitsCubit= instance<CommitsCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return ResponsiveSizer(builder: (context, orientation, deviceType) {

       return  MultiBlocProvider(
         providers: [

           BlocProvider<ReposCubit>(
               create: (BuildContext context) =>reposCubit
           ),
           BlocProvider<CounterCubit>(
               create: (BuildContext context) =>counterCubit
           ),
           BlocProvider<CommitsCubit>(
               create: (BuildContext context) =>commitsCubit
           ),
         ],
         child:   MaterialApp(
           onGenerateRoute: RouteGenerator.getRoute,
           debugShowCheckedModeBanner: false,
           initialRoute: Routes.all_routs,
           theme: getApplicationTheme(),


       ));

    });
  }
}
