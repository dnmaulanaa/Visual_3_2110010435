unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, StdCtrls;

type
  TForm9 = class(TForm)
    lbll1: TLabel;
    lbll3: TLabel;
    lbll6: TLabel;
    lbll4: TLabel;
    lbll7: TLabel;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    e_2: TEdit;
    e_3: TEdit;
    e_4: TEdit;
    e_5: TEdit;
    e_6: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    zqry2: TZQuery;
    dgdbgrd1: TDBGrid;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure dgdbgrd1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  id_rekam_medis:string;

implementation

{$R *.dfm}

procedure TForm9.b1Click(Sender: TObject);
begin
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
b6.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;
e_4.Enabled:= True;
e_5.Enabled:= True;
e_6.Enabled:= True;
end;

procedure TForm9.b2Click(Sender: TObject);
begin
if e_2.Text='' then
  begin
    ShowMessage('ID JADWAL  BELUM DIISI');
    end else
    if e_3.Text=''then
    begin
     ShowMessage('ID DOKTER BELUM DIISI');
    end else
    if e_4.text=''then
    begin
     ShowMessage('HARI PRAKTEK BELUM DIISI');
    end else
    if e_5.text=''then
    begin
    ShowMessage('JAM MULAI BELUM DIISI');
    end else
     if e_6.text=''then
    begin
     ShowMessage('JAM SELESAI BELUM DIISI');
     end else
  if Form9.zqry1.Locate('id_rekam_medis',e_2.Text,[]) then
  begin
   ShowMessage('DATA SUDAH ADA DALAM SISTEM');
  end else
  begin

 zqry1.SQL.Clear;
zqry1.SQL.Add('insert into rekam_medis values("'+e_2.Text+'","'+e_3.Text+'","'+e_4.Text+'","'+e_5.Text+'","'+e_6.Text+'")');
 zqry1.ExecSQL ;

 zqry1.SQL.Clear;
 zqry1.SQL.Add('select * from rekam_medis');
 zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');

end;
end;

procedure TForm9.b3Click(Sender: TObject);
begin
if (e_3.Text ='')or(e_4.Text ='')or(e_5.Text ='')or(e_6.Text='') then
begin
  ShowMessage('INPUTAN WAJIB DIISI!');
end else
if e_3.Text = zqry1.Fields[0].AsString then
begin
 ShowMessage('DATA TIDAK ADA PERUBAHAN');
end else
begin
 ShowMessage('DATA BERHASIL DIUPDATE!');
zqry1.SQL.Clear;
zqry1.SQL.Add('Update rekam_medis set id_rekam_medis= "'+e_3.Text+'",id_dokter="'+e_4.Text+'",tgl_kunjungan="'+e_5.Text+'",diagnosis="'+e_6.Text+'" where id_rekam_medis="'+id_rekam_medis+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from rekam_medis');
zqry1.Open;

end;
end;

procedure TForm9.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from rekam_medis where id_rekam_medis="'+id_rekam_medis+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from rekam_medis');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');

end;
end;

procedure TForm9.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm9.b6Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

procedure TForm9.dgdbgrd1CellClick(Column: TColumn);
begin
id_rekam_medis:= zqry1.Fields[0].AsString;
e_3.Text:= zqry1.Fields[1].AsString;
e_4.Text:= zqry1.Fields[2].AsString;
e_5.Text:= zqry1.Fields[3].AsString;
e_6.Text:= zqry1.Fields[4].AsString;


e_2.Enabled:= True;
e_3.Enabled:= True;
e_4.Enabled:= True;
e_5.Enabled:= True;
e_6.Enabled:= True;


b1.Enabled:= false;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
bersih;
b1.Enabled:=true;
b2.Enabled:=false;
b3.Enabled:=false;
b4.Enabled:=false;
b5.Enabled:=false;
b6.Enabled:=false;
e_2.Enabled:= false;
e_3.Enabled:= false;
e_4.Enabled:= false;
e_5.Enabled:= false;
e_6.Enabled:= false;
end;

procedure TForm9.posisiawal;
begin
b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
b6.Enabled:= False;
e_2.Enabled:= false;
e_3.Enabled:= false;
e_4.Enabled:= false;
e_5.Enabled:= false;
e_6.Enabled:= false;
end;

procedure TForm9.bersih;
begin
e_2.Clear;
e_3.Clear;
e_4.Clear;
e_5.Clear;
e_6.Clear;
end;




end.
