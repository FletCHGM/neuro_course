import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    tags.shuffle();
    courseModel.courseTags.sort((a, b) => a.length.compareTo(b.length));
    return Container(
      width: width(312, context),
      height: height(188, context),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 29,
              color: const Color.fromARGB(255, 100, 100, 111).withOpacity(0.2),
              offset: const Offset(0, 7)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Positioned(
              top: -5,
              right: 0,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Center(
                        child: Text(
                          'Курс ${courseModel.courseName}',
                          style: Jost(22, Colors.black, FontWeight.w400),
                        ),
                      ),
                      actions: [
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Удалить',
                                style: Jost(15, Colors.white, FontWeight.w400),
                              )),
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Экспортировать',
                                style: Jost(15, Colors.white, FontWeight.w400),
                              )),
                        )
                      ],
                    ),
                  );
                },
                child: const Icon(Icons.more_horiz),
              ),
            ),
            Positioned(
              left: 7,
              child: Text(
                courseModel.courseName,
                style: Jost(22, Colors.black, FontWeight.w400),
              ),
            ),
            Positioned(
              top: 35,
              left: 7,
              right: 7,
              child: Text(
                courseModel.courseTitle,
                style: Jost(15, Colors.black, FontWeight.w400),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 7,
              right: 7,
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                courseModel.courseTags[i],
                                style: Jost(15, Colors.black, FontWeight.w400),
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
    );
  }
}
