import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_repos/repos_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/counter_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/home_screen.dart';
import 'package:mvvm_project/features/features_home/presentation/repos_screen.dart';
import 'package:page_transition/page_transition.dart';


import '../../di.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    ReposCubit reposCubit= instance<ReposCubit>();
    CounterCubit counterCubit= instance<CounterCubit>();

    switch (settings.name) {

      case Routes.all_routs:
       return _generateMaterialRoute(HomeScreen());
      case Routes.home:
        // return PageTransition(child: SplashScreen(), type: PageTransitionType.scale);
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [

              BlocProvider<ReposCubit>(
                  create: (BuildContext context) =>reposCubit
              ),
              BlocProvider<CounterCubit>(
                  create: (BuildContext context) =>counterCubit
              ),
            ],
            child:  ReposScreen(),
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound),
              ),
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}

PageTransition _generateMaterialRoute(Widget screen) {
  return PageTransition(child: screen, type: PageTransitionType.rightToLeft);
}