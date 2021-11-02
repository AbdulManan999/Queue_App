import 'package:engage_app/common/constant/env.dart';
import 'package:engage_app/common/http/response.dart';
import 'package:engage_app/feature/dashboard/resources/dashboard_api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class DashboardRepository {
  final Env env;

  DashboardRepository({@required this.env});

  Future<DataResponse<Map<dynamic, dynamic>>> getDashboardData() async {
    try {
      DashboardApiProvider dashboardApiProvider =
          DashboardApiProvider(env: this.env);

      Map<dynamic, dynamic> response =
          await dashboardApiProvider.getDashboardData();

      return DataResponse.success(response);
    } catch (ex, stack) {
      debugPrintStack(stackTrace: stack, label: ex.toString());
      return DataResponse.error(ex.toString());
    }
  }
}
