unit uConsulta_Padrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB,
  DBClient, Provider;

type
  TfmConsulta = class(TForm)
    ds: TDataSource;
    dbg: TDBGrid;
    btOK: TBitBtn;
    btDesist: TBitBtn;
    Label1: TLabel;
    edtFiltro: TEdit;
    cdsConsPadrao: TClientDataSet;
    cdsConsPadraoCOD: TIntegerField;
    cdsConsPadraoNOME: TStringField;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    edtINFO: TEdit;
    procedure btOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgDblClick(Sender: TObject);
    procedure dbgKeyPress(Sender: TObject; var Key: Char);
    procedure edtFiltroChange(Sender: TObject);
    procedure edtFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    boDrawCellPENDENCIA,
    boFILTRO,
    boSemMensagemSaida, boDBGridEnterOK : boolean;
    { Public declarations }
  end;

var
  fmConsulta: TfmConsulta;

implementation

{$R *.dfm}

procedure TfmConsulta.btOKClick(Sender: TObject);
begin
  if boSemMensagemSaida then ModalResult := mrOK
  else
  case MessageBox(Handle, pchar('Deseja salvar?'), 'Sair...', MB_ICONEXCLAMATION+MB_YESNOCANCEL) of
    id_yes : ModalResult := mrOK;
    id_no : ModalResult := mrCancel;
    id_cancel : exit;
  end;
end;

procedure TfmConsulta.FormCreate(Sender: TObject);
begin
  try
    btOK.Glyph.LoadFromResourceName(HInstance,'OK');
    btDesist.Glyph.LoadFromResourceName(HInstance,'DESIST');
  except

  end;
  boSemMensagemSaida := true;
  boFILTRO := false;
  boDrawCellPENDENCIA := false;
  boDBGridEnterOK := true;
end;

procedure TfmConsulta.dbgDblClick(Sender: TObject);
begin
  if boDBGridEnterOK then btOKClick(self);
end;

procedure TfmConsulta.dbgKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = chr(vk_return)) and  boDBGridEnterOK then btOKClick(self);
end;

procedure TfmConsulta.edtFiltroChange(Sender: TObject);
begin
  if boFILTRO and (trim(edtFiltro.Text) <> '') then
  begin
    if ds.DataSet = cds
    then cds.FindNearest([trim(edtFiltro.Text)])
    else cdsConsPadrao.FindNearest([trim(edtFiltro.Text)])
  end;
end;

procedure TfmConsulta.edtFiltroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_down then dbg.SetFocus;
end;

procedure TfmConsulta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_escape) then ModalResult := mrCancel;
end;

procedure TfmConsulta.dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  f, b : tColor;
begin

  if not boDrawCellPENDENCIA then exit;

  if (DataCol > 0)
  and (cds.FieldByName('PENDENCIA').AsString = 'S')
   then
  begin
    if State = [gdSelected]
    then f := clWhite
    else f := clBlack;

    if cds.FieldByName('PENDENCIA').AsString = 'S'
    then
      if State = [gdSelected]
      then b := clRed
      else b := $008080FF;

    dbg.Canvas.Font.Color:=f;
    dbg.Canvas.Brush.Color:=b;
    dbg.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfmConsulta.FormShow(Sender: TObject);
begin
  edtFiltro.Visible := boFILTRO;
end;

end.
