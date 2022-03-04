import 'dart:io';

import 'package:mpost/constants.dart';
import 'package:mpost/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHandler {
  static final DatabaseHandler instance = DatabaseHandler._init();
  static Database? _database;
  DatabaseHandler._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('mpost.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    Directory dbPath = await getApplicationDocumentsDirectory();
    final path = join(dbPath.path, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE user(id INTEGER PRIMARY KEY, user_id TEXT, bearer_token TEXT, first_name TEXT, middle_name TEXT, last_name TEXT, mobile TEXT, email TEXT, is_superuser TEXT, role_id TEXT, mobile_verified_at TEXT, email_verified_at TEXT, created_at TEXT, updated_at TEXT, full_name TEXT)");

    await db.execute(
        "CREATE TABLE address(id INTEGER PRIMARY KEY, address_id TEXT, user_id TEXT, is_personal TEXT, address TEXT, postal_code_id TEXT, status_id TEXT, payment_request_id TEXT, expires_at TEXT, created_at TEXT, updated_at TEXT, deleted_at TEXT)");
  }

  Future<int> getUser(bool loggedin) async {
    print("calling get user");
    Database db = await instance.database;
    var getUser = await db.query('user', orderBy: 'first_name');

    List<UserModel> user;
    if (loggedin) {
      user = getUser.isNotEmpty
          ? List<UserModel>.from(
              getUser.map((e) => UserModel.fromJsonLoggedin(e)))
          : [];
    } else {
      user = getUser.isNotEmpty
          ? List<UserModel>.from(getUser.map((e) => UserModel.fromJson(e)))
          : [];
    }
    if (user.isNotEmpty) {
      Constants.user = user.first;
      Constants.token = user.first.bearerToken.toString();
      Constants.setToken();
      return 1;
    } else {
      return 0;
    }
  }

  addUser(UserModel user) async {
    print("calling add user");
    await removeUser();
    Database db = await instance.database;
    await db.insert('user', user.toMap());
    await getUser(false);
  }

  removeUser() async {
    print("calling remove user");
    Database db = await instance.database;
    await db.delete('user');
  }

  // getAddresses() async {
  //   Database db = await instance.database;
  //   var getUser = await db.query('address', orderBy: 'address');
  //   List<UserModel> user = getUser.isNotEmpty
  //       ? List<UserModel>.from(getUser.map((e) => UserModel.fromJson(e)))
  //       : [];
  //   user.isNotEmpty ? print(user.first.email) : null;
  // }

  //87|x8fTKMtSouljqSKzap6sczu6qGKOPRwE7XcRIGC2
}
