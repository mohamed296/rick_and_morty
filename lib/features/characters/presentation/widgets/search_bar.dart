import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty/core/widgets/custom_text_form.dart';

class CustomSearchBar extends HookWidget {
  const CustomSearchBar({
    required this.onChange,
    this.controller,
    this.focusNode,
    super.key,
  });

  final void Function(String)? onChange;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    Timer? debounce = Timer(Duration.zero, () {});

    return CustomTextField(
      hint: "search...",
      showPrefixIcon: true,
      keyboardType: TextInputType.text,
      currentFocus: focusNode!,
      controller: controller!,
      isPrefixIcon: true,
      prefixIcon: Icons.search,
      iconColor: Colors.grey,
      label: '',
      onChange: (value) {
        if (debounce != null && debounce!.isActive) {
          debounce!.cancel();
        }

        debounce = Timer(const Duration(milliseconds: 700), () {
          onChange!.call(value);
        });
      },
    );
  }
}
