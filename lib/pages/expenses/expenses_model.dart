import '/flutter_flow/flutter_flow_util.dart';
import 'expenses_widget.dart' show ExpensesWidget;
import 'package:flutter/material.dart';

class ExpensesModel extends FlutterFlowModel<ExpensesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
