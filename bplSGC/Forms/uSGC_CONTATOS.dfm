object fmSGC_CONTATOS: TfmSGC_CONTATOS
  Left = 0
  Top = 0
  Width = 709
  Height = 321
  Caption = 'SGC017 | Contatos'
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
          Left = 586
          Top = 15
          Width = 88
          Height = 21
          Caption = 'Consultar'
          TabOrder = 2
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
          TabOrder = 3
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
              FieldName = 'ID_PARTICIPANTE'
              Title.Caption = 'ID Participante'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_PARTICIPANTE'
              Title.Caption = 'Participante'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTATO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SETOR'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FONE'
              Width = 150
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 2
          Top = 17
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsultaNOME: TbfEdit
          Left = 77
          Top = 17
          Width = 250
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object ckbInativoCons: TCheckBox
          Left = 490
          Top = 17
          Width = 93
          Height = 17
          Caption = 'Mostrar Inativo'
          TabOrder = 4
          OnClick = btConsultaClick
        end
        object edtConsSetor: TbfEdit
          Left = 328
          Top = 17
          Width = 150
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 5
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
        object Label8: TLabel
          Left = 8
          Top = 20
          Width = 57
          Height = 13
          Caption = 'Participante'
        end
        object Label1: TLabel
          Left = 8
          Top = 58
          Width = 39
          Height = 13
          Caption = 'Contato'
          FocusControl = edtContato
        end
        object Label2: TLabel
          Left = 314
          Top = 58
          Width = 26
          Height = 13
          Caption = 'Setor'
          FocusControl = edtSetor
        end
        object Label3: TLabel
          Left = 8
          Top = 104
          Width = 24
          Height = 13
          Caption = 'Email'
          FocusControl = edtEmail
        end
        object Label4: TLabel
          Left = 314
          Top = 103
          Width = 24
          Height = 13
          Caption = 'Fone'
          FocusControl = edtFone
        end
        object ckbInativo: TDBCheckBox
          Left = 624
          Top = 16
          Width = 53
          Height = 17
          TabStop = False
          Caption = 'Inativo'
          DataField = 'INATIVO'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object edtCodParticipante: TbfdbEditButton
          Left = 8
          Top = 34
          Width = 79
          Height = 21
          AutoSize = False
          DataField = 'ID_PARTICIPANTE'
          DataSource = ds
          TabOrder = 0
          OnChange = edtCodParticipanteChange
          OnDblClick = edtCodParticipanteButtonClick
          OnExit = edtCodParticipanteExit
          NumGlyphs = 1
          Text = 'edtCodParticipante'
          OnButtonClick = edtCodParticipanteButtonClick
        end
        object edtNomeParticipante: TbfdbEdit
          Left = 93
          Top = 34
          Width = 510
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'NOME_PARTICIPANTE'
          DataSource = ds
          ReadOnly = True
          TabOrder = 1
        end
        object edtContato: TbfdbEdit
          Left = 8
          Top = 74
          Width = 300
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CONTATO'
          DataSource = ds
          TabOrder = 3
        end
        object edtSetor: TbfdbEdit
          Left = 314
          Top = 74
          Width = 300
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SETOR'
          DataSource = ds
          TabOrder = 4
        end
        object edtEmail: TbfdbEdit
          Left = 8
          Top = 120
          Width = 300
          Height = 21
          DataField = 'MAIL'
          DataSource = ds
          TabOrder = 5
        end
        object edtFone: TbfdbEdit
          Left = 314
          Top = 119
          Width = 300
          Height = 21
          DataField = 'FONE'
          DataSource = ds
          TabOrder = 6
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
    Left = 384
    Top = 65528
    object cdsID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsID_PARTICIPANTE: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID_PARTICIPANTE'
      Required = True
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
    object cdsDT_INCLUI: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
    end
    object cdsINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object cdsNOME_PARTICIPANTE: TStringField
      FieldName = 'NOME_PARTICIPANTE'
      ProviderFlags = []
      Size = 100
    end
    object cdsCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 100
    end
    object cdsSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 100
    end
    object cdsMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'MAIL'
      Size = 100
    end
    object cdsFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Size = 30
    end
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 432
    Top = 65529
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select c.*, p.NOME NOME_PARTICIPANTE from SGC_CONTATOS c'
      'left join SGC_PARTICIPANTES p on p.ID = c.ID_PARTICIPANTE')
    Left = 488
    Top = 65527
    object qrID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrID_PARTICIPANTE: TIntegerField
      FieldName = 'ID_PARTICIPANTE'
      Required = True
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
    object qrDT_INCLUI: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
    end
    object qrINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object qrNOME_PARTICIPANTE: TStringField
      FieldName = 'NOME_PARTICIPANTE'
      ProviderFlags = []
      Size = 100
    end
    object qrCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 100
    end
    object qrSETOR: TStringField
      FieldName = 'SETOR'
      Size = 100
    end
    object qrMAIL: TStringField
      FieldName = 'MAIL'
      Size = 100
    end
    object qrFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 560
    Top = 65527
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
    Left = 312
    Top = 65521
  end
end
