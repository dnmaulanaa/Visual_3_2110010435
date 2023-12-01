unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm3 = class(TForm)
    l1: TLabel;
    l3: TLabel;
    l6: TLabel;
    l4: TLabel;
    l7: TLabel;
    dbgrd1: TDBGrid;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    zqry2: TZQuery;
    e_2: TEdit;
    e_3: TEdit;
    e_4: TEdit;
    e_5: TEdit;
    e_6: TEdit;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure dbgrd1CellClick(Column: TColumn);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  id_dokter:string;

implementation

{$R *.dfm}

procedure TForm3.b1Click(Sender: TObject);
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

procedure TForm3.b2Click(Sender: TObject);
begin
if e_2.Text='' then
  begin
    ShowMessage('ID  BELUM DIISI DENGAN BENAR');
    end else
    if e_3.Text=''then
    begin
     ShowMessage('ID DOKTER BELUM DIISI DENGAN BENAR');
    end else
    if e_4.text=''then
    begin
     ShowMessage('NAMA DOKTER BELUM DIISI DENGAN BENAR');
    end else
    if e_5.text=''then
    begin
    ShowMessage('SPESIALISASI BELUM DIISI');
    end else
     if e_6.text=''then
    begin
     ShowMessage('ALAMAT BELUM DIISI');
     end else
  if Form3.zqry1.Locate('id_dokter',e_2.Text,[]) then
  begin
   ShowMessage('DATA SUDAH ADA DALAM SISTEM');
  end else
  begin

 zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tb_dokter values("'+e_2.Text+'","'+e_3.Text+'","'+e_4.Text+'","'+e_5.Text+'","'+e_6.Text+'")');
 zqry1.ExecSQL ;

 zqry1.SQL.Clear;
 zqry1.SQL.Add('select * from tb_dokter');
 zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');

end;
end;

procedure TForm3.FormShow(Sender: TObject);
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

procedure TForm3.posisiawal;
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

procedure TForm3.bersih;
begin
e_2.Clear;
e_3.Clear;
e_4.Clear;
e_5.Clear;
e_6.Clear;
end;

procedure TForm3.dbgrd1CellClick(Column: TColumn);
begin
id_dokter:= zqry1.Fields[0].AsString;
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
procedure TForm3.b3Click(Sender: TObject);
begin
if (e_3.Text ='')or(e_4.Text ='')or(e_5.Text ='')or(e_6.Text='') then
begin
  ShowMessage('INPUTAN WAJIB DIISI!');
end else
if e_3.Text = zqry1.Fields[3].AsString then
begin
 ShowMessage('DATA TIDAK ADA PERUBAHAN');
end else
begin
 ShowMessage('DATA BERHASIL DIUPDATE!');
zqry1.SQL.Clear;
zqry1.SQL.Add('Update tb_dokter set nm_dokter= "'+e_3.Text+'",spesialisasi="'+e_4.Text+'",nmr_telp="'+e_5.Text+'",alamat="'+e_6.Text+'" where id_dokter="'+id_dokter+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tb_dokter');
zqry1.Open;

end;  

end;

procedure TForm3.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tb_dokter where id_dokter="'+id_dokter+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tb_dokter');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');

end;
end;

procedure TForm3.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm3.b6Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
