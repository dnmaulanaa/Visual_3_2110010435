object Form2: TForm2
  Left = 267
  Top = 259
  Width = 1044
  Height = 540
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 32
    Top = 40
    object Men1: TMenuItem
      Caption = 'Menu'
      object tbl1: TMenuItem
        Caption = 'tbl_dokter'
        OnClick = tbl1Click
      end
      object tbl2: TMenuItem
        Caption = 'tbl_fasilitas'
        OnClick = tbl2Click
      end
      object tbl3: TMenuItem
        Caption = 'tbl_pasien'
        OnClick = tbl3Click
      end
      object tblpegawai1: TMenuItem
        Caption = 'tbl_pegawai'
        OnClick = tblpegawai1Click
      end
      object tblpuskesmas1: TMenuItem
        Caption = 'tbl_puskesmas'
        OnClick = tblpuskesmas1Click
      end
    end
    object profiel1: TMenuItem
      Caption = 'Profiel'
    end
    object Logout1: TMenuItem
      Caption = 'Logout'
    end
  end
end
