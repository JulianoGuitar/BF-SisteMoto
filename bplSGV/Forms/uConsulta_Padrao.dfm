object fmConsulta: TfmConsulta
  Left = 265
  Top = 171
  BorderStyle = bsDialog
  Caption = 'Consulta'
  ClientHeight = 334
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    515
    334)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 401
    Width = 7
    Height = 16
    Caption = '_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object dbg: TDBGrid
    Left = 4
    Top = 24
    Width = 507
    Height = 272
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgDrawColumnCell
    OnDblClick = dbgDblClick
    OnKeyPress = dbgKeyPress
  end
  object btOK: TBitBtn
    Left = 346
    Top = 300
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btOKClick
    NumGlyphs = 2
  end
  object btDesist: TBitBtn
    Left = 421
    Top = 300
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Desistir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
    NumGlyphs = 2
  end
  object edtFiltro: TEdit
    Left = 4
    Top = 2
    Width = 667
    Height = 21
    TabOrder = 1
    OnChange = edtFiltroChange
    OnKeyDown = edtFiltroKeyDown
  end
  object edtINFO: TEdit
    Left = 4
    Top = 2
    Width = 667
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
    OnChange = edtFiltroChange
    OnKeyDown = edtFiltroKeyDown
  end
  object ds: TDataSource
    DataSet = cds
    Left = 13
    Top = 64
  end
  object cdsConsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 356
    Top = 123
    object cdsConsPadraoCOD: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsConsPadraoNOME: TStringField
      FieldName = 'Descricao'
      Size = 2000
    end
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 96
    Top = 136
  end
  object dsp: TDataSetProvider
    Left = 152
    Top = 136
  end
end
