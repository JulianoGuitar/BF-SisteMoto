unit bfdbEditButton;
(******************************************************************************)
(*     © 2018 Jµ£¡åñø¸Ð¸®ø§å ¸ þ®ø¥¡§µå£                                      *)
(******************************************************************************)
interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Buttons, Forms,
     Mask, Menus, bfdbEdit;

type

  { TCustombfdbEditButton }
  TCustombfdbEditButton = class(TbfdbEdit)
  private
    fClickKey: TShortCut;
    FButton: TSpeedButton;
    FBtnControl: TWinControl;
    FOnButtonClick: TNotifyEvent;
    FGlyph: TBitmap;
    FSairSeVazio : Boolean;
    FBotaoComEnter : Boolean;
    FNumGlyphs: TNumGlyphs;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMPaste(var Message: TWMPaste); message WM_PASTE;
    procedure WMCut(var Message: TWMCut); message WM_CUT;
    procedure ButtonClick(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DoEnter; override;
    procedure SetEditRect;
    procedure UpdateBtnBounds;
    function EditCanModify: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    function GetGlyph: TBitmap;
    procedure SetGlyph(Value: TBitmap);
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property ClickKey: TShortCut read fClickKey write fClickKey default vk_F9;

    function GetNumGlyphs: TNumGlyphs;
    procedure SetNumGlyphs(Value: TNumGlyphs);
    property NumGlyphs: TNumGlyphs read GetNumGlyphs write SetNumGlyphs default 2;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;
    property SairSeVazio : boolean read FSairSeVazio write FSairSeVazio default true;
    property BotaoComEnter : Boolean read FBotaoComEnter write FBotaoComEnter default false;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoClick; virtual;
  end;

  { TbfdbEditButton }
  TbfdbEditButton = class(TCustombfdbEditButton)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AutoSelect;
    property BorderStyle;
    property CharCase;
    property ClickKey;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property EditMask;
    property Enabled;
    property Font;
    property Glyph;
    property NumGlyphs;
    property HideSelection;
    property MaxLength;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnButtonClick;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property CorComFoco;
    property CorFonteComFoco;
    property SairComEnter;
    property SairComSeta;
    property Estilo;
    property SairSeVazio;
    property CursorNoFim;
    property BotaoComEnter;
  end;

implementation

       { cifraoR CombosJul.res}

{ TCustombfdbEditButton }

{******************************************************************************}

constructor TCustombfdbEditButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle + [csCaptureMouse];
  AutoSize := False;
  fClickKey := vk_F9;
  SairSeVazio := true;
  CursorNoFim := false;
  BotaoComEnter := false;
  FBtnControl := TWinControl.Create(Self);
  with fBtnControl do
  begin
    ControlStyle := ControlStyle + [csReplicatable];
    Width := 21;
    Height := 17;
    Visible := True;
    Parent := Self;
  end;

  FButton := TSpeedButton.Create(Self);
  with FButton do
  begin
    SetBounds(0, 0, FBtnControl.Width, FBtnControl.Height);
    Visible := True;
    OnClick := ButtonClick;
    Parent := FBtnControl;
//    NumGlyphs := 2;
  end;
  Height := 21;
end;

{******************************************************************************}

destructor TCustombfdbEditButton.Destroy;
begin
  fButton.OnClick := nil;
  inherited Destroy;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.CreateWnd;
begin
  inherited CreateWnd;
  SetEditRect;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.DoEnter;
begin
  inherited DoEnter;
  if (not (csDesigning in ComponentState)) then SelectAll;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (fClickKey = ShortCut(Key, Shift)) then
  begin
    DoClick;
    Key := 0;
  end;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.KeyPress(var Key: Char);
begin
  if (Key = Char(VK_RETURN)) or (Key = Char(VK_ESCAPE)) then
  begin
    GetParentForm(Self).Perform(CM_DIALOGKEY, Byte(Key), 0);
    if Key = Char(VK_RETURN) then
    begin
      if BotaoComEnter then ButtonClick(self);
      if (trim(text) <> '') or SairSeVazio then
      begin
        inherited KeyPress(Key);
        Key := #0;
      end;
      Exit;
    end;
  end;
  inherited KeyPress(Key);
end;

{******************************************************************************}

function TCustombfdbEditButton.EditCanModify: Boolean;
begin
  Result := (not ReadOnly);
end;

{******************************************************************************}

procedure TCustombfdbEditButton.WMPaste(var Message: TWMPaste);
begin
  if ReadOnly then Exit;
  inherited;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.WMCut(var Message: TWMCut);
begin
  if ReadOnly then Exit;
  inherited;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  UpdateBtnBounds;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if HandleAllocated then SetEditRect;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.WMSize(var Message: TWMSize);
begin
  inherited;
  UpdateBtnBounds;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.SetEditRect;
var
  Loc: TRect;
begin
  SetRect(Loc, 0, 0, ClientWidth - FBtnControl.Width - 2, ClientHeight + 1);
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));
end;

{******************************************************************************}

procedure TCustombfdbEditButton.UpdateBtnBounds;
var
  BtnRect: TRect;
begin
  if NewStyleControls then
  begin
    if Ctl3D and (BorderStyle = bsSingle) then
      BtnRect := Bounds(Width - FButton.Width - 4, 0, FButton.Width, Height - 4)
    else
    begin
      if BorderStyle = bsSingle then
        BtnRect := Bounds(Width - FButton.Width - 2, 2, FButton.Width, Height - 4)
      else BtnRect := Bounds(Width - FButton.Width, 0, FButton.Width, Height);
    end;
  end
  else BtnRect := Bounds(Width - FButton.Width, 0, FButton.Width, Height);

  with BtnRect do FBtnControl.SetBounds(Left, Top, Right - Left, Bottom - Top);
  FButton.Height := FBtnControl.Height;
  SetEditRect;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.ButtonClick(Sender: TObject);
begin
  DoClick;
  if Enabled and (not Focused) then SetFocus;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.DoClick;
begin
  if ReadOnly  then Abort;
  if (Assigned(FOnButtonClick)) then FOnButtonClick(Self);
end;

{******************************************************************************}

function TCustombfdbEditButton.GetGlyph: TBitmap;
begin
  Result := FButton.Glyph;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.SetGlyph(Value: TBitmap);
begin
  FGlyph := Value;
  FButton.Glyph := FGlyph;
end;

{******************************************************************************}

{ TdbEditButton }

constructor TbfdbEditButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
//  Glyph.LoadFromResourceName(HInstance,'LUPA');
end;

{******************************************************************************}

function TCustombfdbEditButton.GetNumGlyphs: TNumGlyphs;
begin
  Result := FButton.NumGlyphs;
end;

{******************************************************************************}

procedure TCustombfdbEditButton.SetNumGlyphs(Value: TNumGlyphs);
begin
  FNumGlyphs := Value;
  FButton.NumGlyphs := NumGlyphs;
end;

end.
