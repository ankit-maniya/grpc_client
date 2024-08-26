//
//  Generated code. Do not modify.
//  source: helloword.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'helloword.pb.dart' as $0;

export 'helloword.pb.dart';

@$pb.GrpcServiceName('Greeter')
class GreeterClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
      '/Greeter/SayHello',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$invokeQRCodeScan = $grpc.ClientMethod<$0.QRScanRequest, $0.QRScanResponse>(
      '/Greeter/InvokeQRCodeScan',
      ($0.QRScanRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.QRScanResponse.fromBuffer(value));
  static final _$sendQRCodeData = $grpc.ClientMethod<$0.QRCodeData, $0.QRCodeResponse>(
      '/Greeter/SendQRCodeData',
      ($0.QRCodeData value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.QRCodeResponse.fromBuffer(value));

  GreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloReply> sayHello($0.HelloRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sayHello, request, options: options);
  }

  $grpc.ResponseFuture<$0.QRScanResponse> invokeQRCodeScan($0.QRScanRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$invokeQRCodeScan, request, options: options);
  }

  $grpc.ResponseFuture<$0.QRCodeResponse> sendQRCodeData($0.QRCodeData request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendQRCodeData, request, options: options);
  }
}

@$pb.GrpcServiceName('Greeter')
abstract class GreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'Greeter';

  GreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QRScanRequest, $0.QRScanResponse>(
        'InvokeQRCodeScan',
        invokeQRCodeScan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.QRScanRequest.fromBuffer(value),
        ($0.QRScanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QRCodeData, $0.QRCodeResponse>(
        'SendQRCodeData',
        sendQRCodeData_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.QRCodeData.fromBuffer(value),
        ($0.QRCodeResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloReply> sayHello_Pre($grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async {
    return sayHello(call, await request);
  }

  $async.Future<$0.QRScanResponse> invokeQRCodeScan_Pre($grpc.ServiceCall call, $async.Future<$0.QRScanRequest> request) async {
    return invokeQRCodeScan(call, await request);
  }

  $async.Future<$0.QRCodeResponse> sendQRCodeData_Pre($grpc.ServiceCall call, $async.Future<$0.QRCodeData> request) async {
    return sendQRCodeData(call, await request);
  }

  $async.Future<$0.HelloReply> sayHello($grpc.ServiceCall call, $0.HelloRequest request);
  $async.Future<$0.QRScanResponse> invokeQRCodeScan($grpc.ServiceCall call, $0.QRScanRequest request);
  $async.Future<$0.QRCodeResponse> sendQRCodeData($grpc.ServiceCall call, $0.QRCodeData request);
}
