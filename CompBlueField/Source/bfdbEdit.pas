unit bfdbEdit;
(******************************************************************************)
(*     © 2018 Jµ£¡åñø¸Ð¸®ø§å ¸ þ®ø¥¡§µå£                                      *)
(******************************************************************************)

interface

uses
  SysUtils, Classes, Controls, dbCtrls, StdCtrls, Graphics, Windows;

type
  TEstilo = (esNormal, esReadOnly, esPadrao);
  TbfdbEdit = class(TdbEdit)
  private
    { Private declarations }
    FCorComFoco : TColor;
    FCorFonteComFoco : TColor;
    FSairComEnter : Boolean;
    FSairComSeta : Boolean;
    CorAntiga, CorFonteAntiga : TColor;
    FCursorNoFim : Boolean;
    FEstilo : TEstilo;
  protected
    { Protected declarations }
    procedure CMEnter( var Message : TCMEnter); message CM_ENTER;
    procedure CMExit( var Message : TCMExit); message CM_EXIT;
    procedure KeyPress(var Key : Char );Override;
    procedure KeyUp(var Key: Word; Shift: TShiftState);Override;
    procedure Set_Estilo(value : tEstilo);
    function IsNormal: Boolean;

  public
    { Public declarations }
    constructor Create(AOwner : TComponent);Override;

  published
    { Published declarations }
    property CorComFoco : TColor read FCorComFoco write FCorComFoco default clSkyBlue;
    property CorFonteComFoco : TColor read FCorFonteComFoco write FCorFonteComFoco default clBlack;
    property SairComEnter : Boolean read FSairComEnter write FSairComEnter default true;
    property SairComSeta : Boolean read FSairComSeta write FSairComSeta default True;
    property CursorNoFim : Boolean read FCursorNoFim write FCursorNoFim default False;
    property Estilo : TEstilo read FEstilo write Set_Estilo default esNormal;
  end;

//procedure Register;

implementation

constructor TbfdbEdit.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FCorComFoco := clSkyBlue;
  FCorFonteComFoco := clBlack;
  FEstilo := esNormal;
  FSairComEnter := True;
  FSairComSeta := True;
  FCursorNoFim := False;
end;

function TbfdbEdit.IsNormal: Boolean;
begin
  Result := (FEstilo = esNormal);
end;

{******************************************************************************}

procedure TbfdbEdit.KeyPress(var Key : Char );
begin
  inherited KeyPress(Key);
  inherited KeyPress(Key);
  if Key = Char(VK_RETURN) then
  begin
    Key := #0;
    if SairComEnter then keybd_event(VK_TAB,0,0,0);
  end;
end;

procedure TbfdbEdit.CMEnter( var Message : TCMEnter);
begin
  CorAntiga := Color;
  CorFonteAntiga := Font.Color;
  Color := CorComFoco;
  Font.Color := CorFonteComFoco;
  inherited;
  if CursorNoFim then Selstart := Length(text);
end;

procedure TbfdbEdit.CMExit( var Message : TCMExit);
begin
  Color := CorAntiga;
  Font.Color := CorFonteAntiga;
  inherited;
end;

procedure TbfdbEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited KeyUp(Key, Shift);
  if (key = vk_UP) and (SairComSeta) then
  begin
    keybd_event(VK_SHIFT, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(VK_TAB,0,0,0);
    keybd_event(VK_SHIFT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;


procedure TbfdbEdit.Set_Estilo(value: tEstilo);
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
      Height := 21;
      Font.Name := 'Tahoma';
      Font.Size := 8;
      CorComFoco := clSkyBlue;
      CorFonteComFoco := clBlack;
      SairComEnter := true;
      SairComSeta := True;

    end;
  end;
  FEstilo := value;
end;

end.
