import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:engage_app/common/widget/loading_widget.dart';
import 'package:engage_app/feature/signin/ui/widgets/login_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:engage_app/common/route/routes.dart';
import 'package:engage_app/feature/signin_signup/bloc/index.dart';
import 'package:engage_app/feature/signin_signup/resources/index.dart';
import 'package:engage_app/generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/size_extension.dart';

class SignInForm extends StatefulWidget {
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final double screenSize = 750.h;

  void _onLoginButtonPressed() {
    BlocProvider.of<SignInBloc>(context).add(
      SignInButtonPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Theme.of(context).errorColor,
            ),
          );
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                // color: Provider.of<ThemeProvider>(context).getTheme()
                //     ? darkThemeBackgroundColor
                //     : backgroundColor,
                color: backgroundColor,
                height: screenSize,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: 290.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        // height: (MediaQuery.of(context).size.height * 0.4).h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/login.png'),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 18.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: TextStyle(
                                fontSize: 24.sp,
                                // color:
                                // Provider.of<ThemeProvider>(context).getTheme()
                                //     ? darkTextHeadingColor
                                //     : textColor,
                                color: textColor,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: LoginTextField(
                                textFieldTitle: 'EMAIL ADDRESS',
                                controller: _emailController,
                                obscureText: false,
                                hintText: 'Email Address',
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {},
                                focusNode: _emailFocusNode,
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            LoginTextField(
                              textFieldTitle: 'PASSWORD',
                              controller: _passwordController,
                              obscureText: true,
                              hintText: 'Password',
                              keyboardType: TextInputType.name,
                              validator: (value) {},
                              focusNode: _passwordFocusNode,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    // color: Provider.of<ThemeProvider>(context)
                                    //         .getTheme()
                                    //     ? darkTextColor
                                    //     : textColor,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            state is SignInLoading
                                ? LoadingWidget(
                                    visible: true,
                                  )
                                : _signInButton(state),
                            SizedBox(
                              height: 16.h,
                            ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: Container(
                            //         child: Divider(
                            //           thickness: 1,
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: MediaQuery.of(context).size.width * 0.05,
                            //     ),
                            //     Text(
                            //       'OR LOGIN WITH EMAIL',
                            //       style: TextStyle(
                            //         color: Color(0xFFA5ADB5),
                            //         fontSize: 14.sp,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: MediaQuery.of(context).size.width * 0.05,
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //         child: Divider(
                            //           thickness: 1,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.02,
                            // ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: Container(
                            //         height: MediaQuery.of(context).size.height * 0.06,
                            //         child: ElevatedButton(
                            //           style: ElevatedButton.styleFrom(
                            //             padding: EdgeInsets.all(0),
                            //             primary: Colors.red,
                            //           ),
                            //           onPressed: () {},
                            //           child: Row(
                            //             children: [
                            //               Expanded(
                            //                 flex: 2,
                            //                 child: Center(
                            //                   child: Icon(
                            //                     FontAwesomeIcons.google,
                            //                     size: 20,
                            //                   ),
                            //                 ),
                            //               ),
                            //               Container(
                            //                 height:
                            //                     MediaQuery.of(context).size.height *
                            //                         0.05,
                            //                 child: VerticalDivider(
                            //                   thickness: 1,
                            //                   width: 1,
                            //                 ),
                            //               ),
                            //               Expanded(
                            //                 flex: 5,
                            //                 child: Container(
                            //                   child: Center(
                            //                     child: Text(
                            //                       'Google',
                            //                       style: TextStyle(
                            //                         fontSize: 15.sp,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: MediaQuery.of(context).size.width * 0.05,
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //         height: MediaQuery.of(context).size.height * 0.06,
                            //         child: ElevatedButton(
                            //           style: ElevatedButton.styleFrom(
                            //             padding: EdgeInsets.all(0),
                            //             primary: Color(0xFF3B5998),
                            //           ),
                            //           onPressed: () {},
                            //           child: Row(
                            //             children: [
                            //               Expanded(
                            //                 flex: 2,
                            //                 child: Center(
                            //                   child: Icon(
                            //                     FontAwesomeIcons.facebookSquare,
                            //                     size: 20,
                            //                   ),
                            //                 ),
                            //               ),
                            //               Container(
                            //                 height:
                            //                     MediaQuery.of(context).size.height *
                            //                         0.05,
                            //                 child: VerticalDivider(
                            //                   thickness: 1,
                            //                   width: 1,
                            //                 ),
                            //               ),
                            //               Expanded(
                            //                 flex: 5,
                            //                 child: Container(
                            //                   child: Center(
                            //                     child: Text(
                            //                       'Facebook',
                            //                       style: TextStyle(
                            //                         fontSize: 15.sp,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _signInButton(SignInState state) {
    return Container(
      height: 50.h,
      child: ElevatedButton(
        //5A8DEE
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF5A8DEE),
        ),
        onPressed: state is SignInLoading ? null : _onLoginButtonPressed,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            Icon(FontAwesomeIcons.arrowRight),
          ],
        ),
      ),
    );
    // return SizedBox(
    //     width: double.infinity,
    //     child: RaisedButton(
    //       color: Colors.white,
    //       onPressed: state is! SignInLoading ? _onLoginButtonPressed : null,
    //       child: Text(S.of(context).sign_in),
    //     ));
  }

  Widget _signUpButton() {
    return SizedBox(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, Routes.signUp,
                arguments: RepositoryProvider.of<AuthRepository>(context));
          },
          child: Text(S.of(context).sign_up),
        ));
  }
}
