import 'database_info.dart';

class SqlScripts {

  static String createCartTable = 'CREATE TABLE ${DatabaseInfo.tableCartItems} '
      '(${DatabaseInfo.columnCartItemId} INTEGER PRIMARY KEY AUTOINCREMENT,'
      '${DatabaseInfo.columnCartProductTitle} TEXT,'
      '${DatabaseInfo.columnCartProductDetails} TEXT,'
      '${DatabaseInfo.columnCartProductId} INTEGER,'
      '${DatabaseInfo.columnCartProductImage} TEXT,'
      '${DatabaseInfo.columnCartProductPrice} INTEGER);';
}