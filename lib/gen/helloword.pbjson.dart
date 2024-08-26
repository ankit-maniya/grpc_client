//
//  Generated code. Do not modify.
//  source: helloword.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use helloRequestDescriptor instead')
const HelloRequest$json = {
  '1': 'HelloRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `HelloRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloRequestDescriptor = $convert.base64Decode(
    'CgxIZWxsb1JlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use helloReplyDescriptor instead')
const HelloReply$json = {
  '1': 'HelloReply',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `HelloReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloReplyDescriptor = $convert.base64Decode(
    'CgpIZWxsb1JlcGx5EhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use qRScanRequestDescriptor instead')
const QRScanRequest$json = {
  '1': 'QRScanRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
  ],
};

/// Descriptor for `QRScanRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List qRScanRequestDescriptor = $convert.base64Decode(
    'Cg1RUlNjYW5SZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKAlSCXJlcXVlc3RJZA==');

@$core.Deprecated('Use qRScanResponseDescriptor instead')
const QRScanResponse$json = {
  '1': 'QRScanResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `QRScanResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List qRScanResponseDescriptor = $convert.base64Decode(
    'Cg5RUlNjYW5SZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cw==');

@$core.Deprecated('Use qRCodeDataDescriptor instead')
const QRCodeData$json = {
  '1': 'QRCodeData',
  '2': [
    {'1': 'qr_code', '3': 1, '4': 1, '5': 9, '10': 'qrCode'},
    {'1': 'request_id', '3': 2, '4': 1, '5': 9, '10': 'requestId'},
  ],
};

/// Descriptor for `QRCodeData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List qRCodeDataDescriptor = $convert.base64Decode(
    'CgpRUkNvZGVEYXRhEhcKB3FyX2NvZGUYASABKAlSBnFyQ29kZRIdCgpyZXF1ZXN0X2lkGAIgAS'
    'gJUglyZXF1ZXN0SWQ=');

@$core.Deprecated('Use qRCodeResponseDescriptor instead')
const QRCodeResponse$json = {
  '1': 'QRCodeResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `QRCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List qRCodeResponseDescriptor = $convert.base64Decode(
    'Cg5RUkNvZGVSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cw==');

