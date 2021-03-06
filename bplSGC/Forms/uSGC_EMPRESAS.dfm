object fmSGC_EMPRESAS: TfmSGC_EMPRESAS
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'SGC001 | Empresas'
  ClientHeight = 385
  ClientWidth = 732
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
    732
    385)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 732
    Height = 385
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      OnShow = tsConsultaShow
      DesignSize = (
        724
        357)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 724
        Height = 326
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Consulta'
        TabOrder = 0
        object btConsulta: TBitBtn
          Left = 630
          Top = 23
          Width = 88
          Height = 21
          Caption = 'Consultar'
          TabOrder = 4
          OnClick = btConsultaClick
        end
        object dbgConsulta: TbfdbGrid
          Left = 2
          Top = 45
          Width = 720
          Height = 279
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
          TabOrder = 5
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
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 262
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNPJ'
              Width = 189
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CIDADE'
              Width = 172
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UF'
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 50
          Top = 23
          Width = 262
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtCNPJCons: TbfEdit
          Left = 313
          Top = 23
          Width = 191
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object ckbInativoCons: TCheckBox
          Left = 533
          Top = 25
          Width = 94
          Height = 17
          Caption = 'Mostrar Inativo'
          TabOrder = 3
          OnClick = btConsultaClick
        end
        object edtConsID: TbfEdit
          Left = 2
          Top = 23
          Width = 47
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
        Left = 450
        Top = 329
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Visualizar'
        TabOrder = 2
        OnClick = btIncluiClick
      end
      object btTransporta: TBitBtn
        Left = 357
        Top = 329
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
        Top = 329
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
        724
        357)
      object btSalva: TBitBtn
        Left = 359
        Top = 329
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
        Left = 450
        Top = 329
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
        Top = 329
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
        Width = 724
        Height = 327
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cadastro'
        TabOrder = 0
        object Label2: TLabel
          Left = 11
          Top = 68
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = edtNome
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
          Left = 113
          Top = 20
          Width = 25
          Height = 13
          Caption = 'CNPJ'
          FocusControl = edtCNPJ
        end
        object Label4: TLabel
          Left = 495
          Top = 20
          Width = 92
          Height = 13
          Caption = 'C'#243'digo de Controle'
          FocusControl = edtCOD_CONTROLE
        end
        object Label5: TLabel
          Left = 149
          Top = 107
          Width = 65
          Height = 13
          Caption = 'Insc.Estadual'
          FocusControl = edtInscEstadual
        end
        object Label6: TLabel
          Left = 321
          Top = 108
          Width = 67
          Height = 13
          Caption = 'Insc.Municipal'
          FocusControl = edtIscMunicipal
        end
        object Label7: TLabel
          Left = 12
          Top = 225
          Width = 13
          Height = 13
          Caption = 'UF'
          FocusControl = edtUF
        end
        object Label8: TLabel
          Left = 11
          Top = 147
          Width = 45
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = edtEndereco
        end
        object Label9: TLabel
          Left = 469
          Top = 148
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = edtNumero
        end
        object Label10: TLabel
          Left = 572
          Top = 148
          Width = 65
          Height = 13
          Caption = 'Complemento'
          FocusControl = edtComplemento
        end
        object Label11: TLabel
          Left = 181
          Top = 225
          Width = 28
          Height = 13
          Caption = 'Bairro'
          FocusControl = edtBairro
        end
        object Label12: TLabel
          Left = 45
          Top = 225
          Width = 19
          Height = 13
          Caption = 'CEP'
          FocusControl = edtCEP
        end
        object Label13: TLabel
          Left = 408
          Top = 269
          Width = 24
          Height = 13
          Caption = 'Fone'
          FocusControl = edtFone
        end
        object Label14: TLabel
          Left = 550
          Top = 270
          Width = 18
          Height = 13
          Caption = 'Fax'
          FocusControl = edtFax
        end
        object Label15: TLabel
          Left = 13
          Top = 270
          Width = 24
          Height = 13
          Caption = 'Email'
          FocusControl = edtEmail
        end
        object Label16: TLabel
          Left = 11
          Top = 108
          Width = 64
          Height = 13
          Caption = 'Tipo Empresa'
          FocusControl = edtTipoEmpresa
        end
        object Label17: TLabel
          Left = 12
          Top = 185
          Width = 56
          Height = 13
          Caption = 'C'#243'd.Cidade'
          FocusControl = edtCodCidade
        end
        object Label18: TLabel
          Left = 121
          Top = 185
          Width = 78
          Height = 13
          Caption = 'Nome da Cidade'
          FocusControl = edtNomeCidade
        end
        object edtNome: TbfdbEdit
          Left = 11
          Top = 83
          Width = 655
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
          TabOrder = 4
        end
        object bfdbEdit1: TbfdbEdit
          Left = 11
          Top = 36
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
        object edtCNPJ: TbfdbEdit
          Left = 113
          Top = 36
          Width = 236
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CNPJ'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtCOD_CONTROLE: TbfdbEdit
          Left = 495
          Top = 36
          Width = 136
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'COD_CONTROLE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtInscEstadual: TbfdbEdit
          Left = 149
          Top = 123
          Width = 167
          Height = 21
          CharCase = ecUpperCase
          DataField = 'INSC_EST'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtIscMunicipal: TbfdbEdit
          Left = 319
          Top = 123
          Width = 170
          Height = 21
          CharCase = ecUpperCase
          DataField = 'INSC_MUN'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtUF: TbfdbEdit
          Left = 12
          Top = 241
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UF'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object edtEndereco: TbfdbEdit
          Left = 11
          Top = 163
          Width = 456
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object edtNumero: TbfdbEdit
          Left = 469
          Top = 163
          Width = 95
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object edtComplemento: TbfdbEdit
          Left = 570
          Top = 163
          Width = 96
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMPLEMENTO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object edtBairro: TbfdbEdit
          Left = 181
          Top = 241
          Width = 485
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BAIRRO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object edtCEP: TbfdbEdit
          Left = 45
          Top = 241
          Width = 134
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CEP'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object edtFone: TbfdbEdit
          Left = 408
          Top = 285
          Width = 137
          Height = 21
          CharCase = ecUpperCase
          DataField = 'FONE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object edtFax: TbfdbEdit
          Left = 548
          Top = 285
          Width = 118
          Height = 21
          CharCase = ecUpperCase
          DataField = 'FAX'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
        end
        object edtEmail: TbfdbEdit
          Left = 11
          Top = 285
          Width = 394
          Height = 21
          CharCase = ecLowerCase
          DataField = 'MAIL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object edtTipoEmpresa: TbfdbEdit
          Left = 11
          Top = 123
          Width = 134
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPO_EMP'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object edtCodCidade: TbfdbEditButton
          Left = 12
          Top = 201
          Width = 109
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'COD_CIDADE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnChange = edtCodCidadeChange
          OnDblClick = edtCodCidadeButtonClick
          OnExit = edtCodCidadeExit
          NumGlyphs = 1
          Text = 'EDTCODCIDADE'
          OnButtonClick = edtCodCidadeButtonClick
        end
        object edtNomeCidade: TbfdbEdit
          Left = 121
          Top = 201
          Width = 545
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME_CIDADE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object btConsultaCNPJ: TBitBtn
          Left = 353
          Top = 36
          Width = 138
          Height = 21
          Caption = 'Consultar CNPJ!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = btConsultaCNPJClick
        end
        object ckbInativo: TDBCheckBox
          Left = 663
          Top = 16
          Width = 54
          Height = 17
          Caption = 'Inativo'
          DataField = 'INATIVO'
          DataSource = ds
          TabOrder = 19
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  object btSai: TBitBtn
    Left = 636
    Top = 353
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
    Left = 545
    Top = 353
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
    Left = 208
    Top = 152
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
    object cdsCNPJ: TStringField
      FieldName = 'CNPJ'
      OnGetText = cdsCNPJGetText
      Size = 30
    end
    object cdsCOD_CONTROLE: TIntegerField
      DisplayLabel = 'C'#243'd.Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsINSC_EST: TStringField
      DisplayLabel = 'Insc.Estadual'
      FieldName = 'INSC_EST'
      Size = 30
    end
    object cdsINSC_MUN: TStringField
      DisplayLabel = 'Insc.Municipal'
      FieldName = 'INSC_MUN'
      Size = 30
    end
    object cdsUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
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
    object cdsFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Size = 100
    end
    object cdsFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Size = 100
    end
    object cdsMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'MAIL'
      Size = 100
    end
    object cdsTIPO_EMP: TIntegerField
      DisplayLabel = 'Tipo Empresa'
      FieldName = 'TIPO_EMP'
    end
    object cdsCOD_CIDADE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'd.Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_CIDADE'
      ProviderFlags = []
      Size = 200
    end
    object cdsINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 424
    Top = 120
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select e.*, c.nome nome_cidade from SGD_EMPRESAS e'
      'left join SGD_cidades c on c.id = e.cod_cidade')
    Left = 176
    Top = 152
    object qrID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrNOME: TStringField
      FieldName = 'NOME'
      Size = 100
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
    object qrCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 30
    end
    object qrCOD_CONTROLE: TIntegerField
      FieldName = 'COD_CONTROLE'
    end
    object qrINSC_EST: TStringField
      FieldName = 'INSC_EST'
      Size = 30
    end
    object qrINSC_MUN: TStringField
      FieldName = 'INSC_MUN'
      Size = 30
    end
    object qrUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
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
    object qrFONE: TStringField
      FieldName = 'FONE'
      Size = 100
    end
    object qrFAX: TStringField
      FieldName = 'FAX'
      Size = 100
    end
    object qrMAIL: TStringField
      FieldName = 'MAIL'
      Size = 100
    end
    object qrTIPO_EMP: TIntegerField
      FieldName = 'TIPO_EMP'
    end
    object qrCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object qrNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      ProviderFlags = []
      Size = 200
    end
    object qrINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 464
    Top = 112
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
    Left = 160
    Top = 65520
  end
end
