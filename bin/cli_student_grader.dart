//import 'package:cli_student_grader/cli_student_grader.dart' as clisg;
import 'dart:io';

void main(List<String> arguments) {
  const appTitle = 'Student Grader v1.0';
  var studentList, loopCounter, userInput;

  final Set<String> subjects = {
    'Mathematics',
    'Science',
    'History',
    'Literature',
  };

  studentList = [];

  String menu = '''===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit
''';

  do {
    print(menu);
    stdout.write("Choose an option: ");
    String? userInput = stdin.readLineSync();

    print(userInput);
    switch (userInput) {

      case '1': //Add Student

        Map<String, dynamic> student = {};
        String? name, scores, bonus, comment;
        stdout.write("Enter Student Name: ");
        name = stdin.readLineSync();

        student = {
          'name': name,
          'scores': [],
          'subjects': {...subjects},
          'bonus': null,
          'comment': null,
        };
        studentList.add(student);

        print('Add Student: $studentList');

        print('Student added successfully!');
        print("Name: ${studentList.last['name']}");
        print("Scores: ${studentList.last['scores']}");
        print("Subjects: ${studentList.last['subjects']}");
        print("Bonus: ${studentList.last['bonus']}");
        print("Comment: ${studentList.last['comment']}");

        break;
      case '2':
        for (int i = 0; i < studentList.length; i++) {
          print("${i + 1}. ${studentList[i]['name']}");
          print("------");
        }
        stdout.write("Select a student by number: ");
        String? studentChoice = stdin.readLineSync();
        int studentIndex = int.parse(studentChoice!) - 1;
        print("Selected Student: ${studentList[studentIndex]['subjects']}");

        for(int i = 0; i < studentList[studentIndex]['subjects'].length; i++) {
          print("${i + 1}. ${studentList[studentIndex]['subjects'].elementAt(i)}");
        }
        // stdout.write("Select a subject by number: ");
        // String? subjectChoice = stdin.readLineSync();
        // int subjectIndex = int.parse(subjectChoice!) - 1;
        // String selectedSubject = studentList[studentIndex]['subjects'].elementAt(subjectIndex);
        stdout.write("Enter score : ");
        String? scoreInput = stdin.readLineSync();
        int score = int.parse(scoreInput!);
        studentList[studentIndex]['scores'].add(score);
        print('Add Student: $studentList');

        print('Record Score');
        break;
      case '3':
        print('Add Bonus Points');
        break;
      case '4':
        print('Add Comment');
        break;
      case '5':
        print('View All Students');
        break;
      case '6':
        print('View Report Card');
        break;
      case '7':
        print('Class Summary');
        break;
      case '8':
        print('Exiting...');
        break;
      default:
        print('Invalid option. Please try again.');
    }
  } while (userInput ?? 0 < 8);

  print('Hello world: $appTitle');

  // print(menu);

  // stdout.write("Enter a Number: ");
  //String? input = stdin.readLineSync();
}
