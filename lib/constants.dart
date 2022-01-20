import 'source.dart';

const kSupabaseUrl = 'https://mzdcrckdvywjtgjxlogb.supabase.co';
const kSupabaseSecret = '547df72f-cef7-466e-9a5d-52af5e191571';

const kCategories = 'categories_box';
const kPreferences = 'preferences_box';
const kPrefs = 'preferences';
const kCategoryAmounts = 'category_amounts';
const kRecords = 'records';
const kBudgets = 'budgets';
const kTotalRecords = 'total_records';
const kAllDaysTotals = 'all_days_total_amounts';
const kGrossAmounts = 'gross_amounts';
const kExpense = 'expense';
const kIncome = 'income';
const kClient = 'client';

const kFontFam2 = 'AndroidEuclid';
const kFontFam = "LondonTube";

const kAddCategoryPosition = 'add_category_position';
const kWithTotalsList = 'with_totals_list';

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
