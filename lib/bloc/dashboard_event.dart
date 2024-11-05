part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class GetDashboard extends DashboardEvent {
  final currentUserReference;

  GetDashboard(DocumentReference<Object?>? this.currentUserReference);
}
