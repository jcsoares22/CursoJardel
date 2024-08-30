abstract class Failure implements Exception {
  final String message;

  Failure({required this.message});
}

class DatasouceFailure extends Failure {
  DatasouceFailure({
    required super.message,
  });
}


class RepositoryFailure extends Failure {
  RepositoryFailure({
    required super.message,
  });
}
