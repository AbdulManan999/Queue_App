import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engage_app/common/http/response.dart';
import 'package:engage_app/feature/dashboard/resources/dashboard_repository.dart';
import 'index.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is DashboardLoadingEvent) {
      yield* mapDashboardLoadingEventToState(event);
    }
  }

  Stream<DashboardState> mapDashboardLoadingEventToState(
      DashboardLoadingEvent event) async* {
    yield DashboardLoading();

    await Future.delayed(Duration(seconds: 3));

    // DashboardRepository dashboardRepository =
    //     DashboardRepository(env: event.env);
    //
    // DataResponse<Map<dynamic, dynamic>> response =
    //     await dashboardRepository.getDashboardData();

    // if(response.status == Status.Success){
    yield DashboardLoadSuccess();
    // }
    // else{
    //   yield DashboardLoadFail(error: response.message);
    // }
  }
}
