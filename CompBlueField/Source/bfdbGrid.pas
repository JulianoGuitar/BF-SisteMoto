unit bfdbGrid;

(******************************************************************************)
(*     © 2018 Jµ£¡åñø¸Ð¸®ø§å ¸ þ®ø¥¡§µå£                                      *)
(******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids;

type
  TGridLayout = class(TPersistent)
    private
      FAlternaCor: boolean;
      FCorAlternada: TColor;
      FRealcaCor: boolean;
      FCorRealce: TColor;
    protected
      procedure SetCorAlternada(Value : TColor);
      function GetCorAlternada: TColor;
      procedure SetCorRealce(Value: TColor);
      function GetCorRealce: TColor;
    public
      constructor Create(AOwner : TComponent);
      Destructor Destroy;
    published
      property AlternaCor: boolean read FAlternaCor write FAlternaCor default False;
      property CorAlternada: TColor read GetCorAlternada write FCorAlternada default $00FFFBF0;
      property RealcaCor: boolean read FRealcaCor write FRealcaCor default False;
      property CorRealce: TColor read GetCorRealce write FCorRealce default $00B4FBAE;
  end;

type
  TbfdbGrid = class(TDBGrid)
  private
    FCorComFoco : TColor;
    FCorFonteComFoco : TColor;
    CorAntiga, CorFonteAntiga  : TColor;
    FSairComEnter, FEditCheck : Boolean;
    FCampoCheck, FValorCampoCheck, FValorCampoUnCheck: string;
    FImageCheck, FImageUncheck : TBitmap;
    iMeio : integer;
    FVersao: String;
    FLayoutEx: TGridLayout;
        { Private declarations }
  protected
    procedure WMMouseWheel(var Msg: TWMMouseWheel); message WM_MOUSEWHEEL;
    procedure CMEnter( var Message : TCMEnter); message CM_ENTER;
    procedure CMExit( var Message : TCMExit); message CM_EXIT;
    procedure KeyPress(var Key : Char );Override;
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);Override;
    procedure CellClick(Column: TColumn);Override;
    procedure SetImCheck(Value: TBitmap);
    procedure SetImUnCheck(Value: TBitmap);
    function GetImCheck: TBitmap;
    function GetImUnCheck: TBitmap;
    procedure SetLayoutEx(Value : TGridLayout);

    { Protected declarations }
  public
    constructor Create(AOwner : TComponent);override;
    Destructor Destroy;Override;
    { Public declarations }

  published

    property CorComFoco : TColor read FCorComFoco write FCorComFoco default clSkyBlue;
    property CorFonteComFoco : TColor read FCorFonteComFoco write FCorFonteComFoco default clBlack;
    property SairComEnter : Boolean read FSairComEnter write FSairComEnter default True;
    property EditDataSetCheck : Boolean read FEditCheck write FEditCheck default True;
    property CampoCheckBox : String read FCampoCheck write FCampoCheck;
    property ValorCampoCheck : String read FValorCampoCheck write FValorCampoCheck;
    property ValorCampoUnCheck : String read FValorCampoUnCheck write FValorCampoUnCheck;
    property ImageChecked: TBitmap read GetImCheck write SetImCheck;
    property ImageUnChecked: TBitmap read GetImUnCheck write SetImUnCheck;
    property Versao: string read FVersao;
    property LayoutEx: TGridLayout read FLayoutEx write FLayoutEx ;
    { Published declarations }
  end;

type
  THackDBGrid = class(TDBGrid);

implementation

{******************************************************************************}

constructor TbfdbGrid.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  if trim(CampoCheckBox) <> '' then
  begin
    Options := [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit];
    ReadOnly := True;
  end
  else Options := [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgtabs, dgAlwaysShowSelection];
  TitleFont.Name := 'Tahoma';
  TitleFont.Style := [fsBold];
  Font.Name := 'Tahoma';
  Font.Size := 8;
  FCorComFoco := clSkyBlue;
  FCorFonteComFoco := clBlack;
  FSairComEnter := false;
  FImageCheck := TBitmap.Create;
  FImageUncheck := TBitmap.Create;
  FEditCheck := true;
  FVersao:= '4081';
  FLayoutEx:= TGridLayout.Create(Self);
end;

{******************************************************************************}

procedure TbfdbGrid.KeyPress(var Key : Char );
begin
  inherited KeyPress(Key);
  if (Key = Char(VK_RETURN)) and (SairComEnter) then
  begin
    Key := #0;
    Keybd_Event(VK_TAB,0,0,0);
  end;
  if (key = chr(VK_SPACE)) and (trim(CampoCheckBox) <> '') and EditDataSetCheck and (not DataSource.DataSet.IsEmpty) then
  begin
    DataSource.DataSet.Edit;
    if (DataSource.DataSet.FieldByName(CampoCheckBox).AsString = '') then
      DataSource.DataSet.FieldByName(CampoCheckBox).AsString := ValorCampoCheck
    else DataSource.DataSet.FieldByName(CampoCheckBox).AsString := ValorCampoUnCheck;
    DataSource.DataSet.post;
  end;
end;

{******************************************************************************}

procedure TbfdbGrid.CMEnter( var Message : TCMEnter);
begin
  CorAntiga := Color;
  CorFonteAntiga := Font.Color;
  Color := CorComFoco;
  Font.Color := CorFonteComFoco;
  inherited;
end;

{******************************************************************************}

procedure TbfdbGrid.CMExit( var Message : TCMExit);
begin
  Color := CorAntiga;
  Font.Color := CorFonteAntiga;
  inherited;
end;

{******************************************************************************}

procedure TbfdbGrid.SetImCheck(Value: TBitmap);
begin
  FImageCheck.Assign(Value);
end;

(******************************************************************************)

procedure TbfdbGrid.SetImUnCheck(Value: TBitmap);
begin
  FImageUncheck.Assign(Value);
end;

procedure TbfdbGrid.SetLayoutEx(Value: TGridLayout);
begin
  //FLayoutEx.Assign(Value);
end;

(******************************************************************************)

function TbfdbGrid.GetImCheck: TBitmap;
begin
  Result := FImageCheck;
end;

(******************************************************************************)

function TbfdbGrid.GetImUnCheck: TBitmap;
begin
  Result := FImageUncheck;
end;

(******************************************************************************)

procedure TbfdbGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if FLayoutEx.FAlternaCor then
    if odd(self.DataSource.DataSet.RecNo) then
      if not (gdSelected in State) then
      begin
        self.Canvas.Brush.Color := FLayoutEx.FCorAlternada;
        self.Canvas.FillRect(Rect);
        self.DefaultDrawDataCell(Rect,Column.Field,State);
      end;

  if FLayoutEx.FRealcaCor then
    if (THackDBGrid(self).DataLink.ActiveRecord + 1 =  THackDBGrid(self).Row)
       or (gdSelected in State) then
    begin
      self.Canvas.Brush.Color := FLayoutEx.FCorRealce;
      self.Canvas.Font.Style := self.Canvas.Font.Style + [fsBold];
      self.DefaultDrawDataCell(Rect, self.Columns[DataCol].Field, State);
    end;

  if (gdFocused in State) then
  begin
    self.Canvas.Brush.Color := clHighLight;
    self.Canvas.Font.Style := self.Canvas.Font.Style + [fsBold];
    self.DefaultDrawDataCell(Rect, self.Columns[DataCol].Field, State);
  end;

  if Column.FieldName = CampoCheckBox then
    with Canvas do
    begin
      FillRect(Rect);
      iMeio := (Rect.Right - Rect.Left) div 2;
      if Column.Field.AsString = ValorCampoCheck then Draw(Rect.Left + iMeio - 6 , Rect.Top + 2, ImageChecked)
      else Draw(Rect.Left + iMeio - 6, Rect.Top + 2, ImageUnChecked)
    end;
end;

(******************************************************************************)

procedure TbfdbGrid.CellClick(Column: TColumn);
begin
  inherited;
  if (trim(CampoCheckBox) <> '') and EditDataSetCheck
  and ((dgRowSelect in Options) or (Column.FieldName = CampoCheckBox))
  and (not DataSource.DataSet.IsEmpty) then
  begin
    DataSource.DataSet.Edit;
    if (DataSource.DataSet.FieldByName(CampoCheckBox).AsString = '') then
      DataSource.DataSet.FieldByName(CampoCheckBox).AsString := ValorCampoCheck
    else DataSource.DataSet.FieldByName(CampoCheckBox).AsString := ValorCampoUnCheck;
    DataSource.DataSet.post;
  end;
end;

(******************************************************************************)

procedure TbfdbGrid.WMMouseWheel(var Msg: TWMMouseWheel);
// This fixes mouse wheel scroll bug
begin
if (DataLink <> nil) and (DataLink.Active) then
DataLink.DataSet.MoveBy(-Msg.WheelDelta div WHEEL_DELTA); //WHEEL_DELTA is constant defined as 120
end; {WMMouseWheel}

(******************************************************************************)

destructor TbfdbGrid.Destroy;
begin
  FImageCheck.Free;
  FImageUncheck.Free;
  FLayoutEx.Free;
  inherited;
end;

(******************************************************************************)

{ TGridJulLayout }

constructor TGridLayout.Create(AOwner: TComponent);
begin
  Self.FCorAlternada:= $00FFFBF0;
  Self.FCorRealce:= $00B4FBAE;
end;

destructor TGridLayout.Destroy;
begin
  inherited;
end;

function TGridLayout.GetCorAlternada: TColor;
begin
  Result:= Self.FCorAlternada;
end;

function TGridLayout.GetCorRealce: TColor;
begin
  result:= Self.FCorRealce;
end;

procedure TGridLayout.SetCorAlternada(Value: TColor);
begin
  Self.FCorAlternada:= value;
end;

procedure TGridLayout.SetCorRealce(Value: TColor);
begin
  Self.FCorRealce:= Value;
end;

end.
