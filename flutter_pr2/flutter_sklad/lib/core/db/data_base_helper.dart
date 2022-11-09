import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sklad/data/model/arrival.dart';
import 'package:flutter_sklad/data/model/invoice.dart';
import 'package:flutter_sklad/data/model/client.dart';
import 'package:flutter_sklad/data/model/product.dart';
import 'package:flutter_sklad/data/model/productCategory.dart';
import 'package:flutter_sklad/data/model/product_on_stock.dart';
import 'package:flutter_sklad/data/model/stock.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../common/data_base_request.dart';
import '../../data/model/role.dart';
import '../../data/model/user.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database dataBase;
  int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'booksstore.db');
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      sqfliteFfiInit();
      dataBase = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
              version: _version,
              onCreate: (dataBase, version) async {
                await onCreateTable(dataBase);
              },
              onUpgrade: (dataBase, oldVersion, newVersion) async {
                await onUpdateTable(dataBase);
              }));
    } else {
      dataBase = await openDatabase(_pathDB, version: _version,
          onCreate: (dataBase, version) async {
        await onCreateTable(dataBase);
      }, onUpgrade: (dataBase, oldVersion, newVersion) async {
        await onUpdateTable(dataBase);
      });
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery("SELECT name FROM sqlite_master");

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }

    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      await db.execute(DataBaseRequest.createTableList[i]);
    }
    await onInitTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      await db.execute(DataBaseRequest.createTableList[i]);
    }
    db.execute('PRAGMA foreign_keys=on');
    await onInitTable(db);
  }

  Future<void> onDropDataBase() async {
    dataBase.close();
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      databaseFactoryFfi.deleteDatabase(dataBase.path);
    } else {
      deleteDatabase(_pathDB);
    }
  }


  Future<void> onInitTable(Database db) async {
    try {
      db.insert(DataBaseRequest.tableRole, Role(role: 'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(role: 'Пользователь').toMap());

      db.insert(DataBaseRequest.tableUsers, User(name: "Никита", surname: "Буянов", patronymic: "Вайпович", login: "wipetomorrow", password: "eyehead", roleId: 1).toMap());

      db.insert(DataBaseRequest.tableProductsOnStocks, Provider(product: "Сухарики", stockId: "1", value: "25").toMap());

      db.insert(DataBaseRequest.tableStocks, Stock(name: "Первый").toMap());

      db.insert(DataBaseRequest.tableProductCategories, ProductCategory(name: "Вкусные").toMap());

      db.insert(DataBaseRequest.tableProducts, Product(price: 20.20, name: "name", productCategoryId: 1).toMap());

      db.insert(DataBaseRequest.tableProcurement, Arrival(date: DateTime.now().toString(), count: 3, productId: 1).toMap());

      db.insert(DataBaseRequest.tableClients, Client(name: "Пример", itn: "3664069397").toMap());

      db.insert(DataBaseRequest.tableInvoice, Invoice(date: DateTime.now().toString(), count: 2, productId: 1, userId: 1, clientId: 1).toMap());

    } on DatabaseException catch (e) {
      print(1);
    }
  }
}
