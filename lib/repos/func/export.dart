import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:neuro_course/repos/models/sizes.dart';

import '../models/colors.dart';
import '../models/text_styles.dart';

void showPopup(BuildContext context, List<String> fileTypes,
    TextEditingController fileTypeController) {
  showGeneralDialog(
      barrierColor: Colors.transparent,
      context: context,
      pageBuilder: (context, __, _) {
        return Stack(
          children: [
            GestureDetector(
              onTapDown: (_) {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              left: width(228, context),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.40),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                width: width(86, context),
                height: height(123, context),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width(15, context),
                    top: height(6, context),
                    right: width(15, context),
                    bottom: height(6, context),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var i in fileTypes)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Material(
                                  surfaceTintColor: Colors.transparent,
                                  color: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () {
                                      fileTypeController.text = i;
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      height: height(20, context),
                                      child: Text(
                                        i,
                                        textAlign: TextAlign.left,
                                        style: Jost(width(12, context),
                                            Colors.black, FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              MaxGap(height(6, context))
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      });
}

exportFile(BuildContext context) {
  final nameController = TextEditingController();
  String fileFormat = '';
  final fileTypeController = TextEditingController();
  final List<String> fileTypes = [
    'PDF',
    'SCROM',
    'RAR-архив',
    'ZIP-архив',
  ];

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      content: SizedBox(
        height: height(330, context),
        width: width(312, context),
        child: Padding(
          padding: EdgeInsets.only(
            left: width(25, context),
            top: height(27, context),
            right: width(25, context),
            bottom: height(27, context),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Экспортировать',
                  style: Jost(24, Colors.black, FontWeight.w500),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
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
                    onPressed: () {},
                    child: Text(
                      'Экспортировать',
                      style: Jost(16, Colors.white, FontWeight.w400),
                    )),
              ),
              Positioned(
                top: height(64, context),
                child: Text(
                  'Выбирите формат файла',
                  style:
                      Jost(height(14, context), Colors.black, FontWeight.w400),
                ),
              ),
              Positioned(
                top: height(148, context),
                child: Text(
                  'Введите имя файла',
                  style:
                      Jost(height(14, context), Colors.black, FontWeight.w400),
                ),
              ),
              Positioned(
                top: height(92, context),
                left: 0,
                right: 0,
                child: SizedBox(
                  height: height(32, context),
                  child: TextFormField(
                    onTap: () {
                      showPopup(context, fileTypes, fileTypeController);
                    },
                    readOnly: true,
                    controller: fileTypeController,
                    style: Jost(12, Colors.black, FontWeight.w300),
                    decoration: InputDecoration(
                      suffixIcon: SizedBox(
                          width: width(7, context),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black.withOpacity(0.45),
                            size: height(28, context),
                          )),
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                          left: width(10, context),
                          right: width(10, context),
                          top: height(6, context),
                          bottom: height(6, context)),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MainColors.mainGrey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: fileFormat,
                      hintStyle: Jost(
                          height(12, context), Colors.black, FontWeight.w200),
                      focusColor: MainColors.mainGrey,
                      hoverColor: MainColors.mainGrey,
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: height(176, context),
                left: 0,
                right: 0,
                child: SizedBox(
                  child: TextFormField(
                    style: Jost(12, Colors.black, FontWeight.w300),
                    controller: nameController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                          left: width(10, context),
                          right: width(10, context),
                          top: height(6, context),
                          bottom: height(6, context)),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MainColors.mainGrey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: 'Автоматически созданное имя файла',
                      hintStyle: Jost(
                          height(12, context), Colors.black, FontWeight.w200),
                      focusColor: MainColors.mainGrey,
                      hoverColor: MainColors.mainGrey,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: MainColors.mainPurple),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    cursorColor: Colors.black,
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
