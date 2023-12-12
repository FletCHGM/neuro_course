import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:neuro_course/repos/func/export.dart';
import 'package:neuro_course/repos/models/colors.dart';
import 'package:neuro_course/repos/models/sizes.dart';
import 'package:neuro_course/repos/models/text_styles.dart';

class CourseModel {
  String courseName;
  String courseTitle;
  List<String> courseTags;
  CourseModel(
      {required this.courseName,
      required this.courseTitle,
      required this.courseTags});
}

List<Color> tagItemsColors = [
  MainColors.mainGreen,
  MainColors.mainBlue,
  MainColors.mainCyan,
  MainColors.mainPurple
];

// ignore: must_be_immutable
class CourseWidget extends StatelessWidget {
  CourseWidget({super.key, required this.courseModel});
  CourseModel courseModel;
  List<Color> tags = tagItemsColors;

  void showCourseActions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Center(
          child: Text(
            'Курс "${courseModel.courseName}"',
            style: Jost(width(22, context), Colors.black, FontWeight.w400),
          ),
        ),
        actions: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(MainColors.mainPurple)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Удалить',
                        style: Jost(
                            width(16, context), Colors.white, FontWeight.w400),
                      )),
                ),
                Gap(width(15, context)),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.only(
                              top: height(3, context),
                              left: width(10, context),
                              bottom: height(3, context),
                              right: width(10, context))),
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                              MainColors.mainPurple)),
                      onPressed: () {
                        Navigator.pop(context);
                        exportFile(context);
                      },
                      child: Text(
                        'Экспортировать',
                        style: Jost(
                            width(16, context), Colors.white, FontWeight.w400),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    tags.shuffle();
    courseModel.courseTags.sort((a, b) => a.length.compareTo(b.length));
    return Center(
      child: InkWell(
        onLongPress: () {
          showCourseActions(context);
        },
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          width: width(312, context),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 29,
                  color:
                      const Color.fromARGB(255, 100, 100, 111).withOpacity(0.2),
                  offset: const Offset(0, 7)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      courseModel.courseName,
                      style: Jost(22, Colors.black, FontWeight.w400),
                    ),
                    MaxGap(width(312, context)),
                    InkWell(
                      onTap: () {
                        showCourseActions(context);
                      },
                      child: const Icon(Icons.more_horiz),
                    ),
                  ],
                ),
                Text(
                  courseModel.courseTitle,
                  style: Jost(15, Colors.black, FontWeight.w400),
                ),
                Gap(height(5, context)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 7,
                    runSpacing: 10,
                    children: [
                      for (var i = 0; i < courseModel.courseTags.length; i++)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 22,
                              decoration: BoxDecoration(
                                  border: Border.all(color: tags[i]),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    courseModel.courseTags[i],
                                    style:
                                        Jost(15, Colors.black, FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
