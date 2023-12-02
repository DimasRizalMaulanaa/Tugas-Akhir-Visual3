unit barang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Label4l2: TLabel;
    Label4l3: TLabel;
    Label4l4: TLabel;
    Label4: TLabel;
    dg1: TDBGrid;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    Bb6: TButton;
    edit1: TEdit;
    edit2: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    Button1: TButton;
    Label2: TLabel;
    frxdbdtst1: TfrxDBDataset;
    edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    procedure b1Click(Sender: TObject);
    procedure posisiawal;
    procedure editbersih;
    procedure editenable;
    procedure editdisable;
    procedure FormShow(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure Bb6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  id : string;

implementation

uses
  Menu;

{$R *.dfm}

procedure TForm8.b1Click(Sender: TObject);
begin
editbersih;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
editenable;
end;

procedure TForm8.editbersih;
begin
edit1.Text := '';
edit2.Text := '';
edit3.Text := '';
edit4.Text := '';
edit5.Text := '';
end;

procedure TForm8.editdisable;
begin
edit1.Enabled:= False;
edit2.Enabled:= False;
edit3.Enabled:= False;
edit4.Enabled:= False;
edit5.Enabled:= False;
end;

procedure TForm8.editenable;
begin
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
edit5.Enabled:= True;
end;

procedure TForm8.posisiawal;
begin
editbersih;

editdisable;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm8.b2Click(Sender: TObject);
begin
  //SIMPAN

if(edit1.Text = '')or(edit2.Text = '')or (edit3.Text = '')or(edit4.Text = '')or(edit5.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('id_barang',edit1.Text,[]))then
begin
  ShowMessage('Data barang sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into barang values(null,"'+edit1.Text+'","'+edit2.Text+'","'+edit3.Text+'","'+edit4.Text+'","'+edit5.Text+'",)');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from barang');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
hide;
Form4.show;
end;

procedure TForm8.b3Click(Sender: TObject);
begin
if(edit1.Text = '')or(edit2.Text = '')or(edit3.Text = '')or(edit4.Text = '')or(edit5.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if (edit1.Text = zqry1.Fields[1].AsString) and (edit2.Text = zqry1.Fields[2].AsString) and (edit3.Text = zqry1.Fields[1].AsString) and (edit4.Text = zqry1.Fields[2].AsString) and (edit5.Text = zqry1.Fields[2].AsString)then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_barang').AsString;


zqry1.SQL.Clear;
zqry1.SQL.Add('Update barang set id_barang= "'+edit1.Text+'",id_user="'+edit2.Text+'", nama="'+edit3.Text+'", alamat="'+edit4.Text+'", no_telp="'+edit5.Text+'",where id_poin ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from barang');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm8.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_barang').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from barang where id_barang ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from barang');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm8.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm8.dg1CellClick(Column: TColumn);
begin
editenable;

b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;

id:=zqry1.Fields[0].AsString;

edit1.Text:= zqry1.FieldList[1].AsString;
edit2.Text:= zqry1.FieldList[2].AsString;
edit3.Text:= zqry1.FieldList[2].AsString;
edit4.Text:= zqry1.FieldList[2].AsString;
edit5.Text:= zqry1.FieldList[2].AsString;

end;

procedure TForm8.Bb6Click(Sender: TObject);
begin
frxreport1.ShowReport();
end;

end.
