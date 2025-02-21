import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show Uint8List, rootBundle;

// This Class contains every operation on the database (Getting or setting)

class DatabaseServices {
  static final DatabaseServices _instance = DatabaseServices._internal();
  factory DatabaseServices() => _instance;
  Database? _database;

  DatabaseServices._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'Quiz_Database.db');

    // Check if the database exists
    if (!await File(path).exists()) {
      // If not, copy from assets
      var data = await rootBundle.load('assets/Quiz_Database.db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }

    return await openDatabase(path);
  }

  Future<void> insertUserName(String userName) async {
    final db = await database;
    await db.rawUpdate("UPDATE Users SET Username = ?", [userName]);
  }

  getUsername() async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.query('Users', columns: ['Username'], limit: 1);

    String name = result.first['Username'].toString();

    return name;
  }

  Future<List<Map<String, dynamic>>> getQuestionsForSpecificSubject(
      int subjectId) async {
    final db = await database;

    final List<Map<String, dynamic>> result = await db.query(
      'Questions',
      columns: ['QuestionID', 'QuestionText'],
      where: 'subjectid = ?',
      whereArgs: [subjectId],
      orderBy: 'RANDOM()',
      limit: 1,
    );
    return result;
  }

  Future<List<Object>> getOptions(int subjectId, int questionID) async {
    final db = await database;

    final List<Map<String, dynamic>> result = await db.query(
      'Options',
      columns: ['OptionText', 'IsCorrect'],
      where: 'subjectid = ? AND questionID = ?',
      whereArgs: [subjectId, questionID],
    );

    if (result.isNotEmpty) {
      return result;
    } else {
      return []; // Return an empty list if no options are found
    }
  }

  getRowCount() async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT COUNT(*) as count FROM Subjects');

    return result.first['count'] as int;
  }

  Future<List<String>> getSubjectName() async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT SubjectName FROM Subjects');
    List<String> subjectNames =
        result.map((e) => e['SubjectName'] as String).toList();

    return subjectNames;
  }

  Future<List<Uint8List?>> getImage() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.rawQuery('SELECT SubjectImage FROM Subjects');
    if (maps.isNotEmpty) {
      return maps.map((map) => map['SubjectImage'] as Uint8List?).toList();
    }
    return [];
  }

  Future<int> getSubjectId(String subjectName) async {
    final db = await database;
    final List<Map<String, dynamic>> id = await db.rawQuery(
        "SELECT SubjectId FROM Subjects WHERE SubjectName Like '%$subjectName%'");
    return id.first['SubjectID'];
  }

  Future<void> updateQuestionAnsweredScore() async {
    final db = await database;

    await db.rawUpdate(
      "UPDATE Users SET QuestionAnswered = QuestionAnswered + 1",
    );
  }

  Future<void> updateCorrectAnswersScore() async {
    final db = await database;
    await db.rawUpdate(
      "UPDATE Users SET CorrectAnswers = CorrectAnswers + 1",
    );
  }

  Future<List<Map<String, dynamic>>>
      getRandomQuestionsFromRandomSubjects() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query("Questions",
        columns: ['QuestionText', 'QuestionID', 'SubjectID'],
        orderBy: 'RANDOM()',
        limit: 1);
    return result;
  }

  Future<List<Map<String, dynamic>>> getRandomOptionsOfRandomQuestions(
      int questionID, int subjectID) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query("Options",
        columns: ['OptionText', 'IsCorrect'],
        where: 'QuestionId = ? AND SubjectId = ?',
        whereArgs: [questionID, subjectID]);
    return result;
  }

  Future<void> updateQuizTakenScore() async {
    final db = await database;
    await db.rawUpdate(
      "UPDATE Users SET QuizTaken = QuizTaken + 1",
    );
  }

  Future<void> marksDeduction() async {
    final db = await database;
    int score = int.parse(await getCorrectAnswersScore());

    if (score >= 5) {
      await db.rawUpdate(
        "UPDATE Users SET CorrectAnswers = CorrectAnswers - 5 WHERE CorrectAnswers",
      );
    } else {
      await db.rawUpdate(
        "UPDATE Users SET CorrectAnswers = 0",
      );
    }
  }

  getSkippedQuestions() async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.query('Users', columns: ['SkippedAnswers'], limit: 1);

    String score = result.first['SkippedAnswers'].toString();

    return score;
  }

  getQuizTakenScore() async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.query('Users', columns: ['QuizTaken'], limit: 1);

    String score = result.first['QuizTaken'].toString();

    return score;
  }

  getCorrectAnswersScore() async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.query('Users', columns: ['CorrectAnswers'], limit: 1);

    String score = result.first['CorrectAnswers'].toString();

    return score;
  }

  getQuestionAnsweredScore() async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.query('Users', columns: ['QuestionAnswered'], limit: 1);

    String score = result.first['QuestionAnswered'].toString();

    return score;
  }

  getRandomDailyQuizes() async {
    final db = await database;

    final List<Map<String, dynamic>> result = await db.query('Subjects',
        columns: ['SubjectName'], orderBy: 'RANDOM()', limit: 3);

    return result;
  }

  Future<bool> isFirstTime() async {
    final db = await database;

    final result = await db.query('Users', columns: ['isFirstTime']);
    if (result[0]['isFirstTime'] == 1) {
      return true;
    } else {
      return false;
    }
  }

  void setNotFirstTime() async {
    final db = await database;

    await db.rawQuery('UPDATE USERS SET isFirstTime = 0');
  }

  getSurvivalStreak() async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.query('Users', columns: ['SurvivalStreak'], limit: 1);

    String score = result.first['SurvivalStreak'].toString();

    return score;
  }

  getTimeAttackScore() async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.query('Users', columns: ['TimeAttackScore'], limit: 1);

    String score = result.first['TimeAttackScore'].toString();

    return score;
  }

  void updateTimeAttackScore(int score) async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.query('Users', columns: ['TimeAttackScore'], limit: 1);

    final currentTimeAttackScore =
        int.parse(result.first['TimeAttackScore'].toString());

    if (score > currentTimeAttackScore) {
      await db.rawUpdate('Update Users SET TimeAttackScore =$score');
    }
  }

  void updateSurvivalStreak(int score) async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.query('Users', columns: ['SurvivalStreak'], limit: 1);

    final currentTimeAttackScore =
        int.parse(result.first['SurvivalStreak'].toString());

    if (score > currentTimeAttackScore) {
      await db.rawUpdate('Update Users SET SurvivalStreak =$score');
    }
  }

  void updateUserName(String newUserName) async {
    final db = await database;

    await db.update(
      'Users',
      {'UserName': newUserName},
    );
  }

  getCognifyTestWinner() async {
    final db = await database;

    final List<Map<String, dynamic>> result =
        await db.query('Users', columns: ['CognifyTestWinner'], limit: 1);

    String score = result.first['CognifyTestWinner'].toString();

    return score;
  }

  void updateCognifyTestWinner() async {
    final db = await database;

    await db.rawUpdate('Update Users SET CognifyTestWinner =1');
  }

  void updateSkippedQuestionsCounter() async {
    final db = await database;

    await db.rawUpdate('Update Users SET SkippedAnswers =SkippedAnswers+1');
  }
}
