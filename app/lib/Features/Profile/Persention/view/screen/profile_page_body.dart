import 'dart:io';

import 'package:app/Features/Profile/Persention/vm/image_cubit.dart';
import 'package:app/Features/Profile/Persention/vm/image_state.dart';
import 'package:app/Features/Profile/Persention/view/widgets/Row_options_profile.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/extention/mediaquery_extn.dart';
import 'package:app/core/extention/theme_extn.dart';
import 'package:app/core/network/cachehelper.dart';
import 'package:app/core/network/endpoints.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/theme/styles.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileStateSuecss) {
          final profile = state.product;
          return Padding(
            padding: const EdgeInsets.only(top: 22),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 216.h,
                        width: 316.w,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 216.h,
                              width: 306.h,
                              child: SvgPicture.asset(
                                ImageManager.vectorProfile,
                              ),
                            ),

                            BlocBuilder<ImageCubit, ImageState>(
                              bloc: sl<ImageCubit>(),
                              builder: (context, state) {
                                return Positioned(
                                  top: context.screenHeight * .063,
                                  right: context.screenHeight * .13,
                                  child: SizedBox(
                                    height: 120.h,
                                    width: 120.h,
                                    child:
                                        // sl<ImageCubit>().image != null
                                        // ? SizedBox(
                                        //     height: 120.h,
                                        //     width: 120.w,
                                        //     child: CircleAvatar(
                                        //       backgroundImage: FileImage(
                                        //         File(
                                        //           sl<ImageCubit>().image!.path,
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ):
                                        CircleAvatar(
                                          child: Image.asset(
                                            ImageManager.avatr,
                                          ),
                                        ),
                                  ),
                                );
                              },
                            ),

                            Positioned(
                              top: context.screenHeight * .16,
                              right: context.screenHeight * .13,
                              child: GestureDetector(
                                onTap: () {
                                  ImagePicker()
                                      .pickImage(source: ImageSource.gallery)
                                      .then(
                                        (value) => sl<ImageCubit>().uploadimage(
                                          value!,
                                        ),
                                      );
                                },
                                child: SvgPicture.asset(
                                  ImageManager.cameraIcon,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        profile.name,
                        style: context.theme.textTheme.bodyMedium,
                      ),
                      Text(
                        profile.email,
                        style: context.theme.textTheme.bodySmall,
                      ),

                      SizedBox(height: 25.h),
                      RowOptionsProfile(
                        image: ImageManager.account,
                        imageselceted: ImageManager.arrowSelected,
                        text: 'Account Preferences',

                        wight: 20.h,
                      ),
                      SizedBox(height: 12.h),
                      RowOptionsDarkModeProfile(
                        image: ImageManager.darkMode,

                        text: 'Dark Mode',

                        wight: 20.h,
                      ),
                      SizedBox(height: 12.h),
                      RowOptionsProfile(
                        image: ImageManager.payment,
                        imageselceted: ImageManager.arrowSelected,
                        text: 'Subscription & Payment',

                        wight: 20.h,
                      ),
                      SizedBox(height: 12.h),

                      RowOptionsProfile(
                        image: ImageManager.notifiaction,
                        imageselceted: ImageManager.arrowSelected,
                        text: 'App Notifications',

                        wight: 20.h,
                      ),
                      SizedBox(height: 12.h),
                      RowOptionsProfile(
                        image: ImageManager.rateUs,
                        imageselceted: ImageManager.arrowSelected,
                        text: 'Rate Us',

                        wight: 22.h,
                      ),
                      SizedBox(height: 12.h),
                      RowOptionsProfile(
                        onTAp: () async {
                          await CacheHelper().clearData(key: ApiKeys.token);
                          Navigator.pushNamed(context, Approuter.logIn);
                        },
                        image: ImageManager.logOut,
                        imageselceted: ImageManager.arrowSelected,
                        text: 'log out',

                        wight: 20.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProfileStateLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProfileStateError) {
          return CustomErrorWidget(errorMessage: state.message.errMessage);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
