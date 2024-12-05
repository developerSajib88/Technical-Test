import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_test/core/dependency_injection/dependency_injection.dart';
import 'package:technical_test/data/model/table/table_row.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DynamicTable extends HookConsumerWidget {

  static String get path => "/dynamicTable";
  static String get name => "dynamicTable";

  const DynamicTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dynamicTableState = ref.watch(dynamicTableProvider);
    final dynamicTableCtrl = ref.read(dynamicTableProvider.notifier);

    useEffect((){
      Future.microtask(()=> dynamicTableCtrl.fetchTableData());
      return null;
    },[]);

    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Table')),
      body: dynamicTableState.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Table(
            border: TableBorder.all(),
            children: dynamicTableState.map((row) {
              return TableRow(
                children: row.cells.map((cell) {
                  final isEditable = cell == 'EditText';
                  return TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: isEditable
                          ? EditableCell(row, cell)
                          : Text(cell),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Calculate and show the sum
              final sum = calculateSum(dynamicTableState);
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text('Sum: $sum'),
                ),
              );
            },
            child: Text('Sum'),
          )
        ],
      ),
    );
  }

  int calculateSum(List<TableRowData> tableData) {
    final uniqueNumbers = <int>{};
    int sum = 0;
    for (var row in tableData) {
      for (var cell in row.cells) {
        final num = int.tryParse(cell);
        if (num != null && uniqueNumbers.add(num)) {
          sum += num;
        }
      }
    }
    return sum;
  }
}

class EditableCell extends StatefulWidget {
  final TableRowData row;
  final String cell;

  EditableCell(this.row, this.cell);

  @override
  State<EditableCell> createState() => _EditableCellState();
}

class _EditableCellState extends State<EditableCell> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.cell == 'EditText' ? '' : widget.cell;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        errorText: _validateInput(controller.text),
      ),
      onChanged: (value) {
        // Update the cell and validate
        setState(() {});
      },
    );
  }

  String? _validateInput(String input) {
    final num = int.tryParse(input);
    if (num == null || num < 100 || num > 999) {
      return 'Enter a number 100-999';
    }
    // Ensure no duplicates in row
    final duplicates = widget.row.cells.where((cell) => cell == input).length;
    if (duplicates > 1) {
      return 'Duplicate number';
    }
    return null;
  }
}
