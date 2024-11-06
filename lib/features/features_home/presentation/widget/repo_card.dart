import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/features/features_home/domain/entities/commits_entities.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_commits/commits_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RepoCard extends StatelessWidget {
  final ReposEntities reposEntities;

  RepoCard(this.reposEntities);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CommitsCubit>(context);
    final list=bloc.getCommits(reposEntities.name);
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.select,
        borderRadius: BorderRadius.circular(AppRadius.r3.w),
      ),
      margin: EdgeInsets.symmetric(horizontal: AppMargin.m4.w, vertical: AppMargin.m2.h),
      padding: EdgeInsets.symmetric(horizontal: AppPading.p8.w, vertical: AppMargin.m2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

        children: [
          Row(
            children: [
              Image.asset(
                ImageAssets.ImgRepo,
                fit: BoxFit.fill,
              ),
              SizedBox(width: AppMargin.m4.w),
              Expanded(
                child: Text(
                  reposEntities.name.length > 10
                      ? reposEntities.name.substring(0, 10) + '...'
                      : reposEntities.name,
                  maxLines: 2,
                  style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppMargin.m2.h),
          BlocBuilder<CommitsCubit, CommitsState>(
            builder: (BuildContext context, CommitsState state) {
              if (state is CommitLoading) {
                return Container();
              } else if (state is CommitLoaded) {

                 return Flexible(
                   child:FutureBuilder<List<CommitsEntities>>(
                      future: list,
                      builder: (context, snapshot) {
                        if(snapshot.data!.isNotEmpty){
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final item = snapshot.data?[index];
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: AppMargin.m2.h),
                                child: Text(
                                  item!.msg,
                                  style: getMediumStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s14.sp,
                                  ),
                                ),
                              );
                            },
                          );
                        }else{
                          return Container();
                        }
                        // Your widget logic here
                      },
                    ),

                );
              } else if (state is CommitError) {
                return Center(
                  child: Text(
                    'Failed to load commits',
                    style: getMediumStyle(
                      color: ColorManager.error,
                      fontSize: FontSize.s14.sp,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),


        ],
      ),
    );
  }
}
