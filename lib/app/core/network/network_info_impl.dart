import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:barbershop/app/core/network/network_info.dart';

class NetworkInfoImpl extends NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get hasConnection => connectionChecker.hasConnection;
}
