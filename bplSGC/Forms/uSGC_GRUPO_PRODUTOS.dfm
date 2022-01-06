object fmSGC_GRUPO_PRODUTOS: TfmSGC_GRUPO_PRODUTOS
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'SGC012 | Grupo de Produtos'
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
  Position = poDefault
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
          Left = 592
          Top = 18
          Width = 88
          Height = 21
          Caption = 'Consultar'
          TabOrder = 3
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
          TabOrder = 4
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
              FieldName = 'COD_GRUPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUB_GRUPO'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 340
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 2
          Top = 15
          Width = 67
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsultaNOME: TbfEdit
          Left = 138
          Top = 15
          Width = 339
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object ckbInativoCons: TCheckBox
          Left = 490
          Top = 19
          Width = 94
          Height = 17
          Caption = 'Mostrar Inativo'
          TabOrder = 5
          OnClick = btConsultaClick
        end
        object edtConsSubGrupo: TbfEdit
          Left = 70
          Top = 15
          Width = 67
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
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
        TabOrder = 2
        OnClick = btIncluiClick
      end
      object btTransporta: TBitBtn
        Left = 320
        Top = 226
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Transportar'
        TabOrder = 1
        Visible = False
        OnClick = btTransportaClick
        NumGlyphs = 2
      end
      object btImprime: TBitBtn
        Left = 8
        Top = 226
        Width = 110
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Imprimir'
        TabOrder = 3
        OnClick = btImprimeClick
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
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
        Enabled = False
        TabOrder = 2
        OnClick = btSalvaClick
        NumGlyphs = 2
      end
      object btDesiste: TBitBtn
        Left = 411
        Top = 226
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Desistir'
        TabOrder = 3
        OnClick = btDesisteClick
        NumGlyphs = 2
      end
      object btExclui: TBitBtn
        Left = 3
        Top = 226
        Width = 91
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'E&xcluir!'
        Enabled = False
        TabOrder = 1
        TabStop = False
        OnClick = btExcluiClick
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 685
        Height = 224
        Align = alTop
        Caption = 'Cadastro'
        TabOrder = 0
        object Label1: TLabel
          Left = 11
          Top = 17
          Width = 11
          Height = 13
          Caption = 'ID'
          FocusControl = bfdbEdit1
          Visible = False
        end
        object Label2: TLabel
          Left = 11
          Top = 98
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = edtDescricao
        end
        object Label3: TLabel
          Left = 11
          Top = 58
          Width = 52
          Height = 13
          Caption = 'C'#243'd.Grupo'
          FocusControl = edtCodGrupo
        end
        object Label4: TLabel
          Left = 143
          Top = 58
          Width = 46
          Height = 13
          Caption = 'Subgrupo'
          FocusControl = edtSubGrupo
        end
        object bfdbEdit1: TbfdbEdit
          Left = 11
          Top = 30
          Width = 82
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ID'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
        object edtDescricao: TbfdbEdit
          Left = 11
          Top = 112
          Width = 663
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object ckbInativo: TDBCheckBox
          Left = 617
          Top = 19
          Width = 62
          Height = 17
          TabStop = False
          Caption = 'Inativo'
          DataField = 'INATIVO'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object edtCodGrupo: TbfdbEdit
          Left = 11
          Top = 74
          Width = 126
          Height = 21
          DataField = 'COD_GRUPO'
          DataSource = ds
          TabOrder = 1
        end
        object edtSubGrupo: TbfdbEdit
          Left = 143
          Top = 74
          Width = 134
          Height = 21
          DataField = 'SUB_GRUPO'
          DataSource = ds
          TabOrder = 2
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
    TabOrder = 2
    OnClick = btSaiClick
    NumGlyphs = 2
  end
  object btInclui: TBitBtn
    Tag = 1
    Left = 506
    Top = 250
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = btIncluiClick
  end
  object cds: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'COD_GRUPO;SUB_GRUPO'
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
    Top = 95
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
    object cdsID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      OnGetText = cdsIDGetText
    end
    object cdsDT_INCLUI: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
    end
    object cdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object cdsCOD_GRUPO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'd.Grupo'
      FieldName = 'COD_GRUPO'
    end
    object cdsCOD_SUB_GRUPO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Subgrupo'
      FieldName = 'SUB_GRUPO'
    end
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 376
    Top = 95
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from SGC_GRUPO_PRODUTOS')
    Left = 416
    Top = 95
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
    object qrID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrDT_INCLUI: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
    end
    object qrCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object qrCOD_SUB_GRUPO: TIntegerField
      FieldName = 'SUB_GRUPO'
    end
    object qrDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object qrINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 448
    Top = 95
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
    Left = 296
    Top = 94
  end
end
