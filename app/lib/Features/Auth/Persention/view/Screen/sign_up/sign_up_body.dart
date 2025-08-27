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

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Signupcubit, Signupstate>(
      bloc: sl<Signupcubit>(),
      listener: (context, state) {
        if (state is SignupSecuss) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pushNamed(context, Approuter.logIn);
        } else if (state is SignupError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.ERRmessage)));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        var children = [
          Image.asset(
            ImageManager.marktiaLogo,
            height: 160.h,
            width: 187.58627319335938.w,
          ),
          SizedBox(height: 32),
          CustomTextFeild(
            controler: sl<Signupcubit>().signUpName,
            labelText: Textconst.yourNameLabel,
            wigeth: 2.w,
            height: 2.h,
            hintText: Textconst.fullName,
            assetImage: ImageManager.nameIcon,
          ),
          SizedBox(height: 14.h),

          SizedBox(height: 14.h),
          CustomTextPhoneFeild(
            controler: sl<Signupcubit>().signUpPhoneNumber,
            labelText: Textconst.phoneNumberLabel,
            height: 27.h,
            wigeth: 27.w,
            hintText: Textconst.phoneNumberLabel,
            assetImage: ImageManager.phoneIcon,
            SecassetImage: ImageManager.arrowDown,
          ),
          SizedBox(height: 14),

          CustomTextFeild(
            controler: sl<Signupcubit>().signUpEmail,
            labelText: Textconst.emaillabel,
            height: 3.h,
            wigeth: 3.w,
            hintText: Textconst.emailTextHint,
            assetImage: ImageManager.emailIcon,
          ),
          SizedBox(height: 14.h),
          CustomTextFeild(
            controler: sl<Signupcubit>().signUpPassword,
            labelText: Textconst.passWordLabel,
            height: 16.h,
            wigeth: 16.w,
            hintText: '•••••••••••',

            assetImage: ImageManager.passwordIcon,
          ),
          SizedBox(height: 14.h),
          CustomTextFeild(
            controler: sl<Signupcubit>().confirmPassword,
            labelText: Textconst.confermpassTextfieldLabel,
            height: 16.h,
            wigeth: 16.w,
            hintText: '•••••••••••',

            assetImage: ImageManager.passwordIcon,
          ),
          SizedBox(height: 14.h),
          RowRememberandforget(),
          SizedBox(height: 14.h),

          state is SignupLoading
              ? CircularProgressIndicator()
              : Custtombuttonnext(
                  onTap: () {
                    sl<Signupcubit>().signup();
                  },
                  text: Textconst.signIn,
                ),
          SizedBox(height: 16.h),
          Text(Textconst.continueWith, style: AppTextSyles.textpopns12Color),
          SizedBox(height: 16.h),
          // SocialMediaButton(),
          SizedBox(height: 14.h),
        ];
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SingleChildScrollView(child: Column(children: children)),
        );
      },
    );
  }
}
