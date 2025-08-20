import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_cubit.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_state.dart';
import 'package:app/Features/Auth/Persention/view/widgets/customTextfeild.dart';
import 'package:app/Features/OnBording/Persention/view/widgets/custtomButtonNext.dart';
import 'package:app/core/Router/appRouter.dart';

import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/constant/textconst.dart';
import 'package:app/core/theme/styles.dart';

class Forgotpasswordbyemailbody extends StatelessWidget {
  const Forgotpasswordbyemailbody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Signupcubit, Signupstate>(
      listener: (context, state) {
        if (state is ResetCodeSecuss) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('secuss')));

          Navigator.pushNamed(context, Approuter.enterCode);
        } else if (state is ResetCodeError) {
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
                  ImageManager.forgotPasswordWithEmai,
                  height: 256.h,
                  width: 344.3.w,
                ),
                SizedBox(height: 22.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    textAlign: TextAlign.center,
                    Textconst.getCodeByEmail,
                    style: AppTextSyles.textpopns16color,
                  ),
                ),
                SizedBox(height: 22.h),
                CustomTextFeild(
                  controler: context.read<Signupcubit>().signUpEmail,
                  labelText: Textconst.emaillabel,
                  wigeth: 16.w,
                  height: 16.h,
                  hintText: Textconst.emailTextHint,
                  assetImage: ImageManager.emailIcon,
                ),
                SizedBox(height: 22.h),
                state is ResetCodeLoading
                    ? CircularProgressIndicator()
                    : Custtombuttonnext(
                        onTap: () {
                          final cubit = context.read<Signupcubit>();
                          cubit.svaeemil();
                          cubit.user = cubit.signUpEmail.text;
                          cubit.resetcode(email: cubit.user);
                          // Navigator.pushNamed(context, Approuter.enterCode);
                        },
                        text: 'Send Code',
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
