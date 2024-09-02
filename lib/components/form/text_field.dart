import 'package:expense_tracker_v2/extensions/source.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/themes/color_scheme.dart';
import '../../styles/text_field_decoration.dart';
import '../label.dart';

class TemboTextField extends ConsumerStatefulWidget {
  final TextEditingController? controller;
  final bool obscureText;

  final String? Function(String?)? validator;

  final ValueChanged<String>? onChanged;
  final void Function(String?)? onSave;

  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final bool? enabled;
  final List<TextInputFormatter>? formatters;
  final TextAlign? textAlign;
  final String? hint;
  final TemboTextFieldDecoration? decoration;

  final String? label;

  const TemboTextField({
    this.controller,
    this.obscureText = false,
    this.focusNode,
    this.enabled,
    this.textCapitalization,
    this.onChanged,
    this.onSave,
    this.textInputType,
    this.formatters,
    this.hint,
    super.key,
    this.textAlign,
    this.validator,
    this.decoration,
  }) : label = null;

  TemboTextField.value(
    String value, {
    this.label,
    this.textCapitalization,
    super.key,
    this.textAlign,
    this.decoration,
  })  : textInputType = null,
        hint = null,
        validator = null,
        obscureText = false,
        onChanged = null,
        onSave = null,
        focusNode = null,
        formatters = null,
        enabled = false,
        controller = TextEditingController(text: value);

  const TemboTextField.labelled(
    String lbl, {
    this.controller,
    this.obscureText = false,
    this.focusNode,
    this.enabled,
    this.textCapitalization,
    this.onChanged,
    this.onSave,
    this.textInputType,
    this.formatters,
    this.validator,
    this.hint,
    super.key,
    this.textAlign,
    this.decoration,
  }) : label = lbl;

  @override
  ConsumerState<TemboTextField> createState() => _TemboTextFieldState();
}

class _TemboTextFieldState extends ConsumerState<TemboTextField> {
  final controllerHasTextNotifier = ValueNotifier(false);

  final fieldErrorValidatorNotifier = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    final controller = widget.controller;

    if (controller != null) {
      controllerHasTextNotifier.value = controller.text.isNotEmpty;
      controller.addListener(() {
        controllerHasTextNotifier.value = controller.text.isNotEmpty;
      });
    }
  }

  TemboTextFieldDecoration getDecoration(BuildContext context) {
    final scheme = getTemboColorScheme();

    final defaultDeco = TemboTextFieldDecoration(borderColor: scheme.border);
    var decoration = widget.decoration ?? defaultDeco;
    decoration = decoration.copyWith(hint: widget.hint);

    if (!(widget.enabled ?? true)) {
      decoration = decoration.copyWith(fillColor: scheme.surfaceContainer);
    }

    if (decoration.hintStyle == null) {
      decoration = decoration.copyWith(
          hintStyle: context.textTheme.bodyMedium?.bold.defaultFF
              .copyWith(color: scheme.hint));
    }

    if (decoration.valueStyle == null) {
      decoration = decoration.copyWith(
          valueStyle: context.textTheme.bodyMedium?.bold.defaultFF
              .copyWith(color: scheme.onBackground));
    }
    return decoration;
  }

  @override
  Widget build(BuildContext context) {
    final decoration = getDecoration(context);
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaler: const TextScaler.linear(1.0));

    return MediaQuery(
      data: mqDataNew,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.label != null)
            AppLabel(
              widget.label!,
              style: decoration.labelStyle,
            ),
          SizedBox(
            width: decoration.size?.width,
            height: decoration.size?.height,
            child: handleValidationErrors(),
          ),
        ],
      ),
    );
  }

  Widget handleValidationErrors() {
    return ValueListenableBuilder<String?>(
        valueListenable: fieldErrorValidatorNotifier,
        builder: (context, error, snapshot) {
          return buildField(error);
        });
  }

  Widget buildField([String? error]) {
    final decoration = getDecoration(context);

    final bool canExpand = decoration.size != null;

    final hasError = error != null;

    return Column(
      children: [
        TextFormField(
          style: decoration.valueStyle,
          controller: widget.controller,
          focusNode: widget.focusNode,
          obscureText: widget.obscureText,
          decoration: hasError
              ? decoration
                  .copyWith(borderColor: context.colorScheme.error)
                  .getInputDecoration
              : decoration.getInputDecoration.copyWith(
                  errorStyle: context.textTheme.bodySmall.withSize(0),
                ),
          inputFormatters: widget.formatters,
          validator: validate,
          textAlign: widget.textAlign ?? TextAlign.start,
          onTap: () {
            fieldErrorValidatorNotifier.value = null;
          },
          onSaved: widget.onSave,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          textInputAction: TextInputAction.done,
          keyboardType: widget.textInputType,
          onChanged: widget.onChanged,
          enabled: widget.enabled ?? true,
          expands: canExpand,
          textAlignVertical: TextAlignVertical.center,
          maxLines: canExpand ? null : 1,
          minLines: canExpand ? null : null,
        ),
      ],
    );
  }

  String? validate(String? value) {
    if (widget.validator != null) {
      final fieldValidatorError = widget.validator!(value);
      if (fieldValidatorError != null) {
        fieldErrorValidatorNotifier.value = fieldValidatorError;
        return fieldValidatorError;
      }
    }

    return null;
  }
}
