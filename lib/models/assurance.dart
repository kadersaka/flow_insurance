class Assurance {
  String name, delay, subscriptionDate, expiryDate, activated, reparationsCounter;
  Assurance(this.name, this.delay, this.subscriptionDate, this.expiryDate, this.reparationsCounter, this.activated);
  Map<String, String> toJson() {
    return {
      "name": name,
      "delay": delay,
      "subscriptionDate": subscriptionDate,
      "expiryDate": expiryDate,
      "reparationsCounter": reparationsCounter,
      "activated": reparationsCounter,
    };
  }
}
