class NewComponent {
  final String controllerName;
  final String moduleName;
  final String formName;
  final String dbtableName;

  NewComponent(this.controllerName, this.moduleName, this.formName, this.dbtableName);

  NewComponent controller() {
    return this;
  }

  NewComponent module() {
    print(this.moduleName);

    return this;
  }

  NewComponent form() {
    if (this.formName == null) {
      return this;
    }

    return this;
  }

  NewComponent dbtable() {
    if (this.dbtableName == null) {
      return this;
    }

    return this;
  }
}
