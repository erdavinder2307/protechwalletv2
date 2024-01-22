import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_transaction_widget.dart' show AddTransactionWidget;
import 'package:flutter/material.dart';

class AddTransactionModel extends FlutterFlowModel<AddTransactionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in AddTransaction widget.
  List<BankAccountsRecord>? bankAccounts2;
  // Stores action output result for [Firestore Query - Query a collection] action in AddTransaction widget.
  List<ExpenseCategoryRecord>? expenseCategory2;
  // State field(s) for Bank widget.
  String? bankValue;
  FormFieldController<String>? bankValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Bank widget.
  BankAccountsRecord? bankAccounts;
  // State field(s) for TransactionType widget.
  String? transactionTypeValue;
  FormFieldController<String>? transactionTypeValueController;
  // State field(s) for Category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Category widget.
  ExpenseCategoryRecord? expenseCategory;
  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
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
    amountFocusNode?.dispose();
    amountController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
