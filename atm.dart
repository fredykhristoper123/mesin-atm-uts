
import 'dart:io';

void main() {
  bool ceklogin = true;
  bool jalan = true;
  int pin = 112233;
  int saldo = 2000000;

  // =========================
  // LOGIN
  // =========================
  void login() {
    print('\n================================');
    print('           SISTEM BANK');
    print('================================');

    stdout.write('Masukkan PIN Anda: ');
    int? inputpin = int.tryParse(stdin.readLineSync() ?? '');

    if (inputpin == pin) {
      ceklogin = false;
      print('Login berhasil!');
    } else {
      print('PIN salah! Silakan coba lagi.');
    }
  }

  // =========================
  // CEK SALDO
  // =========================
  void ceksaldo() {
    print('\n================================');
    print('Saldo Anda: Rp${saldo}');
    print('================================');
  }

  // =========================
  // SETOR TUNAI
  // =========================
  void setor() {
    stdout.write('Masukkan nominal yang ingin disetor: ');
    int? inputsaldo = int.tryParse(stdin.readLineSync() ?? '');

    if (inputsaldo == null || inputsaldo <= 0) {
      print('Nominal tidak valid!');
      return;
    }

    saldo = saldo + inputsaldo;

    print('Setor tunai berhasil!');
    print('Saldo sekarang: Rp$saldo');
  }

  // =========================
  // TARIK TUNAI
  // =========================
  void tarik() {
    stdout.write('Masukkan nominal yang ingin ditarik: ');
    int? inputtarik = int.tryParse(stdin.readLineSync() ?? '');

    if (inputtarik == null || inputtarik < 50000) {
      print('Nominal minimal Rp50.000!');
      return;
    }

    if (inputtarik > saldo) {
      print('Saldo tidak mencukupi!');
      return;
    }

    if (inputtarik % 50000 != 0) {
      print('Nominal harus kelipatan Rp50.000!');
      return;
    }

    print('\n================================');
    print('Pecahan:');
    print('1. Rp50.000');
    print('2. Rp100.000');
    print('================================');

    stdout.write('Pilih pecahan (1/2): ');
    int? inputpecahan =
        int.tryParse(stdin.readLineSync() ?? '');

    if (inputpecahan != 1 && inputpecahan != 2) {
      print('Pilihan pecahan tidak valid!');
      return;
    }

    if (inputpecahan == 2 && inputtarik < 100000) {
      print('Nominal minimal untuk pecahan ini Rp100.000!');
      return;
    }

    int nilai = 0;
    int nilai1 = 0;

    if (inputpecahan == 1) {
      nilai = inputtarik ~/ 50000;
      print('Rp50.000 (x$nilai)');
    } else {
      nilai = inputtarik ~/ 100000;
      int sisa = inputtarik % 100000;

      if (sisa > 0) {
        nilai1 = sisa ~/ 50000;
      }

      if (nilai > 0) {
        print('Rp100.000 (x$nilai)');
      }

      if (nilai1 > 0) {
        print('Rp50.000 (x$nilai1)');
      }
    }

    saldo = saldo - inputtarik;

    print('Penarikan berhasil!');
    print('Saldo sekarang: Rp$saldo');
  }

  // =========================
  // MENU UTAMA
  // =========================
  while (jalan) {
    if (ceklogin) {
      login();
    } else {
      print('\n================================');
      print('           MENU BANK');
      print('================================');
      print('1. Cek Saldo');
      print('2. Setor Tunai');
      print('3. Tarik Tunai');
      print('4. Keluar');
      print('================================');

      stdout.write('Silakan pilih menu (1/2/3/4): ');
      int? pilihan =
          int.tryParse(stdin.readLineSync() ?? '');

      switch (pilihan) {
        case 1:
          ceksaldo();
          break;

        case 2:
          setor();
          break;

        case 3:
          tarik();
          break;

        case 4:
          jalan = false;
          print('Terima kasih telah menggunakan layanan bank!');
          break;

        default:
          print('Pilihan menu tidak valid!');
      }
    }
  }
}