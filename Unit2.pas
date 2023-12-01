unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    Men1: TMenuItem;
    tbl1: TMenuItem;
    tbl2: TMenuItem;
    profiel1: TMenuItem;
    Logout1: TMenuItem;
    tbl3: TMenuItem;
    tblpegawai1: TMenuItem;
    tblpuskesmas1: TMenuItem;
    procedure tbl1Click(Sender: TObject);
    procedure tbl2Click(Sender: TObject);
    procedure tbl3Click(Sender: TObject);
    procedure tblpegawai1Click(Sender: TObject);
    procedure tblpuskesmas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}

procedure TForm2.tbl1Click(Sender: TObject);
begin
form3.show;
end;

procedure TForm2.tbl2Click(Sender: TObject);
begin
form4.show;
end;

procedure TForm2.tbl3Click(Sender: TObject);
begin
form5.show;
end;

procedure TForm2.tblpegawai1Click(Sender: TObject);
begin
form6.show;
end;

procedure TForm2.tblpuskesmas1Click(Sender: TObject);
begin
form7.show;
end;

end.
