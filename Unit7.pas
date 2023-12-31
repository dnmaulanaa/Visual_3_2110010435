unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls;

type
  TForm7 = class(TForm)
    lbll4: TLabel;
    lbll7: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    e_4: TEdit;
    e_5: TEdit;
    e_6: TEdit;
    dg1: TDBGrid;
    e_7: TEdit;
    e_8: TEdit;
    e_9: TEdit;
    e_10: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    zqry2: TZQuery;
    lbl5: TLabel;
    lbl6: TLabel;
    e_11: TEdit;
    e_12: TEdit;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure FormShow(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  id_puskesmas:string;

implementation

{$R *.dfm}

procedure TForm7.b1Click(Sender: TObject);
begin
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
b6.Enabled:= True;
e_4.Enabled:= True;
e_5.Enabled:= True;
e_6.Enabled:= True;
e_7.Enabled:= True;
e_8.Enabled:= True;
e_9.Enabled:= True;
e_10.Enabled:= True;
e_11.Enabled:= True;
e_12.Enabled:= True;

end;

procedure TForm7.b2Click(Sender: TObject);
begin
if e_4.Text='' then
    begin
     ShowMessage('ID_PUSKESMAS BELUM DIISI DENGAN BENAR');
    end else
    if e_5.text=''then
    begin
    ShowMessage('NAMA_PUSKESMAS BELUM DIISI');
    end else
    if e_6.text=''then
    begin
     ShowMessage('ALAMAT BELUM DIISI');
    end else
    if e_7.text=''then
    begin
     ShowMessage('KOTA BELUM DIISI');
    end else
    if e_8.text=''then
    begin
     ShowMessage('PROVINSI BELUM DIISI');
    end else
    if e_9.text=''then
    begin
     ShowMessage('NMR_TELPON BELUM DIISI');
    end else
    if e_10.text=''then
    begin
     ShowMessage('JUMLAH_DOKTER BELUM DIISI');
    end else
    if e_11.text=''then
    begin
     ShowMessage('JUMLAH_PASIEN BELUM DIISI');
    end else
    if e_12.text=''then
    begin
     ShowMessage('FASILITAS_TAMBAHAN BELUM DIISI');
    end else
  if Form7.zqry1.Locate('id_puskesmas',e_4.Text,[]) then
  begin
   ShowMessage('DATA SUDAH ADA DALAM SISTEM');
  end else
  begin

 zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tb_puskesmas values("'+e_4.Text+'","'+e_5.Text+'","'+e_6.Text+'","'+e_7.Text+'","'+e_8.Text+'","'+e_9.Text+'","'+e_10.Text+'","'+e_11.Text+'","'+e_12.Text+'")');
 zqry1.ExecSQL ;
 zqry1.SQL.Clear;
 zqry1.SQL.Add('select * from tb_puskesmas');
 zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');

end;
end;

procedure TForm7.b3Click(Sender: TObject);
begin
 if (e_4.Text ='')or(e_5.Text ='')or(e_6.Text='')or(e_7.Text='')or(e_8.Text='')or(e_9.Text='')or(e_10.Text='')or(e_11.Text='')or(e_12.Text='') then
begin
  ShowMessage('INPUTAN WAJIB DIISI!');
end else
if e_4.Text = zqry1.Fields[0].AsString then
begin
 ShowMessage('DATA TIDAK ADA PERUBAHAN');
end else
begin
 ShowMessage('DATA BERHASIL DIUPDATE!');
zqry1.SQL.Clear;
zqry1.SQL.Add('Update tb_puskesmas set nm_puskesmas ="'+e_5.Text+'",alamat="'+e_6.Text+'",kota="'+e_7.Text+'",provinsi="'+e_8.Text+'",nmr_telp="'+e_9.Text+'",jml_dokter="'+e_10.Text+'",jml_pasien="'+e_11.Text+'",fasilitas_tambahan="'+e_12.Text+'" where id_puskesmas="'+id_puskesmas+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tb_puskesmas');
zqry1.Open;

end;
end;

procedure TForm7.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tb_puskesmas where id_puskesmas="'+id_puskesmas+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tb_puskesmas');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');

end;
end;

procedure TForm7.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm7.b6Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

procedure TForm7.dg1CellClick(Column: TColumn);
begin
id_puskesmas:= zqry1.Fields[0].AsString;
e_5.Text:= zqry1.Fields[1].AsString;
e_7.Text:= zqry1.Fields[2].AsString;
e_8.Text:= zqry1.Fields[3].AsString;
e_9.Text:= zqry1.Fields[4].AsString;
e_10.Text:= zqry1.Fields[5].AsString;
e_11.Text:= zqry1.Fields[6].AsString;
e_12.Text:= zqry1.Fields[7].AsString;


e_4.Enabled:= True;
e_5.Enabled:= True;
e_6.Enabled:= True;
e_7.Enabled:= True;
e_8.Enabled:= True;
e_9.Enabled:= True;
e_10.Enabled:= True;
e_11.Enabled:= True;
e_12.Enabled:= True;


b1.Enabled:= false;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
bersih;
b1.Enabled:=true;
b2.Enabled:=false;
b3.Enabled:=false;
b4.Enabled:=false;
b5.Enabled:=false;
b6.Enabled:=false;
e_4.Enabled:= false;
e_5.Enabled:= false;
e_6.Enabled:= false;
e_7.Enabled:= false;
e_8.Enabled:= false;
e_9.Enabled:= false;
e_10.Enabled:= false;
end;

procedure TForm7.bersih;
begin
e_4.Clear;
e_5.Clear;
e_6.Clear;
e_7.Clear;
e_8.Clear;
e_9.Clear;
e_10.Clear;
end;

procedure TForm7.posisiawal;
begin
b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
b6.Enabled:= False;
e_4.Enabled:= false;
e_5.Enabled:= false;
e_6.Enabled:= false;
e_7.Enabled:= false;
e_8.Enabled:= false;
e_9.Enabled:= false;
e_10.Enabled:= false;
end;

end.
