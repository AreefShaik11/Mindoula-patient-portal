class AppConstants {
  static const String appName = 'Mindoula Patient Portal';
  static const String appTitle = 'Mindoula Patient Portal';
  static const String version = '1.0.0';

  // Layout Dimensions
  static const double sidebarWidth = 309.0;
  static const double contentPaddingLeft = 40.0;
  static const double contentPaddingTop = 74.0; // Updated to match AppLayout
  static const double cardPadding = 16.0;
  static const double cardRadius = 16.0;
  static const double gridGap = 8.0;

  // Sidebar groupings
  static const List<String> sidebarSection1 = [
    'Home',
    'Messages',
    'Appointments',
  ];
  static const List<String> sidebarSection2 = [
    'Prescriptions',
    'Lab results',
    'Questionnaires',
    'Documents',
  ];
  static const List<String> sidebarSection3 = [
    'Insurance',
    'Billing',
    'Account',
  ];
}
