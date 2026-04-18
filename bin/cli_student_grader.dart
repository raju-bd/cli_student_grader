//import 'package:cli_student_grader/cli_student_grader.dart' as clisg;
import 'dart:io';
import 'dart:math';

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

        break; //case 1: Add Student
      case '2':
      //Select Student
        for (int i = 0; i < studentList.length; i++) {
          print("${i + 1}. ${studentList[i]['name']}");
        }

        stdout.write("Select a student by number: ");
        String? studentChoice = stdin.readLineSync();
        int studentIndex = int.parse(studentChoice!) - 1;
        print("Selected Student: ${studentList[studentIndex]['subjects']}");

        for (int i = 0; i < studentList[studentIndex]['subjects'].length; i++) {
          print(
            "${i + 1}. ${studentList[studentIndex]['subjects'].elementAt(i)}",
          );
        }
        // stdout.write("Select a subject by number: ");
        // String? subjectChoice = stdin.readLineSync();
        // int subjectIndex = int.parse(subjectChoice!) - 1;
        // String selectedSubject = studentList[studentIndex]['subjects'].elementAt(subjectIndex);

        while (true) {
          stdout.write("Enter score (0-100): ");
          String? scoreInput = stdin.readLineSync();
          int score = int.parse(scoreInput!);

          if (score > 0 && score <= 100) {
            studentList[studentIndex]['scores'].add(score);
            print("Score($score) added successfully!");
            print('Add Student: $studentList');
            break;
          } else {
            print("Invalid score. Please enter a number between 0 and 100.");
          }
        }

        break; //Case 2: Record Score
      case '3':
       //Select Student
        for (int i = 0; i < studentList.length; i++) {
          print("${i + 1}. ${studentList[i]['name']}");
        }

        while (true) {
          stdout.write("Select a student by number: ");
          String? studentChoice = stdin.readLineSync();
          int studentIndex = int.parse(studentChoice!) - 1;

          if (studentIndex >= 0 && studentIndex < studentList.length) {
            print("Selected Student: ${studentList[studentIndex]['name']}");

            stdout.write("Enter bonus points (0-10): ");
            String? bonusInput = stdin.readLineSync();
            int bonusPoints = int.parse(bonusInput!);

            if (bonusPoints >= 0 && bonusPoints <= 10) {
              if (studentList[studentIndex]['bonus'] == null) {
                studentList[studentIndex]['bonus'] ??= bonusPoints;
  
              } else {
                print("Bonus already assigned. Updating bonus points...");
              }
              print("Bonus points($bonusPoints) added successfully!");
              print('Add Student: $studentList');
              break;
            } else {
              print("Invalid bonus points. Please enter a number between 0 and 10.");
            }
          } else {
            print("Invalid student selection. Please try again.");
          }
        }

        print('Add Bonus Points');
        break; //Case 3: Add Bonus Points
      case '4':
          //Select Student
        for (int i = 0; i < studentList.length; i++) {
          print("${i + 1}. ${studentList[i]['name']}");
        }
        stdout.write("Select a student by number: ");
        String? studentChoice = stdin.readLineSync();
        int studentIndex = int.parse(studentChoice!) - 1; 
        print("Selected Student: ${studentList[studentIndex]['name']}");  
        stdout.write("Enter comment: ");
        String? commentInput = stdin.readLineSync();
        studentList[studentIndex]['comment'] = commentInput;
        print("Comment added successfully!");

        break; //case 4: Add Comment
      case '5':
      print("\n===== ALL STUDENTS =====");

        // for-in loop
        for (var student in studentList) {

          // collection if inside list
          var tags = [
            student["name"],
            "${(student["scores"] as List).length} scores",
            if (student["bonus"] != null) "⭐ Has Bonus"
          ];

          print(tags.join(" | "));
        }
  
        break; //case 5: View All Students
      case '6':
      print("Select a student to view report card:");
        for (int i = 0; i < studentList.length; i++) {
          print("${i + 1}. ${studentList[i]['name']}");
        }
        stdout.write("Select a student by number: ");
        String? studentChoice = stdin.readLineSync();
        int studentIndex = int.parse(studentChoice!) - 1;
        print('''
          ╔══════════════════════════════╗
          ║       REPORT CARD            ║
          ╠══════════════════════════════╝
          ║  Name:    ${studentList[studentIndex]['name']}            ║
          ║  Scores:  ${studentList[studentIndex]['scores']}      ║
          ║  Bonus:   ${studentList[studentIndex]['bonus'] ?? 'None'}                ║
          ║  Average: ${studentList[studentIndex]['average'] ?? 'None'}               ║
          ║  Grade:   ${studentList[studentIndex]['grade'] ?? 'None'}                  ║
          ║  Comment: ${studentList[studentIndex]['comment'] ?? 'None'}  ║
          ╚══════════════════════════════╝
        ''');
        print("Report Card for ${studentList[studentIndex]['name']}:");
        print("Scores: ${studentList[studentIndex]['scores']}");
        print("Bonus Points: ${studentList[studentIndex]['bonus'] ?? 'None'}");
        print("Comments: ${studentList[studentIndex]['comment'] ?? 'None'}"); 

        print('View Report Card');
        break; //case 6: View Report Card
      case '7':
        print('Class Summary');
        break; //case 7: Class Summary
      case '8':
        print('Exiting...');
        break; //case 8: Exit
      default:
        print('Invalid option. Please try again.');
    }
  } while (userInput ?? 0 < 8);


  // print(menu);

  // stdout.write("Enter a Number: ");
  //String? input = stdin.readLineSync();
}
