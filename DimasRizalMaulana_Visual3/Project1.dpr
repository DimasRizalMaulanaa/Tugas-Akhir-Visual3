program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  login in 'login.pas' {Form2},
  
  Menu in 'Menu.pas' {Form4},
  konsumen in 'konsumen.pas' {Form5},
  sales in 'sales.pas' {Form6},
  suplier in 'suplier.pas' {Form7},
  barang in 'barang.pas' {Form8},
  transaksi in 'transaksi.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm1, Form1);

  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
