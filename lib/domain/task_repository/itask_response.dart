abstract interface class ITaskResponse {
  const ITaskResponse(this.isError, this.message);

  final bool isError;
  final String message;
}
