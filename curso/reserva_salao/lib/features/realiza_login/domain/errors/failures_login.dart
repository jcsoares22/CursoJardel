import 'package:reserva_salao/core/failure.dart';

class CredeciaisInvalida extends Failure {
  CredeciaisInvalida({
    required super.message,
  });
}

class EmailRqueridFailure extends Failure {
  EmailRqueridFailure({
    required super.message,
  });
}
