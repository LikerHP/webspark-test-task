class ProcessUtils {
  static String getMessageForProgress(int progress) {
    if (progress >= 100) {
      return 'All calculations has finished, you can send your results to server';
    } else {
      return 'Calculations in progress';
    }
  }
}
