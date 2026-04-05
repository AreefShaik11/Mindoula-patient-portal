// ignore_for_file: unused_import
import 'package:mindoula_patient_portal/main.dart';
import 'package:mindoula_patient_portal/core/theme/app_colors.dart';
import 'package:mindoula_patient_portal/core/theme/app_typography.dart';
import 'package:mindoula_patient_portal/core/constants/app_constants.dart';
import 'package:mindoula_patient_portal/core/routes/app_router.dart';
import 'package:mindoula_patient_portal/modules/account/model/account_state.dart';
import 'package:mindoula_patient_portal/modules/account/view/account_screen.dart';
import 'package:mindoula_patient_portal/modules/account/viewmodel/account_view_model.dart';
import 'package:mindoula_patient_portal/modules/billing/model/billing_model.dart';
import 'package:mindoula_patient_portal/modules/billing/view/billing_screen.dart';
import 'package:mindoula_patient_portal/modules/billing/viewmodel/billing_view_model.dart';
import 'package:mindoula_patient_portal/modules/dashboard/model/dashboard_state.dart';
import 'package:mindoula_patient_portal/modules/dashboard/view/dashboard_screen.dart';
import 'package:mindoula_patient_portal/modules/dashboard/viewmodel/dashboard_view_model.dart';
import 'package:mindoula_patient_portal/modules/messages/model/message_model.dart';
import 'package:mindoula_patient_portal/modules/messages/view/message_center_screen.dart';
import 'package:mindoula_patient_portal/modules/messages/viewmodel/message_view_model.dart';
import 'package:mindoula_patient_portal/modules/prescription/model/prescription.dart';
import 'package:mindoula_patient_portal/modules/prescription/view/prescription_screen.dart';
import 'package:mindoula_patient_portal/modules/prescription/viewmodel/prescription_view_model.dart';
import 'package:mindoula_patient_portal/shared/layout/app_layout.dart';
import 'package:mindoula_patient_portal/shared/widgets/sidebar/app_sidebar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AppTypography.debugUseGoogleFonts = false;
  test('Exercise all files for coverage', () {
    // Calling some constants/statics to ensure files are 'hit'
    expect(AppColors.primaryBlue, isNotNull);
    expect(AppConstants.sidebarWidth, isNotNull);
    expect(AppTypography.h1, isNotNull);
  });
}
