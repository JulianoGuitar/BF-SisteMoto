unit bfEdit;
(******************************************************************************)
(*     © 2018 Jµ£¡åñø¸Ð¸®ø§å ¸ þ®ø¥¡§µå£                                      *)
(******************************************************************************)

{$W-}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type

  {TCustombfEdit}

  TEstilo = (esNormal, esReadOnly, esPadrao);
  TCustombfEdit = class(TEdit)
  private
    { Private declarations }
    CorAntiga, CorFonteAntiga: TColor;
    FCorComFoco : TColor;
    FCorFonteComFoco : TColor;
    FSairComEnter : Boolean;
    FSairComSeta : Boolean;
    FCursorNoFim : Boolean;
    FEstilo : TEstilo;

  protected
    { Protected declarations }
    procedure CMEnter( var Message : TCMEnter); message CM_ENTER;
    procedure CMExit( var Message : TCMExit); message CM_EXIT;
    procedure KeyPress(var Key : Char );Override;
    procedure KeyUp(var Key: Word; Shift: TShiftState);Override;
    procedure Set_Estilo(value : tEstilo);
    procedure SetCorComFoco(Value: TColor);
    procedure SetCorFonteComFoco(Value: TColor);
    function IsNormal: Boolean;

  public
    { Public declarations }
    constructor Create(AOwner : TComponent);override;
    property CorComFoco : TColor read FCorComFoco write SetCorComFoco default clSkyBlue;
    property CorFonteComFoco : TColor read FCorFonteComFoco write SetCorFonteComFoco default clBlack;
    property SairComEnter : Boolean read FSairComEnter write FSairComEnter default True;
    property SairComSeta : Boolean read FSairComSeta write FSairComSeta default True;
    property CursorNoFim : Boolean read FCursorNoFim write FCursorNoFim default False;
    property Estilo : TEstilo read FEstilo write Set_Estilo default esNormal;
    property Color stored IsNormal;
    property Font stored IsNormal;
  end;

  { TbfEdit }

  TbfEdit = class(TCustombfEdit)

  protected
    //function DefaultDisplayFormat: string; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property CorComFoco;
    property CorFonteComFoco;
    property SairComEnter;
    property SairComSeta;
    property CursorNoFim;
    property Estilo;
    { Published declarations }

  end;

implementation

{******************************************************************************}

{TCustombfEdit}

constructor TCustombfEdit.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FCorComFoco := clSkyBlue;
  FCorFonteComFoco := clBlack;
  FEstilo := esNormal;
  FSairComEnter := True;
  FSairComSeta := True;
  FCursorNoFim := False;
end;

{******************************************************************************}

procedure TCustombfEdit.Set_Estilo(value : tEstilo);
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
      CharCase := ecUpperCase;
      color := clWindow;
      Font.Color := clWindowText;
      Font.Style := [];
      ReadOnly := false;
      TabStop := true;
      Height := 22;
      Font.Name := 'Tahoma';
      SairComEnter := true;
      CursorNoFim := false;
      Font.Size := 8;
      CorComFoco := clSkyBlue;
      CorFonteComFoco := clBlack;
    end;
  end;
  FEstilo := value;
end;

{******************************************************************************}

procedure TCustombfEdit.SetCorComFoco(Value: TColor);
begin
  if Value <> FCorComFoco then
  begin
    FCorComFoco := Value;
    FEstilo := esNormal;
  end;
end;

{******************************************************************************}

procedure TCustombfEdit.SetCorFonteComFoco(Value: TColor);
begin
  if Value <> FCorFonteComFoco then
  begin
    FCorFonteComFoco := Value;
    FEstilo := esNormal;
  end;
end;

{******************************************************************************}

function TCustombfEdit.IsNormal: Boolean;
begin
  Result := (FEstilo = esNormal);
end;

{******************************************************************************}

procedure TCustombfEdit.KeyPress(var Key : Char );
begin
  inherited KeyPress(Key);
  if Key = Char(VK_RETURN) then
  begin
    Key := #0;
    if SairComEnter then keybd_event(VK_TAB,0,0,0);
  end;
end;

{******************************************************************************}

procedure TCustombfEdit.CMEnter( var Message : TCMEnter);
begin
  CorAntiga := Color;
  CorFonteAntiga := Font.Color;
  Color := CorComFoco;
  Font.Color := CorFonteComFoco;
  inherited;
  if CursorNoFim then Selstart := Length(text);
end;

{******************************************************************************}

procedure TCustombfEdit.CMExit( var Message : TCMExit);
begin
  Color := CorAntiga;
  Font.Color := CorFonteAntiga;
  inherited;
end;

{******************************************************************************}

procedure TCustombfEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited KeyUp(Key, Shift);
  if (key = vk_UP) and (SairComSeta) then
  begin
    keybd_event(VK_SHIFT, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(VK_TAB,0,0,0);
    keybd_event(VK_SHIFT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;  
end;

(******************************************************************************)

{TbfEdit}

constructor TbfEdit.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

{******************************************************************************}

end.

