class Conta {
  String c;
  int nc;
  double s;
  double sq;
  double dps;
  Conta(this.c, this.nc, this.s, this.sq, this.dps);

  void sacar() {
    s = s - sq;

    print("Valor do sq: R\$$sq");
    print("Valor total: R\$$s");
  }

  void depositar() {
    s = s + dps;
    print('Valor depositado foi R\$:$dps');
  }
}

class ContaPoupanca extends Conta {
  int rend;
  ContaPoupanca(String c, int nc, double s, double sq, double dps, this.rend)
      : super(c, nc, s, sq, dps);

  void calcs() {
    s = s + (s / 100 * rend);

    print("Valor Total:  ${s}");
  }
}

class ContaCorrente extends Conta {
  double limite;
  ContaCorrente(String c, int nc, double s, double sq, double dps, this.limite)
      : super(c, nc, s, sq, dps);
}

void main() {
  ContaPoupanca contaP =
      ContaPoupanca("Ricardo Soares", 789456, 150, 20, 130, 3);
  print("Titular: ${contaP.c}");
  print("Conta: ${contaP.nc}");
  contaP.depositar();
  contaP.calcs();
  print("O rendimento da sua conta é: ${contaP.rend}%");
  print('');
  print('');
  ContaCorrente contaC =
      ContaCorrente('Ricardo Soares', 789456, 200, 180, 30, -30);
  print("Titular: ${contaC.c}");
  print("Conta: ${contaC.nc}");
  contaC.sacar();

  if (contaC.limite > contaC.s) {
    print("Desculpe s insuficiente para o sq solicitado");
    print("Seu s é de ${contaC.s}");
  } else {}
}

//Ricardo Soares
