import 'package:app/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_cubit.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_state.dart';
import 'package:app/Features/Auth/Persention/view/widgets/customTextfeild.dart';
import 'package:app/Features/Auth/Persention/view/widgets/remeberandforgot.dart';
import 'package:app/Features/OnBording/Persention/view/widgets/custtomButtonNext.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/constant/textconst.dart';
import 'package:app/core/theme/styles.dart';

class Loginbody extends StatelessWidget {
  const Loginbody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Signupcubit, Signupstate>(
      bloc: sl<Signupcubit>(),
      listener: (context, state) {
        if (state is SignInSecuss) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('secuesss')));
          Navigator.pushNamed(context, Approuter.homePage);
        } else if (state is SignInError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.ERRmessage)));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  ImageManager.marktiaLogo,
                  width: 272.w,
                  height: 232.h,
                ),
                SizedBox(height: 32.h),
                CustomTextFeild(
                  controler: sl<Signupcubit>().signUpEmail,
                  labelText: Textconst.emaillabel,
                  wigeth: 5.w,
                  height: 5.h,
                  hintText: Textconst.emailTextHint,
                  assetImage: ImageManager.emailIcon,
                ),
                SizedBox(height: 14.h),
                CustomTextFeild(
                  controler: sl<Signupcubit>().signUpPassword,
                  height: 5.h,
                  wigeth: 5.w,
                  hintText: '•••••••••••',
                  labelText: Textconst.passWordLabel,
                  assetImage: ImageManager.passwordIcon,
                ),
                RowRememberandforget(),
                SizedBox(height: 20.h),
                state is SignInLoading
                    ? CircularProgressIndicator()
                    : Custtombuttonnext(
                        onTap: () {
                          sl<Signupcubit>().signin();
                        },
                        text: Textconst.signIn,
                      ),
                SizedBox(height: 16.h),
                Text(
                  Textconst.continueWith,
                  style: AppTextSyles.textpopns12Color,
                ),
                SizedBox(height: 16.h),
                // SocialMediaButton(),
                SizedBox(height: 14.h),
                Textaryoueloginorsign(or: 'register?'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Textaryoueloginorsign extends StatelessWidget {
  const Textaryoueloginorsign({super.key, required this.or});
  final String or;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Textconst.didintForGetToLoginText,
          style: AppTextSyles.textpopns12Color,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Approuter.signUp);
          },
          child: Text(or, style: AppTextSyles.textpopns12forgotColor),
        ),
      ],
    );
  }
}
