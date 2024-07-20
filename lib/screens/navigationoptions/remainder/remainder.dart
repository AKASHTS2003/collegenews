import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'remainderadd.dart'; // Make sure you have the correct import path for AddReminderPage

class RemainderPage extends StatefulWidget {
  const RemainderPage({super.key});

  @override
  _RemainderPageState createState() => _RemainderPageState();
}

class _RemainderPageState extends State<RemainderPage> {
  late Database database;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    // Open database
    database = await openDatabase(
      path.join(await getDatabasesPath(), 'remainder_database.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement
        return db.execute(
          'CREATE TABLE reminders(id INTEGER PRIMARY KEY, title TEXT, notes TEXT, date TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Remainder', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final List<Map<String, dynamic>> allReminders =
                      await database.query('reminders');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ViewAllReminders(allReminders, database: database),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2.0,
                ),
                child: const Text(
                  'View All',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddReminderPage(database: database),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2.0,
                ),
                child: const Text(
                  'Add Reminder',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewAllReminders extends StatelessWidget {
  final List<Map<String, dynamic>> allReminders;
  final Database database;

  const ViewAllReminders(this.allReminders, {required this.database, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Remainders', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: allReminders.length,
          itemBuilder: (context, index) {
            final reminder = allReminders[index];
            final String title = reminder['title'];
            final String notes = reminder['notes'];
            final DateTime date = DateTime.parse(reminder['date']);
            final String formattedDate = DateFormat.yMMMMd().format(date);
            final int reminderId = reminder['id'];

            return Card(
              margin: const EdgeInsets.all(8),
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Colors.blue,
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notes,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Date: $formattedDate',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  onPressed: () async {
                    final confirmDelete = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete Reminder'),
                          content: const Text(
                              'Are you sure you want to delete this reminder?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );

                    if (confirmDelete ?? false) {
                      await database.delete(
                        'reminders',
                        where: 'id = ?',
                        whereArgs: [reminderId],
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Reminder deleted successfully'),
                          duration: const Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'Dismiss',
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                            },
                          ),
                        ),
                      );
                      Navigator.popAndPushNamed(context, '/remainder');
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
