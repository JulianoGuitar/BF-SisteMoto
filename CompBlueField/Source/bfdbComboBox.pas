unit bfdbComboBox;
(******************************************************************************)
(*     © 2018 Jµ£¡åñø¸Ð¸®ø§å ¸ þ®ø¥¡§µå£                                      *)
(******************************************************************************)

interface

uses
  SysUtils, Classes, Controls, dbCtrls, StdCtrls, Graphics, Windows;

type
  TbfdbComboBox = class(TdbComboBox)
  private
    { Private declarations }
    FCorComFoco : TColor;
    FCorFonteComFoco : TColor;
    FSairComEnter : Boolean;
    FSairComSeta : Boolean;
    CorAntiga, CorFonteAntiga : TColor;
  protected
    { Protected declarations }
    procedure CMEnter( var Message : TCMEnter); message CM_ENTER;
    procedure CMExit( var Message : TCMExit); message CM_EXIT;
    procedure KeyPress(var Key : Char );Override;
    procedure KeyUp(var Key: Word; Shift: TShiftState);Override;
    procedure DropDown; Override;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent);Override;

  published
    { Published declarations }
    property CorComFoco : TColor read FCorComFoco write FCorComFoco default clSkyBlue;
    property CorFonteComFoco : TColor read FCorFonteComFoco write FCorFonteComFoco default clBlack;
    property SairComEnter : Boolean read FSairComEnter write FSairComEnter default true;
    property SairComSeta : Boolean read FSairComSeta write FSairComSeta default True;
  end;

//procedure Register;

implementation

constructor TbfdbComboBox.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  CharCase := ecUpperCase;
  Height := 22;
  Font.Name := 'Tahoma';
  Font.Size := 8;
  FCorComFoco := clSkyBlue;
  FCorFonteComFoco := clBlack;
  FSairComEnter := true;
  FSairComSeta := True;
end;

procedure TbfdbComboBox.KeyPress(var Key : Char );
begin
  inherited KeyPress(Key);
  if Key = Char(VK_RETURN) then
  begin
    Key := #0;
    if DroppedDown then
    begin
      Color := CorComFoco;
      Font.Color := CorFonteComFoco;
    end
    else if SairComEnter then Keybd_Event(VK_TAB,0,0,0);
  end;
  if Key = Char(VK_ESCAPE) then
  begin
    Color := CorComFoco;
    Font.Color := CorFonteComFoco;
  end;
end;

procedure TbfdbComboBox.CMEnter( var Message : TCMEnter);
begin
  CorAntiga := Color;
  CorFonteAntiga := Font.Color;
  Color := CorComFoco;
  Font.Color := CorFonteComFoco;
  inherited;
end;

procedure TbfdbComboBox.CMExit( var Message : TCMExit);
begin
  Color := CorAntiga;
  Font.Color := CorFonteAntiga;
  inherited;
end;

procedure TbfdbComboBox.DropDown;
begin
  Color := CorAntiga;
  Font.Color := CorFonteAntiga;
  inherited;
end;

procedure TbfdbComboBox.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited KeyUp(Key, Shift);
  if (key = vk_UP) and (SairComSeta) and (not DroppedDown)then
  begin
    keybd_event(VK_SHIFT, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(VK_TAB,0,0,0);
    keybd_event(VK_SHIFT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;


end.
