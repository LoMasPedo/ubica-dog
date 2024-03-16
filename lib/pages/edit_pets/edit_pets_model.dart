import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_pets_widget.dart' show EditPetsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPetsModel extends FlutterFlowModel<EditPetsWidget> {
  ///  Local state fields for this page.

  bool? create = false;

  bool? ubicationSet = false;

  LatLng? ubicationMaps;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nameUpdatePet widget.
  FocusNode? nameUpdatePetFocusNode;
  TextEditingController? nameUpdatePetController;
  String? Function(BuildContext, String?)? nameUpdatePetControllerValidator;
  // State field(s) for Pet_type widget.
  String? petTypeValue;
  FormFieldController<String>? petTypeValueController;
  // State field(s) for UpdateRace widget.
  FocusNode? updateRaceFocusNode;
  TextEditingController? updateRaceController;
  String? Function(BuildContext, String?)? updateRaceControllerValidator;
  // State field(s) for UpdateDescription widget.
  FocusNode? updateDescriptionFocusNode;
  TextEditingController? updateDescriptionController;
  String? Function(BuildContext, String?)? updateDescriptionControllerValidator;
  // State field(s) for BorndateText widget.
  FocusNode? borndateTextFocusNode;
  TextEditingController? borndateTextController;
  String? Function(BuildContext, String?)? borndateTextControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameUpdatePetFocusNode?.dispose();
    nameUpdatePetController?.dispose();

    updateRaceFocusNode?.dispose();
    updateRaceController?.dispose();

    updateDescriptionFocusNode?.dispose();
    updateDescriptionController?.dispose();

    borndateTextFocusNode?.dispose();
    borndateTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
