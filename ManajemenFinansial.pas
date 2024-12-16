program ManajemenKeuangan;
uses crt, sysutils;

type
  TTransaksi = record
    Tanggal: string[10];
    Keterangan: string[50];
    Jumlah: Int64;
    Jenis: string[10]; // 'Pemasukan' atau 'Pengeluaran'
  end;

var
  Transaksi: array[1..100] of TTransaksi;
  TotalTransaksi: integer;
  Saldo: Int64;

procedure TampilkanMenuUtama;
begin
  clrscr;
  TextColor(LightGreen);
  writeln('=====================================');
  writeln('        Manajemen Finansial          ');
  writeln('=====================================');
  TextColor(White);
  writeln('Saldo Saat Ini: Rp', Saldo);
  writeln('1. Catat Pengeluaran');
  writeln('2. Catat Pemasukan');
  writeln('3. Tambah Saldo');
  writeln('4. Tampilkan Transaksi');
  writeln('5. Keluar');
  writeln('=====================================');
  TextColor(LightGreen);
  write('Pilih menu: ');
  TextColor(White);
end;

procedure CatatPengeluaran;
var
  NamaBarang: string[50];
  HargaBarang: Int64;
  pilihan: integer;
begin
  clrscr;
  TextColor(LightRed);
  writeln('=====================================');
  writeln('          Catat Pengeluaran          ');
  writeln('=====================================');
  TextColor(White);
  writeln('1. Makan & Minum');
  writeln('2. Transportasi');
  writeln('3. Kebutuhan Sehari-hari');
  writeln('4. Lainnya');
  writeln('=====================================');
  TextColor(LightRed);
  write('Pilih kategori: ');
  TextColor(White);
  readln(pilihan);
  case pilihan of
    1: NamaBarang := 'Makan & Minum';
    2: NamaBarang := 'Transportasi';
    3: NamaBarang := 'Kebutuhan Sehari-hari';
    4: begin
         write('Masukkan Keterangan: '); readln(NamaBarang);
       end;
  else
    writeln('Pilihan tidak valid.');
    exit;
  end;
  write('Masukkan Jumlah Uang Keluar: '); readln(HargaBarang);
  if TotalTransaksi < 100 then // Berdasarkan jumlah maksimal array
  begin
    Inc(TotalTransaksi);
    Transaksi[TotalTransaksi].Tanggal := FormatDateTime('DD-MM-YYYY', Now); // Tanggal otomatis
    Transaksi[TotalTransaksi].Keterangan := NamaBarang;
    Transaksi[TotalTransaksi].Jumlah := HargaBarang;
    Transaksi[TotalTransaksi].Jenis := 'Pengeluaran';
    Saldo := Saldo - HargaBarang;
    writeln('Pengeluaran berhasil dicatat!');
  end
  else
    writeln('Maksimum jumlah transaksi tercapai.');
  readln;
end;

procedure CatatPemasukan;
var
  JenisPemasukan: string[50];
  JumlahPemasukan: Int64;
begin
  clrscr;
  TextColor(LightBlue);
  writeln('=====================================');
  writeln('           Catat Pemasukan           ');
  writeln('=====================================');
  TextColor(White);
  write('Masukkan Jenis Pemasukan: '); readln(JenisPemasukan);
  write('Masukkan Jumlah Pemasukan: '); readln(JumlahPemasukan);
  if TotalTransaksi < 100 then // Berdasarkan jumlah maksimal array
  begin
    Inc(TotalTransaksi);
    Transaksi[TotalTransaksi].Tanggal := FormatDateTime('DD-MM-YYYY', Now); // Tanggal otomatis
    Transaksi[TotalTransaksi].Keterangan := JenisPemasukan;
    Transaksi[TotalTransaksi].Jumlah := JumlahPemasukan;
    Transaksi[TotalTransaksi].Jenis := 'Pemasukan';
    Saldo := Saldo + JumlahPemasukan;
    writeln('Pemasukan berhasil dicatat!');
  end
  else
    writeln('Maksimum jumlah transaksi tercapai.');
  readln;
end;

procedure TambahSaldo;
var
  TambahSaldo: Int64;
begin
  clrscr;
  TextColor(LightCyan);
  writeln('=====================================');
  writeln('             Tambah Saldo            ');
  writeln('=====================================');
  TextColor(White);
  write('Masukkan jumlah saldo yang ingin ditambahkan: '); readln(TambahSaldo);
  Saldo := Saldo + TambahSaldo;
  writeln('Saldo berhasil ditambahkan!');
  readln;
end;

procedure TampilkanTransaksi;
var
  i: integer;
begin
  clrscr;
  TextColor(LightMagenta);
  writeln('=====================================');
  writeln('          Daftar Transaksi           ');
  writeln('=====================================');
  TextColor(White);
  for i := 1 to TotalTransaksi do // Mengulang sebanyak  total transaksi yang diinput
  begin
    writeln('Tanggal: ', Transaksi[i].Tanggal);
    writeln('Keterangan: ', Transaksi[i].Keterangan);
    writeln('Jumlah: Rp', Transaksi[i].Jumlah);
    writeln('Jenis: ', Transaksi[i].Jenis);
    writeln('-------------------------------------');
  end;
  readln;
end;

var
  pilihan: integer;

begin // Main program
clrscr;
  TotalTransaksi := 0;
  Saldo := 0;
  repeat
    TampilkanMenuUtama;
    readln(pilihan);
    case pilihan of
      1: CatatPengeluaran;
      2: CatatPemasukan;
      3: TambahSaldo;
      4: TampilkanTransaksi;
    end;
  until pilihan = 5;
end.
