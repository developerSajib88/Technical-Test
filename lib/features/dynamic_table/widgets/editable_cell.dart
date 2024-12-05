
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_test/common/global/functions/global_functions.dart';
import 'package:technical_test/core/dependency_injection/dependency_injection.dart';
import 'package:technical_test/data/model/table/table_row.dart';
import 'package:technical_test/utils/utils.dart';

class EditableCell extends StatefulHookConsumerWidget {
  final TableRowData row;
  final String cell;

  const EditableCell(this.row, this.cell, {super.key});

  @override
  ConsumerState<EditableCell> createState() => _EditableCellState();
}

class _EditableCellState extends ConsumerState<EditableCell> {

  String key = Random().nextInt(2384928439).toString();
  final TextEditingController controller = TextEditingController();

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
        border: const OutlineInputBorder(),
        errorText: GlobalFunctions.validateInput(tableRowData: widget.row,input: controller.text),
        errorStyle: TextStyle(fontSize: 5.5.sp),
      ),
      onChanged: (value)=> ref.read(dynamicTableProvider.notifier).addEnteredValues(key,value),
    );
  }


}
