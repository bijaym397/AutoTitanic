import 'package:auto_titanic/utils/enums.dart';
import 'package:flutter/widgets.dart';

typedef ConstrainedBuilder = Widget Function(BuildContext, BoxConstraints);

typedef WidgetCallback<T> = Widget Function(T);

typedef StringCallback<T> = String Function(T);

typedef VehicleHover = (Vehicle, HoverItem);
