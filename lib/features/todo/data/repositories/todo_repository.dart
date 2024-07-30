import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_fit/core/shared/user_utils.dart';
import 'package:dartz/dartz.dart';

import '../models/task_model.dart';

abstract class ITodoRepository {
  Future<Either<FirebaseException, List<TaskModel>>> getTasks();
  Future<Either<FirebaseException, void>> createTask(TaskModel model);
  Future<Either<FirebaseException, void>> deleteTask(String taskId);
}

class TodoRepository implements ITodoRepository {
  final FirebaseFirestore _firestore;

  TodoRepository(this._firestore);

  @override
  Future<Either<FirebaseException, void>> createTask(TaskModel model) async {
    try {
      final response = await _firestore
          .collection('users')
          .doc(UserUtils.uid)
          .collection('tasks')
          .add(model.toJson());
      await _firestore
          .collection('users')
          .doc(UserUtils.uid)
          .collection('tasks')
          .doc(response.id)
          .update({'id': response.id});
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<FirebaseException, void>> deleteTask(String taskId) async {
    try {
      await _firestore
          .collection('users')
          .doc(UserUtils.uid)
          .collection('tasks')
          .doc(taskId)
          .delete();
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<FirebaseException, List<TaskModel>>> getTasks() async {
    log(UserUtils.uid.toString());
    try {
      final response = await _firestore
          .collection('users')
          .doc(UserUtils.uid)
          .collection('tasks')
          .orderBy('created_at')
          .get();
      final tasks =
          response.docs.map((e) => TaskModel.fromJson(e.data())).toList();
      return Right(tasks);
    } on FirebaseException catch (e) {
      return Left(e);
    }
  }
}
