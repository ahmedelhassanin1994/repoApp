import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_project/core/common/widget/custom_button.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/features_home/domain/entities/commits_entities.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_commits/commits_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_repos/repos_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen();

  @override
  _HomeScreen createState() => _HomeScreen();
}


class _HomeScreen extends State<HomeScreen> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }



  Widget getContentWidget(){
    final bloc = BlocProvider.of<CommitsCubit>(context);
    if(bloc.commitFutures.isNotEmpty){
      final Lastkey=bloc.commitFutures.keys.last;
     bloc.getCommits(Lastkey);
    }

    return    Scaffold(
          backgroundColor: ColorManager.white,
          appBar: AppBar(
            elevation:AppelEvation.E0,
            backgroundColor: ColorManager.white,
            title:Text(
                AppStrings.GITHUB,
               style: getMediumStyle(color: ColorManager.black),
            ),
          ),
          body: SafeArea(
            child: Container(
                width: AppSize.s100.w,
                height: AppSize.s100.h,
                color: ColorManager.white,
                child: Column(
                  children: [
                    CustomButton(
                      onTab: (){
                        Navigator.pushNamed(context, Routes.home);

                      },
                      margin: EdgeInsets.only(
                          left: AppMargin.m25.w,
                          right: AppMargin.m25.w,
                          top: AppMargin.m6.h,bottom: AppMargin.m2.h),
                      padding: EdgeInsets.only(
                          left: AppPading.p2.w,
                          right: AppPading.p2.w,
                          top: AppPading.p2.h,
                          bottom: AppPading.p2.h),

                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorManager.white),
                      text: AppStrings.Show_Repos,
                      decoration: new BoxDecoration(
                          color: ColorManager.black,
                          borderRadius: new BorderRadius.all(
                            Radius.circular(AppRadius.r3.w),
                          )),
                    ),


                    BlocBuilder<CommitsCubit, CommitsState>(
                      builder: (BuildContext context, CommitsState state) {
                        if (state is CommitLoaded) {
                          final bloc = BlocProvider.of<CommitsCubit>(context);
                          final Lastkey=bloc.commitFutures.keys.last;
                          
                        return Container(
                          child: Column(
                            children: [
                              BlocBuilder<ReposCubit, ReposState>(
                                builder: (context, state) {
                                  if (state is ReposLoaaded) {
                                    ReposEntities repo=  state.repos.where((repo) => repo.name.contains(Lastkey)).first;

                                    return Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w,top: AppMargin.m2.h),
                                            child:  Image.asset(ImageAssets.Github,
                                              fit: BoxFit.cover,
                                              width: AppSize.s60.w,
                                            ),
                                          ),

                                          Container(
                                            margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w,top: AppMargin.m2.h),
                                            child:Text(
                                              repo.description,
                                              style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else
                                  return Container(); // Empty container for initial state
                                },
                              ),

                              Container(
                          margin: EdgeInsets.only(top: AppMargin.m2.h,left: AppMargin.m2.h,right: AppMargin.m2.h),
                          child: Flexible(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.commit.length,
                                itemBuilder: (context, index) {
                                  final item = state.commit[index];
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: AppMargin.m2.h),
                                    child: Text(
                                      item.msg,
                                      style: getMediumStyle(
                                        color: ColorManager.black,
                                        fontSize: FontSize.s16.sp,
                                      ),
                                    ),
                                  );
                                },
                              )
                          ),
                        ),
                            ],
                          ),
                        );


                        }else{
                          return Container();
                        }
                        },
                    ),

                  ],
                ),


            ),
          ),
    );
  }




  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Responsive(
      desktop: getContentWidget(),
      tablet: getContentWidget(),
      mobile: getContentWidget(),
    );
  }
}


