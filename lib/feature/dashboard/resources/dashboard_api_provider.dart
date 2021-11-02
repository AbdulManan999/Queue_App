import 'package:engage_app/common/constant/env.dart';
import 'package:engage_app/common/http/api_provider.dart';
import 'package:flutter/cupertino.dart';

class DashboardApiProvider {
  final Env env;

  DashboardApiProvider({@required this.env});

  String _apiEndPoint = "";

  Future<Map<dynamic, dynamic>> getDashboardData() async {
    try {
      ApiProvider apiProvider = ApiProvider();
      return await apiProvider.get("${env.baseUrl}$_apiEndPoint");
    } catch (ex, stack) {
      debugPrintStack(stackTrace: stack, label: ex.toString());
    }
  }
}
