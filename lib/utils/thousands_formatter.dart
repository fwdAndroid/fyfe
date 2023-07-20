import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsInputFormatter extends TextInputFormatter {
  ThousandsInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    final formater = NumberFormat.decimalPattern("en");
    String truncated = newValue.text;
    
    String checkIsdouble = truncated.replaceAll(",", "");
    log("truncated"+ truncated.toString());

    if (double.tryParse(checkIsdouble) is double) {
    num unformat  = formater.parse(truncated);
    log("unformat"+ unformat.toString());
      if (unformat > 999) {
        truncated =
            formater.format(unformat);
    log("format shode"+ truncated.toString());
      }
    }

    return TextEditingValue(
      text: truncated,
      selection:
          TextSelection.fromPosition(TextPosition(offset: truncated.length)),
      composing: TextRange.empty,
    );
  }
}
