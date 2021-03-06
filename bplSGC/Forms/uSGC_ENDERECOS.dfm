object fmSGC_ENDERECOS: TfmSGC_ENDERECOS
  Left = 0
  Top = 0
  Width = 709
  Height = 321
  Caption = 'SGC016 | Endere'#231'os'
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
          Top = 60
          Width = 681
          Height = 161
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
              FieldName = 'NOME_CIDADE'
              Title.Caption = 'Cidade'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UF'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_ENDERECO'
              Width = 100
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 2
          Top = 38
          Width = 68
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsultaNOME: TbfEdit
          Left = 71
          Top = 38
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
          Left = 486
          Top = 17
          Width = 95
          Height = 17
          Caption = 'Mostrar Inativo'
          TabOrder = 4
          OnClick = btConsultaClick
        end
        object edtConsCidade: TbfEdit
          Left = 322
          Top = 38
          Width = 199
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 5
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsUF: TbfEdit
          Left = 522
          Top = 38
          Width = 22
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 6
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
          Left = 8
          Top = 57
          Width = 20
          Height = 13
          Caption = 'Tipo'
        end
        object Label2: TLabel
          Left = 154
          Top = 57
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = edtDescricao
        end
        object Label3: TLabel
          Left = 8
          Top = 130
          Width = 45
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = edtEndereco
        end
        object Label4: TLabel
          Left = 314
          Top = 130
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = edtNumero
        end
        object Label5: TLabel
          Left = 417
          Top = 130
          Width = 65
          Height = 13
          Caption = 'Complemento'
          FocusControl = edtComplemento
        end
        object Label6: TLabel
          Left = 8
          Top = 170
          Width = 28
          Height = 13
          Caption = 'Bairro'
          FocusControl = edtBairro
        end
        object Label7: TLabel
          Left = 314
          Top = 170
          Width = 19
          Height = 13
          Caption = 'CEP'
          FocusControl = edtCEP
        end
        object Label8: TLabel
          Left = 8
          Top = 17
          Width = 57
          Height = 13
          Caption = 'Participante'
          FocusControl = edtEndereco
        end
        object Label9: TLabel
          Left = 8
          Top = 93
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = edtDescricao
        end
        object Label10: TLabel
          Left = 606
          Top = 93
          Width = 13
          Height = 13
          Caption = 'UF'
          FocusControl = edtUF
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
          TabOrder = 12
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object edtDescricao: TbfdbEdit
          Left = 154
          Top = 70
          Width = 445
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME_ENDERECO'
          DataSource = ds
          TabOrder = 3
        end
        object cbxTipoEndereco: TbfdbComboBox
          Left = 8
          Top = 70
          Width = 142
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'TIPO_ENDERECO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            '01 - COBRAN'#199'A'
            '02 - ENTREGA')
          ParentFont = False
          TabOrder = 2
        end
        object edtEndereco: TbfdbEdit
          Left = 8
          Top = 146
          Width = 300
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = ds
          TabOrder = 7
        end
        object edtNumero: TbfdbEdit
          Left = 314
          Top = 146
          Width = 100
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO'
          DataSource = ds
          TabOrder = 8
        end
        object edtComplemento: TbfdbEdit
          Left = 417
          Top = 146
          Width = 100
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMPLEMENTO'
          DataSource = ds
          TabOrder = 9
        end
        object edtBairro: TbfdbEdit
          Left = 8
          Top = 186
          Width = 300
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BAIRRO'
          DataSource = ds
          TabOrder = 10
        end
        object edtCEP: TbfdbEdit
          Left = 314
          Top = 186
          Width = 134
          Height = 21
          DataField = 'CEP'
          DataSource = ds
          TabOrder = 11
        end
        object edtCodParticipante: TbfdbEditButton
          Left = 8
          Top = 30
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
          Left = 90
          Top = 30
          Width = 509
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'NOME_PARTICIPANTE'
          DataSource = ds
          ReadOnly = True
          TabOrder = 1
        end
        object edtCodCidade: TbfdbEditButton
          Left = 8
          Top = 107
          Width = 79
          Height = 21
          AutoSize = False
          DataField = 'COD_CIDADE'
          DataSource = ds
          TabOrder = 4
          OnChange = edtCodCidadeChange
          OnDblClick = edtCodCidadeButtonClick
          OnExit = edtCodCidadeExit
          NumGlyphs = 1
          Text = 'edtCodCidade'
          OnButtonClick = edtCodCidadeButtonClick
        end
        object edtNomeCidade: TbfdbEdit
          Left = 89
          Top = 107
          Width = 510
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'NOME_CIDADE'
          DataSource = ds
          ReadOnly = True
          TabOrder = 5
        end
        object edtUF: TbfdbEdit
          Left = 606
          Top = 107
          Width = 30
          Height = 21
          TabStop = False
          DataField = 'UF'
          DataSource = ds
          ReadOnly = True
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
    Top = 7
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
    object cdsTIPO_ENDERECO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ENDERECO'
      OnGetText = cdsTIPO_ENDERECOGetText
      FixedChar = True
      Size = 2
    end
    object cdsNOME_ENDERECO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME_ENDERECO'
      Size = 100
    end
    object cdsENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 200
    end
    object cdsNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Size = 30
    end
    object cdsCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object cdsBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 100
    end
    object cdsCEP: TIntegerField
      FieldName = 'CEP'
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
    object cdsCOD_CIDADE: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'COD_CIDADE'
    end
    object cdsUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 100
    end
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 432
    Top = 65535
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from SGC_ENDERECOS')
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
    object qrTIPO_ENDERECO: TStringField
      FieldName = 'TIPO_ENDERECO'
      FixedChar = True
      Size = 2
    end
    object qrNOME_ENDERECO: TStringField
      FieldName = 'NOME_ENDERECO'
      Size = 100
    end
    object qrENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 200
    end
    object qrNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 30
    end
    object qrCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object qrBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object qrCEP: TIntegerField
      FieldName = 'CEP'
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
    object qrCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object qrUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      ProviderFlags = []
      Size = 100
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
    Left = 360
    Top = 65526
  end
  object qrApoio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from SGC_ENDERECOS')
    Left = 304
    Top = 11
  end
end
