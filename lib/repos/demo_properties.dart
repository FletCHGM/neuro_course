import 'models/course_model.dart';

var testLogin = 'test';
var testPassword = '12345';
var coureDemo =
    'Курс супер вау, ты станешь умным, очень много классной инфы, вау, ого, ничего себе!';
List<CourseModel> demoCourses = [
  CourseModel(
    courseName: 'Английский язык',
    courseTitle: coureDemo,
    courseTags: [
      '#грамматика',
      '#лексика',
      '#аудирование',
      '#чтение',
    ],
  ),
  CourseModel(
    courseName: 'Игра на гитаре',
    courseTitle: coureDemo,
    courseTags: [
      '#аккорды',
      '#техника',
      '#сольфеджио',
    ],
  ),
  CourseModel(
    courseName: 'Астрономия и космос',
    courseTitle: coureDemo,
    courseTags: [
      '#классификация галактик',
      '#созвездия',
    ],
  ),
  CourseModel(
    courseName: '3D-анимация',
    courseTitle: coureDemo,
    courseTags: [
      '#симуляция физики',
      '#blender',
      '#rigging',
    ],
  ),
  CourseModel(
    courseName: 'Шахматы',
    courseTitle: coureDemo,
    courseTags: [
      '#шахматная нотация',
      '#тактики и стратегии',
    ],
  ),
  CourseModel(
    courseName: 'UX/UI-проектирование',
    courseTitle: coureDemo,
    courseTags: [
      '#customer journey map',
      '#JTBD',
      '#figma',
    ],
  ),
  CourseModel(
    courseName: 'AutoCAD',
    courseTitle: coureDemo,
    courseTags: [
      '#чертежи',
    ],
  ),
  CourseModel(
    courseName: 'Питухон',
    courseTitle:
        'Братва, недавно малой увлекся программированием начал учить какой-то питухон (python). Подскажите, не зашкварится ли малой, если будет учить эту баланду?',
    courseTags: [
      '#синтаксис',
      '#малой',
      '#ООП',
    ],
  ),
];
