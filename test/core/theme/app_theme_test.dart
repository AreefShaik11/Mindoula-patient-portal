import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/core/theme/app_theme.dart';
import 'package:mindoula_patient_portal/core/theme/app_colors.dart';
import 'package:mindoula_patient_portal/core/theme/app_typography.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AppTypography.debugUseGoogleFonts = false;

  group('AppTheme', () {
    test('lightTheme should have correct colors and themes', () {
      final theme = AppTheme.lightTheme;
      
      expect(theme.useMaterial3, isTrue);
      expect(theme.colorScheme.primary, AppColors.primaryBlue);
      expect(theme.scaffoldBackgroundColor, AppColors.background);
      
      expect(theme.cardTheme.color, AppColors.cardBackground);
      expect(theme.cardTheme.elevation, 0);
      
      expect(theme.elevatedButtonTheme.style?.backgroundColor?.resolve({}), AppColors.primaryBlue);
    });
  });
}
