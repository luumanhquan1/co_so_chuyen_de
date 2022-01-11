enum TypeRow { checkbox, text, status }

class ManagerPersonalInformationRow {
  String title = '';
  dynamic value;
  TypeRow type = TypeRow.text;

  ManagerPersonalInformationRow(this.title, this.value, this.type);

  ManagerPersonalInformationRow.DocumentDefault(
      this.title,
      this.value,
      );
}