import 'package:get/get.dart';

import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/transactions/views/transaction_list_view.dart';

class RoutePages {
  static final routes = [
    GetPage(name: '/dashboard', page: () => DashboardView()),
    GetPage(name: '/transactions', page: () => TransactionListView()),
  ];
}
