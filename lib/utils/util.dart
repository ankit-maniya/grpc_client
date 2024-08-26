import 'dart:developer';

import 'package:grpc/grpc.dart';
import 'package:grpc_client/gen/helloword.pbgrpc.dart';

class Utils {
  GreeterClient getServerRef() {
    final channel = ClientChannel(
      // When we are connect our real device it need our system ip address instead of localhost
      // in mac we can get ip address by running ifconfig |grep inet in terminal
      // in windows we can get ip address by running ipconfig in cmd
      '192.168.0.244',
      port: 8080,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry:
            CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );
    final stub = GreeterClient(channel);

    log('Server reference created', name: 'utils.getServerRef');
    log(channel.port.toString(), name: 'utils.getServerRef');
    return stub;
  }
}
