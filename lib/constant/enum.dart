import 'package:flutter/foundation.dart';

enum SavingsType { personal, group }

enum GroupsType { goals, rotational }

extension GroupsTypeEx on GroupsType {
  String get name => describeEnum(this);
  String get value {
    switch (this) {
      case GroupsType.goals:
        {
          return 'goals';
        }
      case GroupsType.rotational:
        {
          return 'rotational';
        }
    }
  }
}
