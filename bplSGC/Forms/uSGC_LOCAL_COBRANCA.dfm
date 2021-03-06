object fmSGC_LOCAIS_COBRANCA: TfmSGC_LOCAIS_COBRANCA
  Left = 0
  Top = 0
  Width = 707
  Height = 518
  Caption = 'SGC005 | Locais de Cobran'#231'a'
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
    691
    479)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 691
    Height = 479
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      OnShow = tsConsultaShow
      DesignSize = (
        683
        451)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 683
        Height = 420
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Consulta'
        TabOrder = 0
        object btConsulta: TBitBtn
          Left = 561
          Top = 13
          Width = 88
          Height = 21
          Caption = 'Consultar'
          TabOrder = 2
          OnClick = btConsultaClick
        end
        object dbgConsulta: TbfdbGrid
          Left = 2
          Top = 40
          Width = 679
          Height = 378
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
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 385
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_BANCO'
              Width = 62
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 4
          Top = 13
          Width = 62
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsultaNOME: TbfEdit
          Left = 68
          Top = 13
          Width = 382
          Height = 21
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object ckbInativoCons: TCheckBox
          Left = 463
          Top = 15
          Width = 93
          Height = 17
          Caption = 'Mostrar Inativo'
          TabOrder = 4
          OnClick = btConsultaClick
        end
      end
      object btEditar: TBitBtn
        Left = 409
        Top = 423
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Visualizar'
        TabOrder = 2
        OnClick = btIncluiClick
      end
      object btTransporta: TBitBtn
        Left = 318
        Top = 423
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
        Left = 6
        Top = 423
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
        683
        451)
      object btSalva: TBitBtn
        Left = 318
        Top = 423
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
        Left = 409
        Top = 423
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
        Top = 423
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
        Width = 683
        Height = 421
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cadastro'
        TabOrder = 0
        object Label1: TLabel
          Left = 4
          Top = 16
          Width = 11
          Height = 13
          Caption = 'ID'
          FocusControl = edtID
        end
        object Label2: TLabel
          Left = 166
          Top = 19
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = edtNOME
        end
        object Label3: TLabel
          Left = 4
          Top = 54
          Width = 52
          Height = 13
          Caption = 'C'#243'd.Banco'
        end
        object Label4: TLabel
          Left = 4
          Top = 95
          Width = 62
          Height = 13
          Caption = 'Tipo Carteira'
          FocusControl = edtTipoCarteira
        end
        object Label5: TLabel
          Left = 4
          Top = 135
          Width = 55
          Height = 13
          Caption = 'Tipo Moeda'
          FocusControl = edtTipoMoeda
        end
        object Label6: TLabel
          Left = 4
          Top = 175
          Width = 103
          Height = 13
          Caption = 'N'#250'mero Conta Comp.'
          FocusControl = edtNmrContaComp
        end
        object Label7: TLabel
          Left = 4
          Top = 215
          Width = 61
          Height = 13
          Caption = 'C'#243'd.Ag'#234'ncia'
          FocusControl = edtCodAgencia
        end
        object Label8: TLabel
          Left = 4
          Top = 251
          Width = 115
          Height = 13
          Caption = 'N'#250'mero Conta Corrente'
          FocusControl = edtNmrContaCorrente
        end
        object Label9: TLabel
          Left = 4
          Top = 288
          Width = 83
          Height = 13
          Caption = 'C'#243'd.Conv'#234'nio LD'
          FocusControl = edtCodConvenioLD
        end
        object Label10: TLabel
          Left = 144
          Top = 288
          Width = 41
          Height = 13
          Caption = 'Varia'#231#227'o'
          FocusControl = edtVariacao
        end
        object Label11: TLabel
          Left = 4
          Top = 328
          Width = 57
          Height = 13
          Caption = 'Mensagem1'
          FocusControl = edtMensagem1
        end
        object Label12: TLabel
          Left = 4
          Top = 368
          Width = 57
          Height = 13
          Caption = 'Mensagem2'
          FocusControl = edtMensagem2
        end
        object Label20: TLabel
          Left = 281
          Top = 251
          Width = 87
          Height = 13
          Caption = 'DV.Ag'#234'ncia Conta'
          FocusControl = edtDVAgenciaConta
        end
        object edtID: TbfdbEdit
          Left = 4
          Top = 32
          Width = 134
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
        end
        object edtNOME: TbfdbEdit
          Left = 165
          Top = 32
          Width = 400
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
          TabOrder = 1
        end
        object edtTipoCarteira: TbfdbEdit
          Left = 4
          Top = 111
          Width = 264
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPO_CARTEIRA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edtTipoMoeda: TbfdbEdit
          Left = 4
          Top = 151
          Width = 264
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPO_MOEDA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object edtNmrContaComp: TbfdbEdit
          Left = 4
          Top = 191
          Width = 264
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUM_CONTA_COMP'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtCodAgencia: TbfdbEdit
          Left = 3
          Top = 228
          Width = 264
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COD_AGENCIA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtNmrContaCorrente: TbfdbEdit
          Left = 3
          Top = 264
          Width = 264
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUM_CONTA_CORR'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object edtCodConvenioLD: TbfdbEdit
          Left = 4
          Top = 304
          Width = 134
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COD_CONVENIO_LD'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object edtVariacao: TbfdbEdit
          Left = 144
          Top = 304
          Width = 134
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VARIACAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object edtMensagem1: TbfdbEdit
          Left = 4
          Top = 344
          Width = 400
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MENSAGEM1'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object edtMensagem2: TbfdbEdit
          Left = 4
          Top = 384
          Width = 400
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MENSAGEM2'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object gbRemessa: TGroupBox
          Left = 396
          Top = 94
          Width = 281
          Height = 134
          Caption = 'Remessa'
          TabOrder = 14
          object Label13: TLabel
            Left = 5
            Top = 13
            Width = 73
            Height = 13
            Caption = 'Num.Remessas'
            FocusControl = edtNumRemessas
          end
          object Label14: TLabel
            Left = 5
            Top = 51
            Width = 116
            Height = 13
            Caption = 'Num.Registro Remessas'
            FocusControl = edtNumRegRemessas
          end
          object Label15: TLabel
            Left = 5
            Top = 91
            Width = 64
            Height = 13
            Caption = 'Esp.Remessa'
            FocusControl = edtEspecie
          end
          object Label16: TLabel
            Left = 85
            Top = 91
            Width = 67
            Height = 13
            Caption = 'Acei.Remessa'
            FocusControl = edtAceite
          end
          object Label17: TLabel
            Left = 146
            Top = 12
            Width = 52
            Height = 13
            Caption = 'Instru'#231#227'o1'
            FocusControl = edtInstrucao1
          end
          object Label18: TLabel
            Left = 146
            Top = 52
            Width = 55
            Height = 13
            Caption = 'Instru'#231#227'o 2'
            FocusControl = edtInstrucao2
          end
          object edtNumRemessas: TbfdbEdit
            Left = 5
            Top = 29
            Width = 134
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NUM_REMESSAS'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object edtNumRegRemessas: TbfdbEdit
            Left = 5
            Top = 67
            Width = 134
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NUM_REG_REM'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object edtEspecie: TbfdbEdit
            Left = 3
            Top = 105
            Width = 30
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ESP_REM'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object edtAceite: TbfdbEdit
            Left = 85
            Top = 105
            Width = 17
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ACEI_REM'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object edtInstrucao1: TbfdbEdit
            Left = 146
            Top = 28
            Width = 134
            Height = 21
            CharCase = ecUpperCase
            DataField = 'INSTRUCAO1'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object edtInstrucao2: TbfdbEdit
            Left = 146
            Top = 68
            Width = 134
            Height = 21
            CharCase = ecUpperCase
            DataField = 'INSTRUCAO2'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
        end
        object edtDVAgenciaConta: TbfdbEdit
          Left = 281
          Top = 264
          Width = 17
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DV_AGENCIA_CONTA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object edtBancoCod: TbfdbEditButton
          Left = 4
          Top = 70
          Width = 73
          Height = 21
          AutoSize = False
          DataField = 'COD_BANCO'
          DataSource = ds
          TabOrder = 2
          OnChange = edtBancoCodChange
          OnDblClick = edtBancoCodButtonClick
          OnExit = edtBancoCodExit
          NumGlyphs = 1
          Text = 'edtBancoCod'
          OnButtonClick = edtBancoCodButtonClick
        end
        object edtNomeBanco: TbfdbEdit
          Left = 80
          Top = 70
          Width = 400
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'BANCO_NOME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object ckbInativo: TDBCheckBox
          Left = 621
          Top = 12
          Width = 55
          Height = 17
          TabStop = False
          Caption = 'Inativo'
          DataField = 'INATIVO'
          DataSource = ds
          TabOrder = 15
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  object btSai: TBitBtn
    Left = 595
    Top = 447
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
    Left = 504
    Top = 447
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
    Left = 320
    Top = 136
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
    object cdsNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 100
    end
    object cdsCOD_BANCO: TStringField
      DisplayLabel = 'C'#243'd.Banco'
      FieldName = 'COD_BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsTIPO_CARTEIRA: TStringField
      DisplayLabel = 'Tipo Carteira'
      FieldName = 'TIPO_CARTEIRA'
    end
    object cdsTIPO_MOEDA: TStringField
      DisplayLabel = 'Tipo Moeda'
      FieldName = 'TIPO_MOEDA'
      FixedChar = True
    end
    object cdsNUM_CONTA_COMP: TStringField
      DisplayLabel = 'N'#250'mero Conta Comp.'
      FieldName = 'NUM_CONTA_COMP'
    end
    object cdsCOD_AGENCIA: TStringField
      DisplayLabel = 'C'#243'd.Ag'#234'ncia'
      FieldName = 'COD_AGENCIA'
    end
    object cdsNUM_CONTA_CORR: TStringField
      DisplayLabel = 'N'#250'mero Conta Corrente'
      FieldName = 'NUM_CONTA_CORR'
    end
    object cdsCOD_CONVENIO_LD: TIntegerField
      DisplayLabel = 'C'#243'd.Conv'#234'nio LD'
      FieldName = 'COD_CONVENIO_LD'
    end
    object cdsVARIACAO: TIntegerField
      DisplayLabel = 'Varia'#231#227'o'
      FieldName = 'VARIACAO'
    end
    object cdsNUM_REMESSAS: TIntegerField
      DisplayLabel = 'Num.Remessas'
      FieldName = 'NUM_REMESSAS'
    end
    object cdsNUM_REG_REM: TIntegerField
      DisplayLabel = 'Num.Registro Remessas'
      FieldName = 'NUM_REG_REM'
    end
    object cdsMENSAGEM1: TStringField
      DisplayLabel = 'Mensagem1'
      FieldName = 'MENSAGEM1'
      Size = 60
    end
    object cdsMENSAGEM2: TStringField
      DisplayLabel = 'Mensagem2'
      FieldName = 'MENSAGEM2'
      Size = 60
    end
    object cdsESP_REM: TStringField
      DisplayLabel = 'Esp.Remessa'
      FieldName = 'ESP_REM'
      Size = 2
    end
    object cdsACEI_REM: TStringField
      DisplayLabel = 'Acei.Remessa'
      FieldName = 'ACEI_REM'
      FixedChar = True
      Size = 1
    end
    object cdsINSTRUCAO1: TIntegerField
      DisplayLabel = 'Instru'#231#227'o1'
      FieldName = 'INSTRUCAO1'
    end
    object cdsINSTRUCAO2: TIntegerField
      DisplayLabel = 'Instru'#231#227'o'
      FieldName = 'INSTRUCAO2'
    end
    object cdsULT_CHEQUE: TStringField
      DisplayLabel = 'Ult.Cheque'
      FieldName = 'ULT_CHEQUE'
    end
    object cdsCOD_CONTABIL: TIntegerField
      DisplayLabel = 'Cod.Contabil'
      FieldName = 'COD_CONTABIL'
    end
    object cdsENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdsBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsCOD_CIDADE: TIntegerField
      DisplayLabel = 'C'#243'd.Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsCEP: TIntegerField
      FieldName = 'CEP'
    end
    object cdsFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Size = 30
    end
    object cdsCAIXA_BANCO: TStringField
      DisplayLabel = 'Caixa Banco'
      FieldName = 'CAIXA_BANCO'
      FixedChar = True
      Size = 1
    end
    object cdsLOCAL_COB: TStringField
      DisplayLabel = 'Local de Cobran'#231'a'
      FieldName = 'LOCAL_COB'
      FixedChar = True
      Size = 1
    end
    object cdsPASTA_REM: TStringField
      DisplayLabel = 'Pasta Remessa'
      FieldName = 'PASTA_REM'
      Size = 100
    end
    object cdsPASTA_RET: TStringField
      DisplayLabel = 'Pasta Retorno'
      FieldName = 'PASTA_RET'
      Size = 100
    end
    object cdsNUM_RETORNO: TIntegerField
      DisplayLabel = 'N'#250'mero Retorno'
      FieldName = 'NUM_RETORNO'
    end
    object cdsDV_AGENCIA_CONTA: TStringField
      DisplayLabel = 'DV.Ag'#234'ncia Conta'
      FieldName = 'DV_AGENCIA_CONTA'
      FixedChar = True
      Size = 1
    end
    object cdsCOD_CENTRO_CUSTO: TIntegerField
      DisplayLabel = 'C'#243'd.Centro de Custo'
      FieldName = 'COD_CENTRO_CUSTO'
    end
    object cdsVLR_LIMITE_CRED: TFMTBCDField
      DisplayLabel = 'Vlr.Limite Cr'#233'dito'
      FieldName = 'VLR_LIMITE_CRED'
      Precision = 18
    end
    object cdsSALDO_COMPENSAR: TFMTBCDField
      DisplayLabel = 'Saldo Compensar'
      FieldName = 'SALDO_COMPENSAR'
      Precision = 18
    end
    object cdsVLR_PRE_DATADO: TFMTBCDField
      DisplayLabel = 'Vlr.Pr'#233' Datado'
      FieldName = 'VLR_PRE_DATADO'
      Precision = 18
    end
    object cdsDT_ULT_MOV: TSQLTimeStampField
      DisplayLabel = 'Dt.Ult. Mov.'
      FieldName = 'DT_ULT_MOV'
    end
    object cdsSALDO: TFMTBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      Precision = 18
    end
    object cdsCOD_CAIXA_ANTIGO: TIntegerField
      DisplayLabel = 'C'#243'd.Caixa Antigo'
      FieldName = 'COD_CAIXA_ANTIGO'
    end
    object cdsDIAS_CRED: TIntegerField
      DisplayLabel = 'Dias Cr'#233'dito'
      FieldName = 'DIAS_CRED'
    end
    object cdsDESATIVADO: TStringField
      DisplayLabel = 'Desativado'
      FieldName = 'DESATIVADO'
      FixedChar = True
      Size = 1
    end
    object cdsCHEQUE_FORM_CONT: TStringField
      DisplayLabel = 'Cheque Form. Cont.'
      FieldName = 'CHEQUE_FORM_CONT'
      FixedChar = True
      Size = 1
    end
    object cdsDT_INCLUI: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
    end
    object cdsBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object cdsNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Size = 30
    end
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 288
    Top = 184
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from SGD_LOCAIS_COBRANCA')
    Left = 288
    Top = 136
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
    object qrNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qrCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qrTIPO_CARTEIRA: TStringField
      FieldName = 'TIPO_CARTEIRA'
    end
    object qrTIPO_MOEDA: TStringField
      FieldName = 'TIPO_MOEDA'
      FixedChar = True
    end
    object qrNUM_CONTA_COMP: TStringField
      FieldName = 'NUM_CONTA_COMP'
    end
    object qrCOD_AGENCIA: TStringField
      FieldName = 'COD_AGENCIA'
    end
    object qrNUM_CONTA_CORR: TStringField
      FieldName = 'NUM_CONTA_CORR'
    end
    object qrCOD_CONVENIO_LD: TIntegerField
      FieldName = 'COD_CONVENIO_LD'
    end
    object qrVARIACAO: TIntegerField
      FieldName = 'VARIACAO'
    end
    object qrNUM_REMESSAS: TIntegerField
      FieldName = 'NUM_REMESSAS'
    end
    object qrNUM_REG_REM: TIntegerField
      FieldName = 'NUM_REG_REM'
    end
    object qrMENSAGEM1: TStringField
      FieldName = 'MENSAGEM1'
      Size = 60
    end
    object qrMENSAGEM2: TStringField
      FieldName = 'MENSAGEM2'
      Size = 60
    end
    object qrESP_REM: TStringField
      FieldName = 'ESP_REM'
      Size = 2
    end
    object qrACEI_REM: TStringField
      FieldName = 'ACEI_REM'
      FixedChar = True
      Size = 1
    end
    object qrINSTRUCAO1: TIntegerField
      FieldName = 'INSTRUCAO1'
    end
    object qrINSTRUCAO2: TIntegerField
      FieldName = 'INSTRUCAO2'
    end
    object qrULT_CHEQUE: TStringField
      FieldName = 'ULT_CHEQUE'
    end
    object qrCOD_CONTABIL: TIntegerField
      FieldName = 'COD_CONTABIL'
    end
    object qrENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object qrBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qrCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object qrUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qrCEP: TIntegerField
      FieldName = 'CEP'
    end
    object qrFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object qrCAIXA_BANCO: TStringField
      FieldName = 'CAIXA_BANCO'
      FixedChar = True
      Size = 1
    end
    object qrLOCAL_COB: TStringField
      FieldName = 'LOCAL_COB'
      FixedChar = True
      Size = 1
    end
    object qrPASTA_REM: TStringField
      FieldName = 'PASTA_REM'
      Size = 100
    end
    object qrPASTA_RET: TStringField
      FieldName = 'PASTA_RET'
      Size = 100
    end
    object qrNUM_RETORNO: TIntegerField
      FieldName = 'NUM_RETORNO'
    end
    object qrDV_AGENCIA_CONTA: TStringField
      FieldName = 'DV_AGENCIA_CONTA'
      FixedChar = True
      Size = 1
    end
    object qrCOD_CENTRO_CUSTO: TIntegerField
      FieldName = 'COD_CENTRO_CUSTO'
    end
    object qrVLR_LIMITE_CRED: TFMTBCDField
      FieldName = 'VLR_LIMITE_CRED'
      Precision = 18
    end
    object qrSALDO_COMPENSAR: TFMTBCDField
      FieldName = 'SALDO_COMPENSAR'
      Precision = 18
    end
    object qrVLR_PRE_DATADO: TFMTBCDField
      FieldName = 'VLR_PRE_DATADO'
      Precision = 18
    end
    object qrDT_ULT_MOV: TSQLTimeStampField
      FieldName = 'DT_ULT_MOV'
    end
    object qrSALDO: TFMTBCDField
      FieldName = 'SALDO'
      Precision = 18
    end
    object qrCOD_CAIXA_ANTIGO: TIntegerField
      FieldName = 'COD_CAIXA_ANTIGO'
    end
    object qrDIAS_CRED: TIntegerField
      FieldName = 'DIAS_CRED'
    end
    object qrDESATIVADO: TStringField
      FieldName = 'DESATIVADO'
      FixedChar = True
      Size = 1
    end
    object qrCHEQUE_FORM_CONT: TStringField
      FieldName = 'CHEQUE_FORM_CONT'
      FixedChar = True
      Size = 1
    end
    object qrDT_INCLUI: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
    end
    object qrBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
      ProviderFlags = []
      Size = 100
    end
    object qrINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object qrNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Size = 30
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 320
    Top = 184
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
    Top = 160
  end
end
