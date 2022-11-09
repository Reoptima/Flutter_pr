abstract class DataBaseRequest {
  static String deleteTable(String table) => "DROP TABLE '$table'";

  /// Таблица Роли
  ///
  /// Поля таблицы: Название роли
  static const String tableRole = 'Role';

  /// Таблица Пользователи
  ///
  /// Поля таблицы: ....
  static const String tableUsers = 'Users';

  /// Таблица товаров на складе
  static const String tableProductsOnStocks = 'ProductsOnStocks';

  /// Таблица складов
  static const String tableStocks = 'Stocks';

  /// Таблица категории товаров
  static const String tableProductCategories = 'ProductCategories';

  /// Таблица товаров
  static const String tableProducts = 'Products';

  /// Таблица клиентов
  static const String tableClients = 'Clients';

  /// Таблица Закупок
  static const String tableProcurement = 'Procurement';

  /// Таблица Накладных
  static const String tableInvoice = 'Invoice';

  static const List<String> tableList = [tableRole, tableUsers, tableProductsOnStocks, tableStocks, tableProductCategories, tableProducts, tableClients, tableProcurement, tableInvoice];

  static const List<String> createTableList = [
    _createTableRole,
    _createTableUsers,
    _createTableProductsOnStocks,
    _createTableStocks,
    _createTableProductCategories,
    _createTableProducts,
    _createTableClients,
    _createTableProcurement,
    _createTableInvoice
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      'CREATE TABLE "$tableUsers" ("id" INTEGER,"login" TEXT NOT NULL UNIQUE,"password" TEXT NOT NULL,"roleId" INTEGER NOT NULL, "name" TEXT NOT NULL, "surname" TEXT NOT NULL, "patronymic" TEXT NULL,FOREIGN KEY("roleId") REFERENCES "Role"("id"),PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы товаров на складе
  static const String _createTableProductsOnStocks = 'CREATE TABLE "$tableProductsOnStocks" ("id" INTEGER, "productId" TEXT NOT NULL, "stockId" TEXT NOT NULL, "value" INTEGER NOT NULL,FOREIGN KEY("productId") REFERENCES "Product"("id"),FOREIGN KEY("stockId") REFERENCES "Stocks"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Stocks
  static const String _createTableStocks = 'CREATE TABLE "$tableStocks" ("id" INTEGER, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы ProductCategories
  static const String _createTableProductCategories = 'CREATE TABLE "$tableProductCategories" ("id" INTEGER, "name" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Products
  static const String _createTableProducts = 'CREATE TABLE "$tableProducts" ("id" INTEGER, "price" DOUBLE NOT NULL, "name" TEXT NOT NULL, "productCategoryId" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("productCategoryId") REFERENCES "ProductCategories"("id"))';

  /// Запрос для создания таблицы IssuePoints
  static const String _createTableClients = 'CREATE TABLE "$tableClients" ("id" INTEGER, "name" TEXT NOT NULL, "itn" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Arrivals
  static const String _createTableProcurement = 'CREATE TABLE "$tableProcurement" ("id" INTEGER, "date" DATETIME NOT NULL, "count" INTEGER NOT NULL, "productId" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("productId") REFERENCES Products("id"))';

  /// Запрос для создания таблицы Consumptions
  static const String _createTableInvoice = 'CREATE TABLE "$tableInvoice" ("id" INTEGER, "date" DATETIME NOT NULL, "count" INTEGER NOT NULL, "productId" INTEGER NOT NULL, "userId" INTEGER NOT NULL, "clientId" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("productId") REFERENCES "Products"("id"), FOREIGN KEY("userId") REFERENCES "Users"("id"), FOREIGN KEY("clientId") REFERENCES "Clients"("id"))';
}
