object fmSGD_ModuloS: TfmSGD_ModuloS
  Left = 0
  Top = 0
  Caption = 'SGD002 | Modulos'
  ClientHeight = 282
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  DesignSize = (
    693
    282)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 693
    Height = 282
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      OnShow = tsConsultaShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        685
        254)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 685
        Height = 223
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Consulta'
        TabOrder = 0
        object btConsulta: TBitBtn
          Left = 594
          Top = 13
          Width = 88
          Height = 21
          Caption = 'Consultar'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
          OnClick = btConsultaClick
        end
        object dbgConsulta: TbfdbGrid
          Left = 2
          Top = 40
          Width = 681
          Height = 181
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbgConsultaDblClick
          OnKeyPress = dbgConsultaKeyPress
          OnKeyUp = dbgConsultaKeyUp
          SairComEnter = False
          Columns = <
            item
              Expanded = False
              FieldName = 'MODULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 2
          Top = 15
          Width = 272
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
      end
      object btEditar: TBitBtn
        Left = 411
        Top = 226
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Visualizar'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = btIncluiClick
      end
      object btTransporta: TBitBtn
        Left = 318
        Top = 226
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Transportar'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 1
        Visible = False
        OnClick = btTransportaClick
      end
      object btImprime: TBitBtn
        Left = 8
        Top = 226
        Width = 110
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Imprimir'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = btImprimeClick
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        685
        254)
      object btSalva: TBitBtn
        Left = 320
        Top = 226
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Salvar'
        DoubleBuffered = True
        Enabled = False
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = btSalvaClick
      end
      object btDesiste: TBitBtn
        Left = 411
        Top = 226
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Desistir'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = btDesisteClick
      end
      object btExclui: TBitBtn
        Left = 3
        Top = 226
        Width = 91
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'E&xcluir!'
        DoubleBuffered = True
        Enabled = False
        ParentDoubleBuffered = False
        TabOrder = 1
        TabStop = False
        OnClick = btExcluiClick
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 685
        Height = 224
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cadastro'
        TabOrder = 0
        object Label1: TLabel
          Left = 11
          Top = 22
          Width = 34
          Height = 13
          Caption = 'M'#243'dulo'
          FocusControl = bfdbEdit1
        end
        object Label2: TLabel
          Left = 11
          Top = 62
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = bfdbEdit2
        end
        object bfdbEdit1: TbfdbEdit
          Left = 11
          Top = 38
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MODULO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object bfdbEdit2: TbfdbEdit
          Left = 11
          Top = 78
          Width = 663
          Height = 21
          DataField = 'NOME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  object btSai: TBitBtn
    Left = 597
    Top = 250
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Sair'
    DoubleBuffered = True
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = btSaiClick
  end
  object btInclui: TBitBtn
    Tag = 1
    Left = 506
    Top = 250
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Incluir'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btIncluiClick
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    AfterInsert = cdsAfterInsert
    AfterEdit = cdsAfterEdit
    BeforePost = cdsBeforePost
    AfterPost = cdsAfterPost
    AfterCancel = cdsAfterCancel
    AfterDelete = cdsAfterDelete
    OnNewRecord = cdsNewRecord
    Left = 336
    Top = 96
    object cdsMODULO: TStringField
      DisplayLabel = 'M'#243'dulo'
      DisplayWidth = 14
      FieldName = 'MODULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Size = 30
    end
    object cdsNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 100
    end
    object cdsUSU_INCLUI: TStringField
      FieldName = 'USU_INCLUI'
      Size = 30
    end
    object cdsUSU_ALTERA: TStringField
      FieldName = 'USU_ALTERA'
      Size = 30
    end
    object cdsDT_ALTERA: TSQLTimeStampField
      FieldName = 'DT_ALTERA'
    end
    object cdsIDALT: TStringField
      FieldName = 'IDALT'
      Size = 100
    end
    object cdsIDALTERADO: TStringField
      FieldName = 'IDALTERADO'
      Size = 100
    end
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 376
    Top = 96
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from sgd_Modulos')
    Left = 432
    Top = 96
    object qrMODULO: TStringField
      FieldName = 'MODULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object qrNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qrUSU_INCLUI: TStringField
      FieldName = 'USU_INCLUI'
      Size = 30
    end
    object qrUSU_ALTERA: TStringField
      FieldName = 'USU_ALTERA'
      Size = 30
    end
    object qrDT_ALTERA: TSQLTimeStampField
      FieldName = 'DT_ALTERA'
    end
    object qrIDALT: TStringField
      FieldName = 'IDALT'
      Size = 100
    end
    object qrIDALTERADO: TStringField
      FieldName = 'IDALTERADO'
      Size = 100
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 480
    Top = 104
  end
  object RelVisual: TRelVisualBlue
    Cabecalho1Direita = '#Pag'
    Cabecalho2Esquerda = '#Titulo'
    Cabecalho2Direita = '#Data'
    Cabecalho3Direita = '#Hora'
    ClientDataSet = cds
    MarginLeft = 10.000000000000000000
    MarginTop = 10.000000000000000000
    MarginRight = 10.000000000000000000
    MarginBottom = 10.000000000000000000
    Fonte.Charset = DEFAULT_CHARSET
    Fonte.Color = clWindowText
    Fonte.Height = -11
    Fonte.Name = 'Tahoma'
    Fonte.Style = []
    TXTCharSeparador = ';'
    Left = 304
    Top = 112
  end
end
