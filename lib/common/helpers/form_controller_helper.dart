import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

typedef FormSubmitCallback = Future<void> Function(
    Map<String, dynamic> values,
    );

class FormController {
  final GlobalKey<FormBuilderState> formKey;
  final ValueNotifier<bool> isEditing;

  FormController({
    required this.formKey,
    bool initialEditing = false,
  }) : isEditing = ValueNotifier(initialEditing);

  /// 🔹 Bật chế độ edit
  void startEdit() {
    isEditing.value = true;
  }

  /// 🔹 Huỷ edit + reset form
  void cancelEdit() {
    formKey.currentState?.reset();
    isEditing.value = false;
  }

  /// 🔹 Save local hoặc gọi API
  Future<void> save({
    required FormSubmitCallback onSubmit,
    VoidCallback? onSuccess,
    void Function(Object error)? onError,
  }) async {
    final form = formKey.currentState;
    if (form == null) return;

    final isValid = form.saveAndValidate();
    if (!isValid) return;

    try {
      await onSubmit(form.value);
      isEditing.value = false;
      onSuccess?.call();
    } catch (e) {
      onError?.call(e);
    }
  }

  void dispose() {
    isEditing.dispose();
  }
}