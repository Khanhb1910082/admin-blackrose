import 'package:blackrose_admin_panel/core/authentication/authentication.notifier.dart';
import 'package:blackrose_admin_panel/core/constants/color_constants.dart';
import 'package:blackrose_admin_panel/core/widgets/app_button_widget.dart';
import 'package:blackrose_admin_panel/core/widgets/input_widget.dart';
import 'package:blackrose_admin_panel/routes/routes.dart';
import 'package:blackrose_admin_panel/screens/home/home_screen.dart';
import 'package:blackrose_admin_panel/screens/login/components/slider_widget.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  var tweenLeft =
      Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
          .chain(CurveTween(curve: Curves.ease));
  var tweenRight =
      Tween<Offset>(begin: const Offset(0, 0), end: const Offset(2, 0))
          .chain(CurveTween(curve: Curves.ease));

  AnimationController? _animationController;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey();

  var _isMoved = false;

  bool isChecked = false;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.white,
                child: const SliderWidget(),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: bgColor,
                child: Center(
                  child: Card(
                    //elevation: 5,
                    color: bgColor,
                    child: Container(
                      padding: const EdgeInsets.all(42),
                      width: MediaQuery.of(context).size.width / 3.6,
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 60,
                          ),
                          Image.asset(
                            "assets/logo/appIcon.png",
                            scale: 28,
                          ),
                          const SizedBox(height: 24.0),
                          //Flexible(
                          //  child: _loginScreen(context),
                          //),
                          Flexible(
                            child: Stack(
                              children: [
                                SlideTransition(
                                  position:
                                      _animationController!.drive(tweenRight),
                                  child: Stack(
                                      fit: StackFit.loose,
                                      clipBehavior: Clip.none,
                                      children: [
                                        _loginScreen(context),
                                      ]),
                                ),
                                SlideTransition(
                                  position:
                                      _animationController!.drive(tweenLeft),
                                  child: Stack(
                                      fit: StackFit.loose,
                                      clipBehavior: Clip.none,
                                      children: [
                                        _registerScreen(context),
                                      ]),
                                ),
                              ],
                            ),
                          ),

                          // Flexible(
                          //   child: SlideTransition(
                          //     position: _animationController!.drive(tweenLeft),
                          //     child: Stack(
                          //         fit: StackFit.loose,
                          //         clipBehavior: Clip.none,
                          //         children: [
                          //           _registerScreen(context),
                          //         ]),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _registerScreen(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputWidget(
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              onChanged: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Định dạng Email không đúng?'
                    : null;
              },

              topLabel: "Tên",

              hintText: "Nhập tên người dùng",
              // prefixIcon: FlutterIcons.chevron_left_fea,
            ),
            const SizedBox(height: 8.0),
            InputWidget(
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              onChanged: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },

              topLabel: "Email",

              hintText: "Nhập E-mail",
              // prefixIcon: FlutterIcons.chevron_left_fea,
            ),
            const SizedBox(height: 8.0),
            InputWidget(
              topLabel: "Mật khẩu",
              obscureText: true,
              hintText: "Nhập mật khẩu",
              onSaved: (String? uPassword) {},
              onChanged: (String? value) {},
              validator: (String? value) {},
            ),
            const SizedBox(height: 15.0),
            InkWell(
              onTap: () {
                // context.go(WebRoutes.homeScreen);
              },
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    'Đăng ký',
                    textAlign: TextAlign.center,
                  )),
            ),
            // const SizedBox(height: 24.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Row(
            //       children: <Widget>[
            //         Checkbox(
            //           value: isChecked,
            //           onChanged: (bool? value) {
            //             setState(() {
            //               isChecked = value!;
            //             });
            //           },
            //         ),
            //         const Text("Remember Me")
            //       ],
            //     ),
            //   ],
            // ),
            const SizedBox(height: 15.0),
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Đã có tài khoản?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_isMoved) {
                        _animationController!.reverse();
                      } else {
                        _animationController!.forward();
                      }
                      _isMoved = !_isMoved;
                    },
                    child: Text("Đăng nhập",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400, color: greenColor)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _loginScreen(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
      ),
      child: Form(
        key: _globalKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputWidget(
              kController: _emailController,
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              onChanged: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value == null ||
                        !value.contains('@') ||
                        value.length < 6)
                    ? 'Định dạng Email không đúng?'
                    : null;
              },

              topLabel: "Email",

              hintText: "Nhập E-mail",
              // prefixIcon: FlutterIcons.chevron_left_fea,
            ),
            const SizedBox(height: 8.0),
            Flexible(
              child: InputWidget(
                kController: _passwordController,
                topLabel: "Mật khẩu",
                obscureText: true,
                hintText: "Nhập mật khẩu",
                onSaved: (String? uPassword) {},
                onChanged: (String? value) {},
                validator: (String? value) {},
              ),
            ),
            // const SizedBox(height: 24.0),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                if (!_globalKey.currentState!.validate()) {
                  return;
                }
                Authentication().login(context,
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim());
                // context.go(WebRoutes.homeScreen);
              },
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    'Đăng nhập',
                    textAlign: TextAlign.center,
                  )),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Row(
                //   children: <Widget>[
                //     Checkbox(
                //       value: isChecked,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           isChecked = value!;
                //         });
                //       },
                //     ),
                //     const Text("Remember Me")
                //   ],
                // ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Text(
                //     "Forget Password?",
                //     textAlign: TextAlign.right,
                //     style: Theme.of(context)
                //         .textTheme
                //         .bodyMedium!
                //         .copyWith(color: greenColor),
                //   ),
                // ),
              ],
            ),
            // const SizedBox(height: 24.0),
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Chưa có tài khoản?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_isMoved) {
                        _animationController!.reverse();
                      } else {
                        _animationController!.forward();
                      }
                      _isMoved = !_isMoved;
                    },
                    child: Text("Đăng ký",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400, color: greenColor)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
