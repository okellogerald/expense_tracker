import 'source.dart';

const kDefaultPassword = 'default_password@expense_tracker';

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
const kUser = 'user';

const kRegisterImageurl =
    'https://mzdcrckdvywjtgjxlogb.supabase.in/storage/v1/object/sign/app.images/register.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhcHAuaW1hZ2VzL3JlZ2lzdGVyLnBuZyIsImlhdCI6MTY0MjkzMzc5NCwiZXhwIjoxOTU4MjkzNzk0fQ.7Zmq8NQsjospOKNbDcLHmtbIdVI3fYQ0fkcy1WkAu0c';

const kVerifyImageurl =
    'https://mzdcrckdvywjtgjxlogb.supabase.in/storage/v1/object/sign/app.images/stamp.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhcHAuaW1hZ2VzL3N0YW1wLnBuZyIsImlhdCI6MTY0MjkzMzc3NCwiZXhwIjoxOTU4MjkzNzc0fQ.dySoF3sSg7V97q9Ow_AGbPc0pqoeqzrvVvEWsL-DsjE';

const kVerifyUserImageUrl =
    'https://mzdcrckdvywjtgjxlogb.supabase.in/storage/v1/object/sign/app.images/verify.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhcHAuaW1hZ2VzL3ZlcmlmeS5wbmciLCJpYXQiOjE2NDI5MzM3NTAsImV4cCI6MTk1ODI5Mzc1MH0.Da19FtMFqnlQ-1RuYmYfOD9PycX64dAajZ_6zYj1-WU';

const kCompleteImageUrl =
    'https://mzdcrckdvywjtgjxlogb.supabase.in/storage/v1/object/sign/app.images/complete.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhcHAuaW1hZ2VzL2NvbXBsZXRlLnBuZyIsImlhdCI6MTY0MjkzMzYzMCwiZXhwIjoxOTU4MjkzNjMwfQ.XpOP6K96qLiwnk4JiqpOgw8NgzF45ESwhHodq4Fjs-I';

const kVerifyImage3Url =
    'https://mzdcrckdvywjtgjxlogb.supabase.in/storage/v1/object/sign/app.images/verify_account.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhcHAuaW1hZ2VzL3ZlcmlmeV9hY2NvdW50LnBuZyIsImlhdCI6MTY0MjkzNDY5OSwiZXhwIjoxOTU4Mjk0Njk5fQ.YKyt-y2zUCXKwuEUaU0NfMms8DkCBA8V3B8UhzbidZQ';

const kDefaultPhotoUrl =
    'https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-128.png';

const kFontFam = "Avenir";
const kFontFam2 = 'Stratos';
const kFontFam3 = 'SpaceMono';

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
      type: kExpense)
];
