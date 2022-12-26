import 'package:flutter/material.dart';
import 'package:flutter_jolt/src/utils/spacing.dart';

class JoltSpacer extends _JoltSpacer {
  // ---------------------------------------------------------------------------
  // Vertical Spacers
  // ---------------------------------------------------------------------------
  //
  /// Vertical Spacer with height: Span.s4
  const JoltSpacer.v4({
    super.key,
  }) : super(height: Span.s4);

  /// Vertical Spacer with height: Span.s8
  const JoltSpacer.v8({
    super.key,
  }) : super(height: Span.s8);

  /// Vertical Spacer with height: Span.s16
  const JoltSpacer.v16({
    super.key,
  }) : super(height: Span.s16);

  /// Vertical Spacer with height: Span.s24
  const JoltSpacer.v24({
    super.key,
  }) : super(height: Span.s24);

  /// Vertical Spacer with height: Span.s32
  const JoltSpacer.v32({
    super.key,
  }) : super(height: Span.s32);

  /// Vertical Spacer with height: Span.s48
  const JoltSpacer.v48({
    super.key,
  }) : super(height: Span.s48);

  /// Vertical Spacer with height: Span.s64
  const JoltSpacer.v64({
    super.key,
  }) : super(height: Span.s64);

  /// Vertical Spacer with height: Span.s96
  const JoltSpacer.v96({
    super.key,
  }) : super(height: Span.s96);

  /// Vertical Spacer with height: Span.s128
  const JoltSpacer.v128({
    super.key,
  }) : super(height: Span.s128);

  // ---------------------------------------------------------------------------
  // Horizontal Spacers
  // ---------------------------------------------------------------------------
  //
  /// Horizontal Spacer with width: Span.s4
  const JoltSpacer.h4({
    super.key,
  }) : super(width: Span.s4);

  /// Horizontal Spacer with width: Span.s8
  const JoltSpacer.h8({
    super.key,
  }) : super(width: Span.s8);

  /// Horizontal Spacer with width: Span.s16
  const JoltSpacer.h16({
    super.key,
  }) : super(width: Span.s16);

  /// Horizontal Spacer with width: Span.s24
  const JoltSpacer.h24({
    super.key,
  }) : super(width: Span.s24);

  /// Horizontal Spacer with width: Span.s32
  const JoltSpacer.h32({
    super.key,
  }) : super(width: Span.s32);

  /// Horizontal Spacer with width: Span.s48
  const JoltSpacer.h48({
    super.key,
  }) : super(width: Span.s48);

  /// Horizontal Spacer with width: Span.s64
  const JoltSpacer.h64({
    super.key,
  }) : super(width: Span.s64);

  /// Horizontal Spacer with width: Span.s96
  const JoltSpacer.h96({
    super.key,
  }) : super(width: Span.s96);

  /// Horizontal Spacer with width: Span.s128
  const JoltSpacer.h128({
    super.key,
  }) : super(width: Span.s128);
}

class _JoltSpacer extends StatelessWidget {
  final double? width;
  final double? height;

  const _JoltSpacer({
    super.key,
    this.width,
    this.height,
  });

  @override
  build(BuildContext context) {
    return SizedBox(
      width: width ?? Span.s4,
      height: height ?? Span.s4,
    );
  }
}
