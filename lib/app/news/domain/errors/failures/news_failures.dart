abstract class NewsFailures {
  final String error;

  NewsFailures(this.error);

  @override
  String toString() {
    return 'NewsFailures{erro: $error}';
  }
}

class DataSourceFailure extends NewsFailures{
  DataSourceFailure(String error) : super(error);
}
