object fmSGC_CIDADES: TfmSGC_CIDADES
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'SGC002 | Cidades'
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
          Left = 584
          Top = 13
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
              FieldName = 'ID'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UF'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 557
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 96
          Top = 13
          Width = 272
          Height = 21
          TabOrder = 2
          OnChange = edtConsultaCodigoChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtUF: TbfEdit
          Left = 69
          Top = 13
          Width = 26
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = edtConsultaCodigoChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsultaCodigo: TbfEdit
          Left = 2
          Top = 13
          Width = 66
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaCodigoChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object ckbInativoCons: TCheckBox
          Left = 478
          Top = 19
          Width = 94
          Height = 17
          Caption = 'Mostrar Inativo'
          TabOrder = 5
          OnClick = btConsultaClick
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
        Left = 318
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
        Top = -1
        Width = 685
        Height = 224
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cadastro'
        TabOrder = 0
        object Label2: TLabel
          Left = 11
          Top = 58
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = bfdbEdit2
        end
        object Label3: TLabel
          Left = 11
          Top = 20
          Width = 11
          Height = 13
          Caption = 'ID'
          FocusControl = bfdbEdit1
        end
        object Label1: TLabel
          Left = 128
          Top = 20
          Width = 13
          Height = 13
          Caption = 'UF'
          FocusControl = DBEdit1
        end
        object Label4: TLabel
          Left = 11
          Top = 105
          Width = 38
          Height = 13
          Caption = 'Regi'#245'es'
          FocusControl = DBEdit1
          Visible = False
        end
        object bfdbEdit2: TbfdbEdit
          Left = 11
          Top = 75
          Width = 615
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object bfdbEdit1: TbfdbEdit
          Left = 11
          Top = 34
          Width = 94
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
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit1: TDBEdit
          Left = 128
          Top = 34
          Width = 30
          Height = 21
          TabStop = False
          DataField = 'UF'
          DataSource = ds
          ReadOnly = True
          TabOrder = 1
        end
        object ckbInativo: TDBCheckBox
          Left = 620
          Top = 15
          Width = 58
          Height = 17
          TabStop = False
          Caption = 'Inativo'
          DataField = 'INATIVO'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object edtIDRegiao: TbfdbEditButton
          Left = 11
          Top = 118
          Width = 94
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'ID_REGIOES'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnChange = edtIDRegiaoChange
          OnDblClick = edtIDRegiaoButtonClick
          OnExit = edtIDRegiaoExit
          NumGlyphs = 1
          Text = 'EDTIDREGIAO'
          OnButtonClick = edtIDRegiaoButtonClick
        end
        object edtNomeRegiao: TbfdbEdit
          Left = 107
          Top = 118
          Width = 519
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'REGIAO_NOME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Visible = False
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
    object cdsID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      OnGetText = cdsIDGetText
    end
    object cdsNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 100
    end
    object cdsUSU_INCLUI: TStringField
      FieldName = 'USU_INCLUI'
      Size = 30
    end
    object cdsDT_INCLUI: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
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
    object cdsUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 2
    end
    object cdsINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object cdsID_REGIOES: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID_REGIOES'
    end
    object cdsREGIAO_NOME: TStringField
      FieldName = 'REGIAO_NOME'
      ProviderFlags = []
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
      'select sg.*'
      ', u.UF, r.descricao REGIAO_NOME'
      'from SGC_CIDADES sg'
      
        'left join SGC_UF u on u.cod_uf = cast(substring(cast(sg.id as va' +
        'rchar(10)) from 1 for 2) as int)'
      'left join SGC_REGIOES r on r.ID = sg.ID_REGIOES')
    Left = 432
    Top = 96
    object qrID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object qrUSU_INCLUI: TStringField
      FieldName = 'USU_INCLUI'
      Size = 30
    end
    object qrDT_INCLUI: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
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
    object qrUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 2
    end
    object qrINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object qrID_REGIOES: TIntegerField
      FieldName = 'ID_REGIOES'
    end
    object qrREGIAO_NOME: TStringField
      FieldName = 'REGIAO_NOME'
      ProviderFlags = []
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
    Cabecalho2Direita = '#Data'
    Cabecalho3Esquerda = '#Titulo'
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
