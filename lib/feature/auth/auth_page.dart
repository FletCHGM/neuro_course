import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neuro_course/feature/course_library/course_library.dart';
import 'package:neuro_course/repos/models/sizes.dart';
import 'package:neuro_course/repos/models/text_styles.dart';

import '../../repos/demo_properties.dart';
import '../../repos/models/colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController _password;
  late TextEditingController _login;
  String? _validateLoginEx;
  String? _validatePasswordEx;

  @override
  void initState() {
    _login = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        scrolledUnderElevation: 4,
        automaticallyImplyLeading: false,
        shadowColor: Colors.grey,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              SvgPicture.asset('assets/icon/icon.svg'),
              const SizedBox(
                width: 10,
              ),
              Text(
                'NeuroCourse',
                style: Jost(18, Colors.black, FontWeight.w400),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: width(331, context),
          height: height(386, context),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 25),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: height(25, context),
                bottom: height(25, context)),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Авторизация',
                    style: Jost(25, Colors.black, FontWeight.w300),
                  ),
                ),
                Positioned(
                  top: height(93, context),
                  child: Text(
                    'Логин',
                    style: Jost(13, Colors.black, FontWeight.w500),
                  ),
                ),
                Positioned(
                  top: height(115, context),
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: height(100, context),
                    width: width(301, context),
                    child: TextFormField(
                      controller: _login,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                            left: width(12, context),
                            right: width(12, context),
                            top: height(7, context),
                            bottom: height(7, context)),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MainColors.mainGrey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        hintText: 'Введите логин',
                        hintStyle:
                            Jost(16, MainColors.mainGrey, FontWeight.w300),
                        errorText: _validateLoginEx,
                        errorStyle: Jost(0, Colors.red, FontWeight.w500),
                        focusColor: MainColors.mainGrey,
                        hoverColor: MainColors.mainGrey,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: MainColors.mainPurple),
                        ),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: height(162, context),
                  child: Text(
                    'Пароль',
                    style: Jost(13, Colors.black, FontWeight.w500),
                  ),
                ),
                Positioned(
                  top: height(184, context),
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: height(100, context),
                    width: width(301, context),
                    child: TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: _password,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                            left: width(12, context),
                            right: width(12, context),
                            top: height(7, context),
                            bottom: height(7, context)),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MainColors.mainGrey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        hintText: 'Введите пароль',
                        hintStyle:
                            Jost(16, MainColors.mainGrey, FontWeight.w300),
                        errorText: _validatePasswordEx,
                        errorStyle: Jost(0, Colors.red, FontWeight.w500),
                        focusColor: MainColors.mainGrey,
                        hoverColor: MainColors.mainGrey,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: MainColors.mainPurple),
                        ),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: height(256, context),
                  left: width(88, context),
                  right: width(88, context),
                  child: InkWell(
                    onTap: () {
                      if (_login.text == testLogin &&
                          _password.text == testPassword) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CourseLibrary()));
                      }
                      if (_login.text != testLogin) {
                        setState(() {
                          _validateLoginEx = '';
                        });
                      } else if (_password.text != testPassword) {
                        setState(() {
                          _validatePasswordEx = '';
                        });
                      }

                      if (_login.text.isEmpty) {
                        setState(() {
                          _validateLoginEx = '';
                        });
                      }
                      if (_password.text.isEmpty) {
                        setState(() {
                          _validatePasswordEx = '';
                        });
                      }
                    },
                    child: Container(
                      width: width(142, context),
                      height: height(40, context),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: MainColors.mainPurple,
                      ),
                      child: Center(
                          child: Text(
                        'Войти',
                        textAlign: TextAlign.center,
                        style: Jost(16, Colors.white, FontWeight.w500),
                      )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CourseLibrary()));
                    },
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Text(
                      'Войти с помощью Google',
                      textAlign: TextAlign.center,
                      style: Jost(14, const Color.fromARGB(255, 65, 65, 65),
                              FontWeight.w200)
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
