import 'source.dart';

const cCategoriesBox = 'categories_box';
const cExpense = 'expense';
const cIncome = 'income';

final cDefaultCategoriesList = <Category>[
  Category(codePoint: 0xe805, title: 'Rent', id: '0', type: cIncome),
  Category(codePoint: 0xe800, title: 'Award', id: '1', type: cIncome),
  Category(codePoint: 0xe802, title: 'Coupon', id: '2', type: cIncome),
  Category(codePoint: 0xe803, title: 'Education', id: '3', type: cExpense),
  Category(codePoint: 0xe804, title: 'Electronics', id: '4', type: cExpense),
  Category(codePoint: 0xe80b, title: 'Flight', id: '5', type: cExpense),
  Category(codePoint: 0xe801, title: 'Stationaries', id: '6', type: cExpense),
  Category(codePoint: 0xe808, title: 'Shopping', id: '7', type: cExpense),
];
