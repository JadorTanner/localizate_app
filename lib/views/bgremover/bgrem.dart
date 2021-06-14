import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _Ourkey {
  final Object providerCacheKey;
  _Ourkey(this.providerCacheKey);

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is _Ourkey && other.providerCacheKey == providerCacheKey;
  }

  int get hasCode => providerCacheKey.hashCode;
}

class OurImageProvider extends ImageProvider<_Ourkey> {
  final ImageProvider imageProvider;
  OurImageProvider(this.imageProvider);

  @override
  ImageStreamCompleter load(_Ourkey key, decode) {
    final ourDecoder = (
      Uint8List bytes, {
      bool allowUpscaling,
      int cacheWidth,
      int cacheHeight,
    }) async {
      return decode(await whiteToAlpha(bytes),
          cacheWidth: cacheWidth, cacheHeight: cacheHeight);
    };
    return imageProvider.load(key.providerCacheKey, ourDecoder);
  }

  @override
  Future<_Ourkey> obtainKey(ImageConfiguration configuration) {
    Completer<_Ourkey> completer;
    SynchronousFuture<_Ourkey> result;
    imageProvider.obtainKey(configuration).then((Object key) {
      // ignore: unnecessary_null_comparison
      if (completer == null) {
        result = SynchronousFuture<_Ourkey>(_Ourkey(key));
      } else {
        completer.complete(_Ourkey(key));
      }
    });
    // ignore: unnecessary_null_comparison
    if (result != null) {
      return result;
    }
    completer = Completer<_Ourkey>();
    return completer.future;
  }
}
