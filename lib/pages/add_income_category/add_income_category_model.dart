import '/flutter_flow/flutter_flow_util.dart';
import 'add_income_category_widget.dart' show AddIncomeCategoryWidget;
import 'package:flutter/material.dart';

class AddIncomeCategoryModel extends FlutterFlowModel<AddIncomeCategoryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CategoryName widget.
  FocusNode? categoryNameFocusNode;
  TextEditingController? categoryNameController;
  String? Function(BuildContext, String?)? categoryNameControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    categoryNameFocusNode?.dispose();
    categoryNameController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
