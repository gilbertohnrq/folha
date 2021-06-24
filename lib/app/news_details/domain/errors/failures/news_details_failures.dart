abstract class NewsDetailsFailures {
  final String error;

  NewsDetailsFailures(this.error);

  @override
  String toString() {
    return 'NewsDetailsFailures{erro: $error}';
  }
}

class DataSourceFailure extends NewsDetailsFailures{
  DataSourceFailure(String error) : super(error);
}
