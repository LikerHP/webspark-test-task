class TaskResult {
  const TaskResult({required this.id, required this.isCorrect});

  final String id;
  final bool isCorrect;

  factory TaskResult.fromJson(Map<String, dynamic> json) {
    return TaskResult(id: json['id'], isCorrect: json['correct']);
  }
}
