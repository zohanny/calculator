class OhmCalculator {
  late String volts;
  late String amps;
  late String ohms;
  late String expression;


  OhmCalculator({required this.volts, required this.amps, required this.ohms, required this.expression});
  OhmCalculator.empty();
  OhmCalculator.withoutOhms({required this.volts, required this.amps}) : ohms = '0';
  OhmCalculator.withoutAmps({required this.volts, required this.ohms}) : amps = '0';
  OhmCalculator.withoutVolts({required this.ohms, required this.amps}) : volts = '0';

  void calculator(){

    // convert to doubles
    double v = double.parse(volts);
    double a = double.parse(amps);
    double o = double.parse(ohms);

    //Tests which one is zero and calculates it
    v = v==0 ? _calculateVolts(a,o) : v;
    a = a==0 ? _calculateAmps(v,o) : a;
    o = o==0 ? _calculateOhms(v,a) : o;

    //reconvert to strings and update fields
    volts = v.toString();
    amps = a.toString();
    ohms = o.toString();

  }

  double _calculateVolts(double a, double o){
    expression =
        'Voltage = Current x Resistance \n'
        'Voltage = $a x $o \n'
        'Voltage = ${a*o} ';
    return a*o;
  }

  double _calculateAmps(double v, double o){

    return v/o;
  }

  double _calculateOhms(double v, double a){

    return v/a;
  }
}