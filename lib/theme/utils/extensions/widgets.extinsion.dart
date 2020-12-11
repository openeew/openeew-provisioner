import 'package:flutter/material.dart';
import 'package:openeew_provisioner/theme/carbon.dart';

extension CFormContextExtension on BuildContext {
  CFormState get cform {
    return CForm.of(this);
  }
}
