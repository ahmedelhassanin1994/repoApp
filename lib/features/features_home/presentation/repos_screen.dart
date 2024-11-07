import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_commits/commits_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_repos/repos_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/counter_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/widget/repo_card.dart';
import 'package:mvvm_project/features/features_home/presentation/widget/slider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReposScreen extends StatefulWidget {

 const ReposScreen();

  @override
  _ReposScreen createState() => _ReposScreen();
}


class _ReposScreen extends State<ReposScreen> {



   late final PageController _pageController;



   @override
  void initState() {
    // TODO: implement initState
     _pageController=PageController(initialPage: 0,viewportFraction: .85);
     _pageController.addListener(() {
       if (_pageController.page == Constant.SliderCount - 1) {
         // Reached the last page
         print("You've reached the last page!");

         context.read<CounterCubit>().CurentIndex(0);
       }
     });
     super.initState();
  }


   @override
   void dispose() {
     _pageController.dispose();
     super.dispose();
   }
   Widget _getProperCircle(int index,int _currentindex) {
     if(index ==_currentindex){
       return SvgPicture.asset(ImageAssets.solidCircle,color: ColorManager.black,width: AppSize.s1.w,height: AppSize.s1.h,); // selected slider
     }else{
       return SvgPicture.asset(ImageAssets.solidCircle,color: ColorManager.grey,width: AppSize.s1.w,height: AppSize.s1.h,); // unselected slider
     }
   }
   Widget _getBottomSheetWidget(int currentIndex){
     return Container(
       margin: EdgeInsets.only(left: AppMargin.m4.w,right: AppMargin.m4.w),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         mainAxisSize: MainAxisSize.min,
         children: [

           Row(
             children: [
               for(int i=0;i<5;i++)
                 Padding(
                   padding: EdgeInsets.all(AppPading.p_5.w),
                   child: _getProperCircle(i,currentIndex),)

             ],
           ),

         ],
       ),
     );
   }


Widget getContentWidget(){

  final bloc = BlocProvider.of<ReposCubit>(context);
  return  Scaffold(
           backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation:AppelEvation.E0,
          automaticallyImplyLeading:true,
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

               child: RefreshIndicator(
                   onRefresh: ()async {
                     bloc.get_featchData();
                   },
                   child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         BlocBuilder<ReposCubit, ReposState>(
                           builder: (context, state) {
                             if (state is ReposLoading) {
                               bloc.get_featchData();
                               return Center(child: CircularProgressIndicator());
                             } else if (state is ReposLoaaded) {
                               return Expanded(
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     SizedBox(
                                 height: AppSize.s14.h,
                                   child: Stack(
                                     children: [

                                       PageView.builder(
                                         controller: _pageController,
                                         onPageChanged: (index){
                                           _pageController.jumpToPage(index);
                                           context.read<CounterCubit>().CurentIndex(index);
                                         },

                                         itemBuilder: (_,index){
                                           return AnimatedBuilder(animation: _pageController,
                                               builder: (ctx,child){
                                                 return child!;
                                               },
                                               child:SliderWidget(state.repos[index])
                                           );
                                         },
                                         itemCount:Constant.SliderCount,
                                       ),

                                     ],

                                   ),
                                 ),

                                     BlocBuilder<CounterCubit, int>(
                                       builder: (context, state) {
                                         return   Container(
                                             width: AppSize.s100.w,
                                             alignment: Alignment.center,
                                             child: _getBottomSheetWidget(state)
                                         );
                                       },
                                     ),
                                     Container(
                                       margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w,top: AppMargin.m2.h),
                                       child: Text(
                                         AppStrings.git_repo,
                                         style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
                                       ),

                                     ),
                                     Expanded(

                                       child: ListView.builder(
                                         itemCount: state.repos.length,
                                         itemBuilder: (context, index) {
                                           final item = state.repos[index];
                                           return InkWell(
                                             onTap: (){
                                               showMenu(context,item);
                                             },
                                             child: RepoCard(item),
                                           );
                                         },
                                       ),
                                     ),
                                   ],
                                 ),
                               );
                             } else if (state is ReposError) {


                               return Center(child: Text(state.failure.message.toString()));
                             }
                             return Container(); // Empty container for initial state
                           },
                         ),
                       ],
                     ),
                   )
               ),
             ),

     );
}

   static void showMenu(BuildContext context,ReposEntities repo,
       {bool isLoading = false}) {
     final bloc = BlocProvider.of<CommitsCubit>(context);

     showModalBottomSheet(
       context: context,
       builder: (BuildContext modalContext) {
         return BlocProvider.value(
             value: bloc..get_featchCommits(repo.name),

        child:  Container(
           width: AppSize.s100.w,
           decoration: BoxDecoration(
               color: ColorManager.white,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(AppRadius.r3.w),topRight:Radius.circular(AppRadius.r3.w) )
           ),
           child: Column(
             mainAxisSize: MainAxisSize.max,
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Container(
                 width: AppSize.s100.w,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     SizedBox(),
                     Container(
                       child:  Text(
                         repo.name,
                         style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
                       ),
                     ),
                     Container(
                       child: IconButton(
                         onPressed: (){
                           Navigator.of(modalContext).pop();
                         },
                         icon: Icon(Icons.close,color: ColorManager.grey,size: AppSize.s6.w,),
                       ),
                     ),
                   ],
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w,top: AppMargin.m2.h),
                 child:  Image.asset(ImageAssets.Github,
                   fit: BoxFit.cover,
                 ),
               ),

               Container(
                 margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w,top: AppMargin.m2.h),
                 child:Text(
                  repo.description,
                   style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
                 ),
               ),

            BlocBuilder<CommitsCubit, CommitsState>
              (builder: (BuildContext context, CommitsState state) {
              if (state is CommitLoading) {
                return Center(child: CircularProgressIndicator());
              }else if(state is CommitLoaded){
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.commit.length,
                    itemBuilder: (context, index) {
                      final item = state.commit[index];
                      return Container(
                          margin: EdgeInsets.only(top:AppMargin.m2.h,left: AppMargin.m2.w,right: AppMargin.m2.w,bottom: AppMargin.m2.h),
                          child: Text(item.msg,style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),));
                    },
                  ),
                );
              } else{
                return Container();
              }})

          ],
           ),
         ));
       },
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
