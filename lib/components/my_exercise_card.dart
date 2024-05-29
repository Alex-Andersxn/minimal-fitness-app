import 'package:flutter/material.dart';

class MyExerciseCard extends StatefulWidget {
  final String exerciseName;

  const MyExerciseCard({
    Key? key,
    required this.exerciseName,
  }) : super(key: key);

  @override
  _MyExerciseCardState createState() => _MyExerciseCardState();
}

class _MyExerciseCardState extends State<MyExerciseCard> {
  final List<Widget> _exerciseRows = [];

  @override
  void initState() {
    super.initState();
    _addNewRow();
  }

  void _addNewRow() {
    setState(() {
      _exerciseRows.add(_buildExerciseRow(_exerciseRows.length));
    });
  }

  void _removeRow(int index) {
    setState(() {
      if (_exerciseRows.length > 1) {
        _exerciseRows.removeAt(index);
      }
    });
  }

  Widget _buildExerciseRow(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Dismissible(
        key: ValueKey(index),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          color: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (direction) => _removeRow(index),
        child: const Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Weight',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Reps',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'RPE',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [     
            Text(
              widget.exerciseName,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            Column(
              children: _exerciseRows,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _addNewRow,
                  // child: const Text('Add Set'),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    // color: Colors.cyan,
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.inversePrimary,              
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
