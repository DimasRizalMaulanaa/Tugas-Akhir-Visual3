unit sales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids, ComCtrls;

type
  TForm6 = class(TForm)
    Label4l3: TLabel;
    Label4l4: TLabel;
    Label4l5: TLabel;
    Label4l6: TLabel;
    Label1: TLabel;
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
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    Button1: TButton;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    cmb1: TComboBox;
    procedure b1Click(Sender: TObject);
    procedure posisiawal;
    procedure editbersih;
    procedure editenable;
    procedure editdisable;
    procedure FormShow(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure Bb6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  id : string;

implementation

uses
  Menu;

{$R *.dfm}

procedure TForm6.b1Click(Sender: TObject);
begin
editbersih;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editenable;
end;

procedure TForm6.editbersih;
begin
edit1.Text := '';
edit2.Text := '';
edit3.Text := '';
edit4.Text := '';
cmb1.Text := '';
end;

procedure TForm6.editdisable;
begin
edit1.Enabled:= False;
edit2.Enabled:= False;
edit3.Enabled:= False;
edit4.Enabled:= False;
cmb1.Enabled:= False;
end;

procedure TForm6.editenable;
begin
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
cmb1.Enabled:= True;
end;

procedure TForm6.posisiawal;
begin
editbersih;

editdisable;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.b2Click(Sender: TObject);
begin
  //SIMPAN

if(edit1.Text = '')or(edit2.Text = '')or(edit3.Text = '')or(edit4.Text = '')or(cmb1.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('id_sales',edit1.Text,[]))and(zqry1.Locate('nama',edit2.Text,[]))then
begin
  ShowMessage('Data sales sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into sales values(null,"'+edit1.Text+'","'+edit2.Text+'","'+edit3.Text+'","'+edit4.Text+'","'+cmb1.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from sales');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm6.dg1CellClick(Column: TColumn);
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
edit3.Text:= zqry1.FieldList[3].AsString;
edit4.Text:= zqry1.FieldList[4].AsString;;
cmb1.Text:= zqry1.FieldList[7].AsString;
end;

procedure TForm6.b3Click(Sender: TObject);
begin
if(edit1.Text = '')or(edit2.Text = '')or(edit3.Text = '')or(edit4.Text = '')or(cmb1.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if (edit1.Text = zqry1.Fields[1].AsString) and (edit2.Text = zqry1.Fields[2].AsString) and(edit3.Text = zqry1.Fields[3].AsString)and(edit4.Text = zqry1.Fields[4].AsString)and(cmb1.Text = zqry1.Fields[7].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_sales').AsString;


zqry1.SQL.Clear;
zqry1.SQL.Add('Update sales set id_sales= "'+edit1.Text+'",nama="'+edit2.Text+'", alamat= "'+edit3.Text+'",ujur= "'+edit4.Text+'",jenis_kelamin= "'+cmb1.Text+'",where id_sales ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from sales');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm6.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_sales').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from sales where id_sales ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from sales');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm6.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.Bb6Click(Sender: TObject);
begin
frxreport1.ShowReport();
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
Hide;
Form4.Show;
end;

end.
