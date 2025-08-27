import 'dart:io';

import 'package:app/Features/Profile/Persention/vm/image_cubit.dart';
import 'package:app/Features/Profile/Persention/vm/image_state.dart';
import 'package:app/Features/Profile/Persention/view/widgets/Row_options_profile.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/theme/styles.dart';
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
            padding: const EdgeInsets.only(top: 51),
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
                                final cubit = sl<ImageCubit>();
                                return Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * .063,
                                  right:
                                      MediaQuery.of(context).size.height * .13,
                                  child: SizedBox(
                                    height: 120.h,
                                    width: 120.h,
                                    child: cubit.image == null
                                        ? CircleAvatar(
                                            child: Image.network(profile.image),
                                          )
                                        : SizedBox(
                                            height: 120.h,
                                            width: 120.w,
                                            child: CircleAvatar(
                                              backgroundImage: FileImage(
                                                File(cubit.image!.path),
                                              ),
                                            ),
                                          ),
                                  ),
                                );
                              },
                            ),

                            Positioned(
                              top: MediaQuery.of(context).size.height * .16,
                              right: MediaQuery.of(context).size.height * .13,
                              child: GestureDetector(
                                onTap: () {
                                  ImagePicker()
                                      .pickImage(source: ImageSource.gallery)
                                      .then(
                                        (value) => context
                                            .read<ImageCubit>()
                                            .uploadimage(value!),
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
                      Text(profile.name, style: AppTextSyles.textpopns18color),
                      Text(
                        profile.email,
                        style: AppTextSyles.textpopns14greycolor,
                      ),
                      SizedBox(height: 30.h),
                      RowOptionsProfile(
                        image: ImageManager.darkMode,
                        imageselceted: ImageManager.toggle,
                        text: 'Dark Mode',
                        higth: 22.h,
                        wight: 22.h,
                      ),
                      SizedBox(height: 22.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProfileStateLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProfileStateError) {
          return Text(state.message.errMessage);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
