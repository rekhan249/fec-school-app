import 'package:fec_app2/providers/password_provider.dart';
import 'package:fec_app2/screen_pages/dashboard.dart';
import 'package:fec_app2/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SavePassword extends StatefulWidget {
  static const String routeName = '/save-password';
  const SavePassword({super.key});

  @override
  State<SavePassword> createState() => _SavePasswordState();
}

class _SavePasswordState extends State<SavePassword> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final passwordProvider =
        Provider.of<PasswordProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                      child: Image.asset(
                    'assets/images/mainpage.png',
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: 280.h),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      elevation: 20,
                      child: Column(
                        children: [
                          SizedBox(height: 100.h),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Consumer<PasswordProvider>(
                                builder: ((context, pp, child) => PasswordField(
                                      passwordController:
                                          _newPasswordController,
                                      passwordProvider: passwordProvider,
                                      hintText: 'Enter New password',
                                      labelText: 'New password',
                                    ))),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Consumer<PasswordProvider>(
                                builder: ((context, pp, child) => PasswordField(
                                      passwordController:
                                          _confirmPasswordController,
                                      passwordProvider: passwordProvider,
                                      hintText: 'Enter confirm password',
                                      labelText: 'Confirm password',
                                    ))),
                          ),
                          SizedBox(height: 60.h),
                          SizedBox(
                              height: 50.h,
                              width: double.infinity.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, DashBoard.routeName);
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 25, 74, 159))),
                                    child: Text('Save Password',
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))),
                              )),
                          SizedBox(height: 30.h),

                          // Padding(
                          //   padding: const EdgeInsets.all(15),
                          //   child: Align(
                          //     alignment: Alignment.center,
                          //     child: RichText(
                          //       text: TextSpan(
                          //         children: [
                          //           TextSpan(
                          //             text: 'Allready have an account!',
                          //             style: TextStyle(
                          //               color: Colors.black,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 16.sp,
                          //             ),
                          //           ),
                          //           TextSpan(
                          //               text: 'Login',
                          //               style: TextStyle(
                          //                   color: Colors.red,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 18.sp),
                          //               recognizer: TapGestureRecognizer()
                          //                 ..onTap = () => Navigator.push(
                          //                     context,
                          //                     MaterialPageRoute(
                          //                         builder: (context) =>
                          //                             const LoginScreen())))
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
