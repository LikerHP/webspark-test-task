abstract interface class ITaskRepository {
  Future getTasksToCalculate({required String baseUrl}) async {}

  Future postTasksSolutions({required String baseUrl}) async {}
}
