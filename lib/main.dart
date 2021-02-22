import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Student> students = [
  Student(id: '03/1234',name: "Ahmad",gpa: 98.6,major: 'IT'),
  Student(id: '20/5482',name: "Ali",gpa: 95.6,major: 'CS'),
  Student(id: '18/1235',name: "Hosam",gpa: 78.3,major: 'CE'),
  Student(id: '15/1234',name: "Manal",gpa: 69.3,major: 'IT')
  ];
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Students",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Column(
            children: [
              Text("Student Data:",),
              Expanded(
                  child: ListView.builder(
                      itemCount: students.length, 
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Toast.show(students[index].toString(), context,duration: Toast.LENGTH_LONG,textColor: Colors.yellow,),
                          child: StudentCard(
                            student: students[index],
                            action: 'tap to show details',
                          ),
                        );
                      },
                  ),
                
              ),
            ],
          )
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;
  final String action;
  StudentCard({this.student,this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        shadowColor: Colors.blue,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text('Name: ',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                          Text(student.name,
                            style: TextStyle(letterSpacing: 2.0,fontSize: 18.0),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text('id: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                          Text(student.id,style: TextStyle(letterSpacing: 2.0,fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 35.0,
                  backgroundImage: AssetImage('assets/anonymous.jpg'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(action),
                Icon(Icons.play_arrow),
              ],
            )
          ],
        ),
      ),
    );
  }
}



