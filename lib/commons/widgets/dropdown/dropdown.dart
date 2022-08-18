import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';

class Dropdown extends StatefulWidget {
  final List<String> items;
  final void Function(String?)? onChanged;
  final String selectedValue;

  const Dropdown(
      {Key? key,
      required this.items,
      this.onChanged,
      required this.selectedValue})
      : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late AppCubit appCubit;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: appCubit.styles.defaultTextStyle(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        customButton: Row(
          children: [
            Text(
              widget.selectedValue,
              style: appCubit.styles.defaultTextStyle(),
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.white,
            ),
          ],
        ),
        value: widget.selectedValue,
        onChanged: widget.onChanged,
        buttonWidth: 150,
        dropdownWidth: 150,
        dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.uniqueGrey.withOpacity(0.5),
            border: Border.all(color: AppColors.forgedSteel)),
      ),
    );
  }
}
