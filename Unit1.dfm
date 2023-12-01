object Form1: TForm1
  Left = 463
  Top = 239
  Width = 399
  Height = 457
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 168
    Top = 104
    Width = 54
    Height = 13
    Caption = 'USERNAME'
  end
  object lbl2: TLabel
    Left = 168
    Top = 176
    Width = 57
    Height = 13
    Caption = 'PASSWORD'
  end
  object lbl3: TLabel
    Left = 152
    Top = 48
    Width = 95
    Height = 33
    Caption = 'LOGIN'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -29
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object e_2: TEdit
    Left = 120
    Top = 200
    Width = 161
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object e_1: TEdit
    Left = 120
    Top = 128
    Width = 161
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btn1: TButton
    Left = 160
    Top = 264
    Width = 75
    Height = 25
    Caption = 'LOGIN'
    TabOrder = 2
    OnClick = btn1Click
  end
  object zqry: TZQuery
    Connection = con
    SQL.Strings = (
      'select * from tb_user')
    Params = <>
    Properties.Strings = (
      'select *from tb_dokter')
    Left = 40
    Top = 72
  end
  object ds: TDataSource
    DataSet = zqry
    Left = 40
    Top = 144
  end
  object con: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Properties.Strings = (
      'select * from tb_dokter'
      'controls_cp=GET_ACP')
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'dbpuskesmas'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'U:\MATAKULIAH UNISKA\SEMESTER 5 (LIMA)\Visual 3 - Bapak Ahmadi\V' +
      'isual_dbpuskesmas\libmysql.dll'
    Left = 40
    Top = 216
  end
end
