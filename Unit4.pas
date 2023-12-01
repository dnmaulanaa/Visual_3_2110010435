unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm4 = class(TForm)
    l6: TLabel;
    l4: TLabel;
    l7: TLabel;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    e_4: TEdit;
    e_5: TEdit;
    e_6: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    zqry2: TZQuery;
    DBGrid1: TDBGrid;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  id_fasilitas:string;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm4.b1Click(Sender: TObject);
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
end;

procedure TForm4.b2Click(Sender: TObject);
begin
if e_4.Text='' then
    begin
     ShowMessage('FASILITAS BELUM DIISI DENGAN BENAR');
    end else
    if e_5.text=''then
    begin
    ShowMessage('NAMA_FASILITAS BELUM DIISI');
    end else
    if e_6.text=''then
    begin
     ShowMessage('DESKRIPSI BELUM DIISI');
    end else
  if Form4.zqry1.Locate('id_fasilitas',e_4.Text,[]) then
  begin
   ShowMessage('DATA SUDAH ADA DALAM SISTEM');
  end else
  begin

 zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tb_fasilitas values("'+e_4.Text+'","'+e_5.Text+'","'+e_6.Text+'")');
 zqry1.ExecSQL ;
 zqry1.SQL.Clear;
 zqry1.SQL.Add('select * from tb_fasilitas');
 zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');

end;
end;

procedure TForm4.b6Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

procedure TForm4.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tb_fasilitas where id_fasilitas="'+id_fasilitas+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tb_fasilitas');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');

end;
end;

procedure TForm4.b3Click(Sender: TObject);
begin
  if (e_4.Text ='')or(e_5.Text ='')or(e_6.Text='') then
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
zqry1.SQL.Add('Update tb_fasilitas set nm_fasilitas= "'+e_5.Text+'",Deskripsi="'+e_6.Text+'" where id_fasilitas="'+id_fasilitas+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tb_fasilitas');
zqry1.Open;

end;
end;

procedure TForm4.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm4.posisiawal;
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
end;

procedure TForm4.bersih;
begin
e_4.Clear;
e_5.Clear;
e_6.Clear;
end;


procedure TForm4.FormShow(Sender: TObject);
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
end;


procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
id_fasilitas:= zqry1.Fields[0].AsString;
e_5.Text:= zqry1.Fields[1].AsString;
e_6.Text:= zqry1.Fields[2].AsString;

e_4.Enabled:= True;
e_5.Enabled:= True;
e_6.Enabled:= True;


b1.Enabled:= false;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
end;

end.
