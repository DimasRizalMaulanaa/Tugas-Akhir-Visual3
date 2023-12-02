unit konsumen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, frxClass, frxDBSet;

type
  TForm5 = class(TForm)
    Label4l3: TLabel;
    Label4l4: TLabel;
    Label4l5: TLabel;
    Label4l6: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    dg1: TDBGrid;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    Bb6: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    Button1: TButton;
    ComboBox1: TComboBox;
    edit6: TEdit;
    Label4: TLabel;
    Edit1: TEdit;
    procedure b4Click(Sender: TObject);
    procedure posisiawal;
    procedure b1Click(Sender: TObject);
    procedure editbersih;
    procedure editenable;
    procedure FormShow(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure Bb6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  id : string;

implementation

uses
  Menu;

{$R *.dfm}

procedure TForm5.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_konsumen').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from konsumen where id_konsumen ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from konsumen');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm5.posisiawal;
begin
editbersih;

edit1.Enabled:= False;
edit2.Enabled:= False;
edit3.Enabled:= False;
edit4.Enabled:= False;
edit5.Enabled:= False;
ComboBox1.Enabled:= False;
edit6.Enabled:= False;


b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm5.b1Click(Sender: TObject);
begin
editbersih;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editenable;
end;

procedure TForm5.editbersih;
begin
Edit1.Text := '';
Edit2.Text := '';
Edit3.Text := '';
Edit4.Text := '';
Edit5.Text := '';
ComboBox1.Text := '';
Edit6.Text := '';
end;

procedure TForm5.editenable;
begin
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
edit5.Enabled:= True;
ComboBox1.Enabled:= True;
edit6.Enabled:= True;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm5.b2Click(Sender: TObject);
begin
if (Edit1.Text = '')or(Edit2.Text = '')or(Edit3.Text = '')or(Edit4.Text = '')or(Edit5.Text = '')or(ComboBox1.Text = '')or (Edit6.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('no_ktp',Edit2.Text,[]))and(zqry1.Locate('nama',Edit3.Text,[]))then
begin
  ShowMessage('Data Ortu sudah digunakan');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into konsumen values(null,"'+edit1.Text+'","'+edit2.Text+'","'+edit3.Text+'","'+edit4.Text+'","'+edit5.Text+'","'+ComboBox1.Text+'","'+edit6.Text+'",)');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from konsumen');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm5.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm5.b3Click(Sender: TObject);
begin
if (Edit1.Text = '')or(Edit2.Text = '')or(Edit3.Text = '')or(Edit4.Text = '')or(Edit5.Text = '')or(ComboBox1.Text = '')or(Edit6.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if (Edit1.Text = zqry1.Fields[2].AsString) and (Edit2.Text = zqry1.Fields[2].AsString) and(Edit3.Text = zqry1.Fields[3].AsString)and(Edit4.Text = zqry1.Fields[4].AsString)and(Edit5.Text = zqry1.Fields[5].AsString)and(ComboBox1.Text = zqry1.Fields[7].AsString)and(ComboBox1.Text = zqry1.Fields[9].AsString)and(Edit6.Text = zqry1.Fields[10].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_konsumen').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add('Update konsumen set id_konsumen="'+Edit1.Text+'", no_ktp="'+Edit2.Text+'", nama= "'+Edit3.Text+'",alamat= "'+Edit4.Text+'",tanggal_lahir= "'+Edit5.Text+'",jenis_kelamin= "'+ComboBox1.Text+'", pekerjaan= "'+Edit6.Text+'", where id_konsumen ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from konsumen');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm5.dg1CellClick(Column: TColumn);
begin
editenable;

b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
Edit1.Text:= zqry1.FieldList[2].AsString;
Edit2.Text:= zqry1.FieldList[2].AsString;
Edit3.Text:= zqry1.FieldList[3].AsString;
Edit4.Text:= zqry1.FieldList[4].AsString;
Edit5.Text:= zqry1.FieldList[5].AsString;
edit6.Text:= zqry1.FieldList[6].AsString;
ComboBox1.Text:= zqry1.FieldList[7].AsString;
end;

procedure TForm5.Bb6Click(Sender: TObject);
begin
frxreport1.ShowReport();
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
hide;
Form4.Show;
end;

end.
