import 'source.dart';

const kCategoriesBox = 'categories_box';
const kPreferencesBox = 'preferences_box';
const kPrefs = 'preferences';
const kRecords = 'records';
const kTotalRecords = 'total_records';
const kExpense = 'expense';
const kIncome = 'income';
const kFontFam2 = 'Louis';
const kFontFam3 = 'Outfit';

final kDefaultCategoriesList = <Category>[
  Category(
      codePoint: AppIcons.home.codePoint,
      title: 'Rent',
      id: '0',
      type: kIncome),
  Category(
      codePoint: AppIcons.award_2.codePoint,
      title: 'Award',
      id: '1',
      type: kIncome),
  Category(
      codePoint: AppIcons.coupon.codePoint,
      title: 'Coupon',
      id: '2',
      type: kIncome),
  Category(
      codePoint: AppIcons.education.codePoint,
      title: 'Education',
      id: '3',
      type: kExpense),
  Category(
      codePoint: AppIcons.tv.codePoint,
      title: 'Electronics',
      id: '4',
      type: kExpense),
  Category(
      codePoint: AppIcons.airplane.codePoint,
      title: 'Flight',
      id: '5',
      type: kExpense),
  Category(
      codePoint: AppIcons.printer.codePoint,
      title: 'Stationaries',
      id: '6',
      type: kExpense),
  Category(
      codePoint: AppIcons.groceries.codePoint,
      title: 'Groceries',
      id: '7',
      type: kExpense),
];
