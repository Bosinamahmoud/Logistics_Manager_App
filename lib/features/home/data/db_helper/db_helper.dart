import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:logistics_manager_app/core/data/model/trip_model.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  DbHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'trips.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE trips(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            assignedDriver TEXT,
            assignedVehicle TEXT,
            pickupLocation TEXT,
            dropoffLocation TEXT,
            status TEXT,
            vehicleType TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertTrip(TripModel trip) async {
    final database = await db;
    return await database.insert('trips', trip.toMap());
  }

  Future<List<TripModel>> getTrips() async {
    final database = await db;
    final List<Map<String, dynamic>> maps = await database.query('trips');
    return maps.map((map) => TripModel.fromMap(map)).toList();
  }

  Future<int> updateTrip(TripModel trip) async {
    final database = await db;
    return await database.update(
      'trips',
      trip.toMap(),
      where: 'id = ?',
      whereArgs: [trip.id],
    );
  }

  Future<int> deleteTrip(int id) async {
    final database = await db;
    return await database.delete(
      'trips',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}