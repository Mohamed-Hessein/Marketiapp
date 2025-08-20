import 'package:flutter/cupertino.dart';
import 'package:app/core/constant/textconst.dart';
import 'package:app/core/theme/styles.dart';

class RowRememberandforget extends StatelessWidget {
  const RowRememberandforget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 10),
      child: Row(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/forgtepass');
              },
              child: Text(
                Textconst.forgetPass,
                style: AppTextSyles.textpopns12forgotColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
