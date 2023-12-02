import 'dart:io';

import 'package:moviles/models/products_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ConnectionDatabase {

  static final nameDB = "DESPENSADB";
  static final versionDB = 1;

  static Database? _database;
  Future<Database?> get database async{
    if( _database != null ) return _database;
    return _database = await _initDatabase();
  }
  
  Future<Database> _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path,nameDB);
    return openDatabase(
      pathDB,
      version: versionDB,
      onCreate: (db, version) {
        String query = '''CREATE TABLE tblProductos(
          idProducto INTEGER PRIMARY KEY,
          nomProducto VARCHAR(30),
          canProducto int,
          precioProducto float(5,2),
          fechaCaducidad CHAR(10)
        )''';
        db.execute(query);
      },
    );
  }

  Future<int> INSERT(String tbl, Map<String,dynamic> values) async{
    var con = await database;
    return await con!.insert(tbl, values);
  }

  Future<int> UPDATE(String tbl, Map<String,dynamic> values) async{
    var con = await database;
    return await con!.update(tbl, values, where: 'idproducto = ?', whereArgs: [values['idProducto']]);
  }

  Future<int> DELETE(String tbl, int idProducto) async{
    var con = await database;
    return await con!.delete(tbl, where: 'idproducto = ?', whereArgs: [idProducto]);
  }

  Future<List<ProductsModel>> GETALLPROUCTS() async{
    var con = await database;
    var result = await con!.query('tblProductos');
    return result.map((e) => ProductsModel.fromMap(e)).toList();
  }

}