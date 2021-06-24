import 'package:flutter/material.dart';
import 'package:konoha/konoha.dart';

class CustomFormWidget extends StatelessWidget {
  final String label;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomFormWidget({required this.label, this.maxLines, this.validator, this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: KonohaColors.branco_deactivate,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(width: 3)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Color(0xFFC4C4C4))),
          ),
          maxLines: maxLines ?? 1,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
