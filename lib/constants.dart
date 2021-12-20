import 'source.dart';

const kCategoriesBox = 'categories_box';
const kPreferencesBox = 'preferences_box';
const kPrefs = 'preferences';
const kRecords = 'records';
const kTotalRecords = 'total_records';
const kExpense = 'expense';
const kIncome = 'income';
const kFontFam4 = 'Louis';
const kFontFam3 = 'Outfit';
const kFontFam2 = 'Glacial';

final kDefaultCategoriesList = <Category>[
  Category(
      codePoint: AppIcons.home.codePoint,
      title: 'Rent',
      id: 'WOfZu0q6un',
      type: kIncome),
  Category(
      codePoint: AppIcons.award_2.codePoint,
      title: 'Award',
      id: '8QzyrePahi',
      type: kIncome),
  Category(
      codePoint: AppIcons.coupon.codePoint,
      title: 'Coupon',
      id: 'iNgh6rV7Ht',
      type: kIncome),
  Category(
      codePoint: AppIcons.education.codePoint,
      title: 'Education',
      id: 'nYh5nNjLEf',
      type: kExpense),
  Category(
      codePoint: AppIcons.tv.codePoint,
      title: 'Electronics',
      id: 'tEJr6yWkYr',
      type: kExpense),
  Category(
      codePoint: AppIcons.airplane.codePoint,
      title: 'Flight',
      id: 'DkKTijVDJv',
      type: kExpense),
  Category(
      codePoint: AppIcons.printer.codePoint,
      title: 'Stationaries',
      id: 'hhCHRYeNI4',
      type: kExpense),
  Category(
      codePoint: AppIcons.groceries.codePoint,
      title: 'Groceries',
      id: 'Lgby3i7P8F',
      type: kExpense),
];
