import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/common/widget/custom_button.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
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
                    )
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


