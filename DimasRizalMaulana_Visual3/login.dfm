object Form2: TForm2
  Left = 227
  Top = 192
  Width = 535
  Height = 377
  Caption = 'LOGIN'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4l2: TLabel
    Left = 69
    Top = 117
    Width = 72
    Height = 16
    Caption = 'USERNAME'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4l3: TLabel
    Left = 69
    Top = 157
    Width = 67
    Height = 16
    Caption = 'PASWORD'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 208
    Top = 48
    Width = 122
    Height = 23
    Caption = 'LOGIN USER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 153
    Top = 117
    Width = 271
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 153
    Top = 157
    Width = 271
    Height = 21
    TabOrder = 1
  end
  object b1: TButton
    Left = 120
    Top = 213
    Width = 97
    Height = 44
    Caption = 'MASUK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = b1Click
  end
  object b2: TButton
    Left = 296
    Top = 213
    Width = 97
    Height = 44
    Caption = 'DAFTAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = b2Click
  end
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    HostName = 'localhost'
    Port = 3306
    Database = 'dealer_motor'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'D:\Tugas Akhir\libmysql.dll'
    Left = 216
    Top = 272
  end
  object zqry1: TZQuery
    Connection = con1
    SQL.Strings = (
      'SELECT * FROM user')
    Params = <>
    Left = 256
    Top = 272
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 296
    Top = 272
  end
end
