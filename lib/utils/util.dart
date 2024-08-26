import 'package:grpc/grpc.dart';
import 'package:grpc_client/gen/helloword.pbgrpc.dart';

class Utils {
  GreeterClient getServerRef() {
    final channel = ClientChannel(
      'localhost',
      port: 50051,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry:
            CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );
    final stub = GreeterClient(channel);

    return stub;
  }
}
