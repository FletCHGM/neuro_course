import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:neuro_course/feature/auth/auth_page.dart';
import 'package:neuro_course/repos/models/course_model.dart';
import 'package:neuro_course/repos/models/sizes.dart';

import 'package:neuro_course/repos/models/text_styles.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../../repos/demo_properties.dart';
import '../../repos/models/colors.dart';

class CourseLibrary extends StatefulWidget {
  const CourseLibrary({super.key});

  @override
  State<CourseLibrary> createState() => CourseLibraryState();
}

class CourseLibraryState extends State<CourseLibrary> {
  var library = demoCourses;
  var archive = demoCourses;
  var _librarySelected = true;
  var _archiveSelected = false;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _sureToLogout() async {
    showTopModalSheet(
      context,
      Container(
        color: MainColors.mainPurple,
        height: height(80, context),
        width: width(800, context),
        child: SafeArea(
          child: Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: width(15, context)),
                    child: Text(
                      'Cменить аккаунт?',
                      style: Jost(20, Colors.white, FontWeight.w400),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: width(87, context),
                    child: TextButton(
                      onPressed: () async {
                        ///await _logout();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthPage()));
                      },
                      child: Text(
                        'Выйти',
                        style: Jost(18, Colors.white.withOpacity(0.61),
                            FontWeight.w400),
                      ),
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

  Future<bool> _sureToLeave() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) >
            const Duration(milliseconds: 1500)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: MainColors.mainPurple,
          content: Center(
            child: Text(
              'Нажмите еще раз чтобы выйти',
              style: Jost(18, Colors.white, FontWeight.w400),
            ),
          ))); //scaffold message, you can show Toast message too.
      return Future.value(false);
    }

    return Future.value(true);
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
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: width(87, context),
              child: TextButton(
                onPressed: () async {
                  await _sureToLogout();
                },
                child: Text(
                  'Выйти',
                  style:
                      Jost(18, Colors.black.withOpacity(0.61), FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (await _sureToLeave()) {
            exit(0);
          }
        },
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: height(32, context),
                ),
                SizedBox(
                  height: height(29, context),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _librarySelected = !_librarySelected;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Созданные курсы',
                                      style: Jost(height(18, context),
                                          Colors.black, FontWeight.w300)),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  _librarySelected
                                      ? SvgPicture.asset('assets/icon/up.svg')
                                      : SvgPicture.asset('assets/icon/down.svg')
                                ],
                              ),
                              Container(
                                width: width(179, context),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MainColors.mainPurple)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width(32, context),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: width(101, context),
                            height: height(26, context),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: MainColors.mainPurple,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset('assets/icon/plus.svg'),
                                  MaxGap(width(7, context)),
                                  Text(
                                    'Создать',
                                    style: Jost(height(16, context),
                                        Colors.white, FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom -
                        AppBar().preferredSize.height -
                        height(32, context) -
                        height(29, context),
                    child: ListView(
                      children: [
                        AnimatedSize(
                            duration: const Duration(milliseconds: 150),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: _librarySelected
                                  ? [
                                      for (var i = 0; i < library.length; i++)
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: height(20, context),
                                            ),
                                            CourseWidget(
                                                courseModel: library[i]),
                                            SizedBox(
                                              height: height(20, context),
                                            )
                                          ],
                                        )
                                    ]
                                  : [],
                            )),
                        SizedBox(
                          height: height(10, context),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: width(32, context)),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _archiveSelected = !_archiveSelected;
                                });
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Архив',
                                          style: Jost(height(18, context),
                                              Colors.black, FontWeight.w300)),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      _archiveSelected
                                          ? SvgPicture.asset(
                                              'assets/icon/up.svg')
                                          : SvgPicture.asset(
                                              'assets/icon/down.svg')
                                    ],
                                  ),
                                  Container(
                                    width: width(85, context),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: MainColors.mainPurple)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height(20, context),
                        ),
                        AnimatedSize(
                            duration: const Duration(milliseconds: 150),
                            child: Column(
                              children: _archiveSelected
                                  ? [
                                      for (var i = 0; i < archive.length; i++)
                                        Column(
                                          children: [
                                            CourseWidget(
                                                courseModel: archive[i]),
                                            SizedBox(
                                              height: height(40, context),
                                            )
                                          ],
                                        )
                                    ]
                                  : [],
                            )),
                      ],
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
