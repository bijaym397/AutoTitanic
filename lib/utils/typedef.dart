import 'package:flutter/widgets.dart';

typedef ConstrainedBuilder = Widget Function(BuildContext, BoxConstraints);

typedef WidgetCallback<T> = Widget Function(T);

typedef StringCallback<T> = String Function(T);
