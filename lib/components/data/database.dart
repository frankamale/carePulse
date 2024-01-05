import 'package:hive/hive.dart';

class MedicationDb {
  List<String> times = [];
  final Box _myBox;

  // Constructor to initialize Hive box
  MedicationDb(this._myBox);

  // Initialize data with a default value
  void initData() {
    times = ['7:00'];
    update();
  }

  // Load data from Hive box
  void loadData() {
    times = _myBox.get('TIME', defaultValue: []);
  }

  // Update data in Hive box
  void update() {
    _myBox.put('TIME', times);
  }
}
