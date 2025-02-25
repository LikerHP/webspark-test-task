enum ProcessStatus {
  receivingData,
  startingCalculations,
  calculationsFinished,
  sendingResults,
  resultsSent,
  error,
}

class ProcessUtils {
  static String getMessageForStatus(ProcessStatus status) {
    return switch (status) {
      ProcessStatus.receivingData => 'Receiving data for calculations',
      ProcessStatus.startingCalculations => 'Calculations in progress',
      ProcessStatus.calculationsFinished =>
        'All calculations has finished, you can send your results to server',
      ProcessStatus.sendingResults => 'Sending results',
      ProcessStatus.resultsSent => 'Results successfully sent',
      ProcessStatus.error => 'Oops, an error occurred',
    };
  }

  /// Mocking real percentage as there is no real place where we can get data about
  /// how much of request already sent / response received.
  static int getPercentageByStatus(ProcessStatus status) {
    return switch (status) {
      ProcessStatus.receivingData => 0,
      ProcessStatus.startingCalculations => 20,
      ProcessStatus.calculationsFinished => 100,
      ProcessStatus.sendingResults => 0,
      ProcessStatus.resultsSent => 100,
      ProcessStatus.error => 100,
    };
  }
}
