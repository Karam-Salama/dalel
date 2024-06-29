import '../../../../core/utils/app_colors.dart';
import '../auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      side: const BorderSide(color: AppColors.grey, width: 1.0),
      onChanged: (newValue) {
        setState(() {
          value = newValue!;
          BlocProvider.of<AuthCubit>(context)
              .updateTermsAndConditionsCheckbox(newValue: newValue);
        });
      },
    );
  }
}
