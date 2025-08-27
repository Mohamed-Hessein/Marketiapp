import 'package:app/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Auth/Persention/view/widgets/customTextfeild.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_cubit.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_state.dart';
import 'package:app/Features/OnBording/Persention/view/widgets/custtomButtonNext.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/constant/textconst.dart';
import 'package:app/core/theme/styles.dart';

class Changepawwordbody extends StatelessWidget {
  const Changepawwordbody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Signupcubit, Signupstate>(
      bloc: sl<Signupcubit>(),
      listener: (context, state) {
        if (state is ChangePassLSecuess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('secuss')));
          Navigator.pushNamed(context, Approuter.congra);
        } else if (state is ChangePassError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.ERRmessage)));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 44),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  ImageManager.illustrationCreateNewPassword,
                  height: 256.h,
                  width: 344.3.w,
                ),
                SizedBox(height: 22.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    textAlign: TextAlign.center,
                    Textconst.getCodeE,
                    style: AppTextSyles.textpopns16color,
                  ),
                ),
                SizedBox(height: 22.h),

                SizedBox(height: 14.h),
                CustomTextFeild(
                  controler: sl<Signupcubit>().signUpPassword,
                  height: 16.h,
                  wigeth: 16.w,
                  hintText: '•••••••••••',
                  labelText: Textconst.passWordLabel,
                  assetImage: ImageManager.passwordIcon,
                ),
                SizedBox(height: 14.h),
                CustomTextFeild(
                  controler: sl<Signupcubit>().confirmPassword,
                  height: 16.h,
                  wigeth: 16.w,
                  hintText: '•••••••••••',
                  labelText: Textconst.confermpassTextfieldLabel,
                  assetImage: ImageManager.passwordIcon,
                ),
                SizedBox(height: 22.h),
                state is ChangePassLoading
                    ? CircularProgressIndicator()
                    : Custtombuttonnext(
                        onTap: () {
                          sl<Signupcubit>().changePassword(
                            email: sl<Signupcubit>().user,
                          );
                        },
                        text: Textconst.savedPass,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
