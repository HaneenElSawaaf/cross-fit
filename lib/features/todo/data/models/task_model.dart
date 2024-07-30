import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? id;
  final String title;
  final DateTime taskDate;
  final String description;

  TaskModel(
      {this.id,
      required this.title,
      required this.description,
      required this.taskDate,
      });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        taskDate: (json["task_date"] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "task_date": Timestamp.fromDate(taskDate),
        "created_at": Timestamp.now(),
      };
}
