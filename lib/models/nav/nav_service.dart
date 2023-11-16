import 'package:auto_titanic/models/nav/nav.dart';

class NavService extends NavModel {
  NavService({
    required String label,
  }) : super(
          label: label,
          showIcon: false,
        );
}
