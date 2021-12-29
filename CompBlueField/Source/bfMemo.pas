unit bfMemo;
(******************************************************************************)
(*     © 2018 Jµ£¡åñø¸Ð¸®ø§å ¸ þ®ø¥¡§µå£                                      *)
(******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TEstilo = (esNormal, esReadOnly, esPadrao);
  TbfMemo = class(TMemo)

  private
    { Private declarations }
    CorAntiga, CorFonteAntiga : TColor;
    FCorComFoco : TColor;
    FCorFonteComFoco : TColor;
    FSairComEnter : Boolean;
    FLinhas : integer;
    FEstilo : TEstilo;
  protected
    { Protected declarations }
    procedure CMEnter( var Message : TCMEnter); message CM_ENTER;
    procedure CMExit( var Message : TCMExit); message CM_EXIT;
    procedure KeyPress(var Key : Char );Override;
    procedure Set_Estilo(value : tEstilo);
    procedure SetCorComFoco(Value: TColor);
    procedure SetCorFonteComFoco(Value: TColor);
    function IsNormal: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent);override;
  published
    { Published declarations }
    property CorComFoco : TColor read FCorComFoco write SetCorComFoco default clSkyBlue;
    property CorFonteComFoco : TColor read FCorFonteComFoco write SetCorFonteComFoco default clBlack;
    property SairComEnter : Boolean read FSairComEnter write FSairComEnter default True;
    property SairComLinhas : integer read Flinhas write FLinhas default 0;
    property Estilo : TEstilo read FEstilo write Set_Estilo default esNormal;
    property Color stored IsNormal;
    property Font stored IsNormal;
  end;

implementation

{******************************************************************************}

constructor TbfMemo.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FCorComFoco := clSkyBlue;
  FCorFonteComFoco := clBlack;
  FEstilo := esNormal;
  FSairComEnter := True;
  Flinhas := 0;
end;

{******************************************************************************}

procedure TbfMemo.Set_Estilo(value : tEstilo);
begin
  case value of
    esNormal : ;
    esReadOnly :
    begin
      color := clBtnFace;
      Font.Color := clBlue;
      Font.Style := [];
      ReadOnly := true;
      TabStop := false;
    end;
    esPadrao :
    begin
      color := clWindow;
      Font.Color := clWindowText;
      Font.Style := [];
      ReadOnly := false;
      TabStop := true;
      Font.Name := 'Tahoma';
      SairComEnter := true;
      Font.Size := 8;
      CorComFoco := clSkyBlue;
      CorFonteComFoco := clBlack;
      SairComLinhas := 0;
    end;
  end;
  FEstilo := value;
end;

{******************************************************************************}
procedure TbfMemo.SetCorComFoco(Value: TColor);
begin
  if Value <> FCorComFoco then
  begin
    FCorComFoco := Value;
    FEstilo := esNormal;
  end;
end;

{******************************************************************************}

procedure TbfMemo.SetCorFonteComFoco(Value: TColor);
begin
  if Value <> FCorFonteComFoco then
  begin
    FCorFonteComFoco := Value;
    FEstilo := esNormal;
  end;
end;

{******************************************************************************}

function TbfMemo.IsNormal: Boolean;
begin
  Result := (FEstilo = esNormal);
end;

{******************************************************************************}

procedure TbfMemo.KeyPress(var Key : Char );
begin
  inherited KeyPress(Key);
  if (SairComEnter) and (Key = Char(VK_RETURN)) and (Lines.Count >= SairComLinhas) then
  begin
    Key := #0;
    Keybd_Event(VK_TAB,0,0,0);
  end;
end;

{******************************************************************************}

procedure TbfMemo.CMEnter( var Message : TCMEnter);
begin
  CorAntiga := Color;
  CorFonteAntiga := Font.Color;
  Color := CorComFoco;
  Font.Color := CorFonteComFoco;
  inherited;
end;

{******************************************************************************}

procedure TbfMemo.CMExit( var Message : TCMExit);
begin
  Color := CorAntiga;
  Font.Color := CorFonteAntiga;
  inherited;
end;

{******************************************************************************}

end.
