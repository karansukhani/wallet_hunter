String getFullName(String? firstName, String? middleName, String? lastName) {
  List<String> nameParts = [];

  if (firstName != null && firstName.trim().isNotEmpty) {
    nameParts.add(firstName.trim());
  }

  if (middleName != null && middleName.trim().isNotEmpty) {
    nameParts.add(middleName.trim());
  }

  if (lastName != null && lastName.trim().isNotEmpty) {
    nameParts.add(lastName.trim());
  }

  return nameParts.join(' ');
}

extension StringExtension on String? {
  String capitalize() {
    if (this == null || this!.isEmpty) {
      return "";
    }
    return "${this?[0].toUpperCase()}${this?.substring(1)}";
  }
}
