import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final formatThousandsNumber = NumberFormat("#,##0", "id_ID");

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    String newText = 'Rp. ${newValue.text.replaceAll('Rp. ', '')}';
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
