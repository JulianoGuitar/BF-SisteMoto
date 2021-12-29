unit bfNumEdit;
(******************************************************************************)
(*     © 2018 Jµ£¡åñø¸Ð¸®ø§å ¸ þ®ø¥¡§µå£                                      *)
(******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, bfEdit;

type
  {TbfNumEdit}
  TbfNumEdit = class(TCustombfEdit)
  private
    { Private declarations }

  protected
    { Protected declarations }
    procedure KeyPress(var Key : Char );Override;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;

  public
    { Public declarations }
    constructor Create(AOwner : TComponent);override;

  published
    { Published declarations }
    property CorComFoco;
    property CorFonteComFoco;
    property SairComEnter;
    property SairComSeta;
    property CursorNoFim;
    property Estilo;
  end;

implementation


{******************************************************************************}

{TbfNumEdit}

constructor TbfNumEdit.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

{******************************************************************************}

procedure TbfNumEdit.KeyPress(var Key : Char );
begin
  inherited KeyPress(Key);
  if focused and (Key in [#32..#255]) then
  begin
    if not (Key in ['0'..'9']) and (Key >= Char(32)) and (Key <= Char(255)) then
    begin
      Beep;
      Key := #0;
    end;
  end;

end;

{******************************************************************************}

procedure TbfNumEdit.WMPaste(var Message: TMessage);
var
  sTexto : String;
  iNumero, iErro : Integer;
begin
  sTexto := Text;
  inherited;
        {Usado para o sitema operacional colar}
  Val(Text, iNumero, iErro);
  if iErro <> 0 then Text := sTexto;
end;

{******************************************************************************}

end.
