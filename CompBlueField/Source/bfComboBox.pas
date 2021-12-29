unit bfComboBox;
(******************************************************************************)
(*     © 2018 Jµ£¡åñø¸Ð¸®ø§å ¸ þ®ø¥¡§µå£                                      *)
(******************************************************************************)

interface

uses
  SysUtils, Classes, Controls, StdCtrls, Graphics, Windows;

type
  TbfComboBox = class(TComboBox)
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

constructor TbfComboBox.Create(AOwner : TComponent);
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

procedure TbfComboBox.KeyPress(var Key : Char );
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

procedure TbfComboBox.CMEnter( var Message : TCMEnter);
begin
  CorAntiga := Color;
  CorFonteAntiga := Font.Color;
  Color := CorComFoco;
  Font.Color := CorFonteComFoco;
  inherited;
end;

procedure TbfComboBox.CMExit( var Message : TCMExit);
begin
  Color := CorAntiga;
  Font.Color := CorFonteAntiga;
  inherited;
end;

procedure TbfComboBox.DropDown;
begin
  Color := CorAntiga;
  Font.Color := CorFonteAntiga;
  inherited;
end;

procedure TbfComboBox.KeyUp(var Key: Word; Shift: TShiftState);
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
