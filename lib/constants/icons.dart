// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

const INCOME_ICONS = [
  LucideIcons.gift,
  LucideIcons.leaf,
  LucideIcons.crown,
];

final EXPENSE_ICONS = <IconData>{
  ..._utilities,
  ..._transportation,
  ..._other,
}.toList();

const CATEGORIEZED_EXPENSE_ICONS = <MapEntry<String, List<IconData>>>[
  MapEntry("Utilities", _utilities),
  MapEntry("Travel & Transportation", _transportation),
  MapEntry("Other", _other),
];

const _utilities = [
  LucideIcons.zap,
  LucideIcons.droplet,
  LucideIcons.router,
  LucideIcons.tv,
  LucideIcons.shield,
  LucideIcons.trash2,
];

const _transportation = [
  LucideIcons.truck,
  LucideIcons.plane,
  LucideIcons.car,
  LucideIcons.bus,
  LucideIcons.hotel,
  LucideIcons.fuel,
];

const _other = [
  LucideIcons.activity,
  LucideIcons.armchair,
  LucideIcons.apple,
  LucideIcons.album,
  LucideIcons.award,
  LucideIcons.book,
  LucideIcons.brush,
  LucideIcons.building,
  LucideIcons.building2,
  LucideIcons.backpack,
  LucideIcons.banana,
  LucideIcons.briefcase,
  LucideIcons.camera,
  LucideIcons.carrot,
  LucideIcons.car,
  LucideIcons.citrus,
  LucideIcons.clapperboard,
  LucideIcons.cookie,
  LucideIcons.database,
  LucideIcons.dog,
  LucideIcons.flower,
  LucideIcons.flashlight,
  LucideIcons.gem,
  LucideIcons.gift,
  LucideIcons.grape,
  LucideIcons.hardHat,
  LucideIcons.headphones,
  LucideIcons.heartCrack,
  LucideIcons.home,
  LucideIcons.laptop,
  LucideIcons.printer,
  LucideIcons.sailboat,
  LucideIcons.salad,
  LucideIcons.school,
  LucideIcons.shirt,
  LucideIcons.shovel,
  LucideIcons.shoppingCart,
  LucideIcons.shoppingBag,
  LucideIcons.soup,
  LucideIcons.sofa,
  LucideIcons.squirrel,
  LucideIcons.store,
  LucideIcons.ticket,
  LucideIcons.truck,
  LucideIcons.trees,
  LucideIcons.treePine,
  LucideIcons.tv,
  LucideIcons.tent,
  LucideIcons.warehouse,
  LucideIcons.stamp,
  LucideIcons.store,
  LucideIcons.train,
];
