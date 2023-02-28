// Autogenerated from Pigeon (v7.0.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class ErrorCodesInterface {
  ErrorCodesInterface({
    required this.paymentCancelledByUser,
  });

  String paymentCancelledByUser;

  Object encode() {
    return <Object?>[
      paymentCancelledByUser,
    ];
  }

  static ErrorCodesInterface decode(Object result) {
    result as List<Object?>;
    return ErrorCodesInterface(
      paymentCancelledByUser: result[0]! as String,
    );
  }
}

class LyraInitializeOptionsInterface {
  LyraInitializeOptionsInterface({
    required this.apiServerName,
    this.nfcEnabled,
    this.cardScanningEnabled,
  });

  String apiServerName;

  bool? nfcEnabled;

  bool? cardScanningEnabled;

  Object encode() {
    return <Object?>[
      apiServerName,
      nfcEnabled,
      cardScanningEnabled,
    ];
  }

  static LyraInitializeOptionsInterface decode(Object result) {
    result as List<Object?>;
    return LyraInitializeOptionsInterface(
      apiServerName: result[0]! as String,
      nfcEnabled: result[1] as bool?,
      cardScanningEnabled: result[2] as bool?,
    );
  }
}

class LyraKeyInterface {
  LyraKeyInterface({
    required this.publicKey,
    required this.options,
  });

  String publicKey;

  LyraInitializeOptionsInterface options;

  Object encode() {
    return <Object?>[
      publicKey,
      options.encode(),
    ];
  }

  static LyraKeyInterface decode(Object result) {
    result as List<Object?>;
    return LyraKeyInterface(
      publicKey: result[0]! as String,
      options:
          LyraInitializeOptionsInterface.decode(result[1]! as List<Object?>),
    );
  }
}

class ProcessRequestInterface {
  ProcessRequestInterface({
    required this.formToken,
    required this.errorCodes,
  });

  String formToken;

  ErrorCodesInterface errorCodes;

  Object encode() {
    return <Object?>[
      formToken,
      errorCodes.encode(),
    ];
  }

  static ProcessRequestInterface decode(Object result) {
    result as List<Object?>;
    return ProcessRequestInterface(
      formToken: result[0]! as String,
      errorCodes: ErrorCodesInterface.decode(result[1]! as List<Object?>),
    );
  }
}

class _LyraHostApiCodec extends StandardMessageCodec {
  const _LyraHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is ErrorCodesInterface) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is LyraInitializeOptionsInterface) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is LyraKeyInterface) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is ProcessRequestInterface) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return ErrorCodesInterface.decode(readValue(buffer)!);
      case 129:
        return LyraInitializeOptionsInterface.decode(readValue(buffer)!);
      case 130:
        return LyraKeyInterface.decode(readValue(buffer)!);
      case 131:
        return ProcessRequestInterface.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class LyraHostApi {
  /// Constructor for [LyraHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  LyraHostApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _LyraHostApiCodec();

  Future<LyraKeyInterface> initialize(LyraKeyInterface arg_lyraKey) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.LyraHostApi.initialize', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_lyraKey]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as LyraKeyInterface?)!;
    }
  }

  Future<int> getFormTokenVersion() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.LyraHostApi.getFormTokenVersion', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as int?)!;
    }
  }

  Future<String> process(ProcessRequestInterface arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.LyraHostApi.process', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_request]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as String?)!;
    }
  }

  Future<void> cancelProcess() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.LyraHostApi.cancelProcess', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}
