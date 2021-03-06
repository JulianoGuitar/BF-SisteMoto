object fmSGC_CONFIG_EMAIL: TfmSGC_CONFIG_EMAIL
  Left = 451
  Top = 161
  Width = 758
  Height = 428
  Caption = 'SGC007 | Configura'#231#227'o de Email'
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
    742
    389)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 742
    Height = 389
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      OnShow = tsConsultaShow
      DesignSize = (
        734
        361)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 734
        Height = 330
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Consulta'
        TabOrder = 0
        object btConsulta: TBitBtn
          Left = 640
          Top = 20
          Width = 88
          Height = 21
          Caption = 'Consultar'
          TabOrder = 2
          OnClick = btConsultaClick
        end
        object dbgConsulta: TbfdbGrid
          Left = 2
          Top = 42
          Width = 730
          Height = 286
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
              FieldName = 'NOME'
              Width = 305
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNPJ'
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAIL_EMAIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UF'
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 3
          Top = 20
          Width = 306
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtCNPJCons: TbfEdit
          Left = 310
          Top = 20
          Width = 190
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object ckbInativoCons: TCheckBox
          Left = 529
          Top = 25
          Width = 94
          Height = 17
          Caption = 'Mostrar Inativo'
          TabOrder = 4
          OnClick = btConsultaClick
        end
      end
      object btEditar: TBitBtn
        Left = 460
        Top = 333
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Visualizar'
        TabOrder = 2
        OnClick = btIncluiClick
      end
      object btTransporta: TBitBtn
        Left = 369
        Top = 333
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
        Top = 333
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
        734
        361)
      object btSalva: TBitBtn
        Left = 369
        Top = 333
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Salvar'
        Enabled = False
        TabOrder = 1
        OnClick = btSalvaClick
        NumGlyphs = 2
      end
      object btDesiste: TBitBtn
        Left = 460
        Top = 333
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Desistir'
        TabOrder = 2
        OnClick = btDesisteClick
        NumGlyphs = 2
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 734
        Height = 331
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cadastro'
        TabOrder = 0
        object Label3: TLabel
          Left = 11
          Top = 20
          Width = 11
          Height = 13
          Caption = 'ID'
          FocusControl = bfdbEdit1
        end
        object Label1: TLabel
          Left = 11
          Top = 75
          Width = 28
          Height = 13
          Caption = 'E-mail'
        end
        object Label2: TLabel
          Left = 11
          Top = 115
          Width = 69
          Height = 13
          Caption = 'Servidor SMTP'
          FocusControl = edtSERV_SMTP
        end
        object Label4: TLabel
          Left = 417
          Top = 115
          Width = 55
          Height = 13
          Caption = 'Porta SMTP'
          FocusControl = edtPortSMTP
        end
        object Label5: TLabel
          Left = 11
          Top = 155
          Width = 69
          Height = 13
          Caption = 'Servidor POP3'
          FocusControl = edtedtSERV_POP3
        end
        object Label6: TLabel
          Left = 417
          Top = 156
          Width = 55
          Height = 13
          Caption = 'Porta POP3'
          FocusControl = edtPort_POP3
        end
        object Label7: TLabel
          Left = 11
          Top = 194
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
          FocusControl = edtUsuario
        end
        object Label8: TLabel
          Left = 11
          Top = 234
          Width = 30
          Height = 13
          Caption = 'Senha'
          FocusControl = edtSenha
        end
        object Label9: TLabel
          Left = 11
          Top = 273
          Width = 108
          Height = 13
          Caption = 'Confirma'#231#227'o da Senha'
          FocusControl = edtConfSenha
        end
        object Label10: TLabel
          Left = 448
          Top = 234
          Width = 63
          Height = 13
          Caption = 'Autentica'#231#227'o'
        end
        object Label11: TLabel
          Left = 448
          Top = 273
          Width = 17
          Height = 13
          Caption = 'SSL'
        end
        object bfdbEdit1: TbfdbEdit
          Left = 11
          Top = 33
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
        object edtSERV_SMTP: TbfdbEdit
          Left = 11
          Top = 128
          Width = 400
          Height = 21
          DataField = 'mail_SERV_SMTP'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object edtPortSMTP: TbfdbEdit
          Left = 417
          Top = 128
          Width = 90
          Height = 21
          DataField = 'mail_PORTA_SMTP'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtedtSERV_POP3: TbfdbEdit
          Left = 11
          Top = 168
          Width = 400
          Height = 21
          DataField = 'mail_SERV_POP3'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtPort_POP3: TbfdbEdit
          Left = 417
          Top = 168
          Width = 90
          Height = 21
          DataField = 'mail_PORTA_POP3'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object edtUsuario: TbfdbEdit
          Left = 11
          Top = 207
          Width = 400
          Height = 21
          DataField = 'mail_USUARIO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object edtSenha: TbfdbEdit
          Left = 11
          Top = 249
          Width = 150
          Height = 21
          DataField = 'mail_SENHA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 10
        end
        object edtConfSenha: TbfdbEdit
          Left = 11
          Top = 289
          Width = 150
          Height = 21
          DataField = 'mail_CONF_SENHA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 11
        end
        object cbxMAIL_AUTENTICACAO: TbfdbComboBox
          Left = 448
          Top = 249
          Width = 63
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'mail_AUTENTICACAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            'N'
            'S')
          ParentFont = False
          TabOrder = 12
        end
        object cbxMAIL_SSL: TbfdbComboBox
          Left = 448
          Top = 289
          Width = 63
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'mail_SSL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            'N'
            'S')
          ParentFont = False
          TabOrder = 13
        end
        object edtEmail: TbfdbEdit
          Left = 11
          Top = 91
          Width = 400
          Height = 21
          DataField = 'mail_EMAIL'
          DataSource = ds
          TabOrder = 4
        end
        object edtCadEmpresa: TbfdbEdit
          Left = 109
          Top = 33
          Width = 277
          Height = 21
          TabStop = False
          DataField = 'NOME'
          DataSource = ds
          ReadOnly = True
          TabOrder = 1
        end
        object edtCadCNPJ: TbfdbEdit
          Left = 391
          Top = 33
          Width = 232
          Height = 21
          TabStop = False
          DataField = 'CNPJ'
          DataSource = ds
          ReadOnly = True
          TabOrder = 2
        end
        object ckbInativo: TDBCheckBox
          Left = 668
          Top = 11
          Width = 56
          Height = 17
          Caption = 'Inativo'
          DataField = 'INATIVO'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  object btSai: TBitBtn
    Left = 646
    Top = 357
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
    Left = 555
    Top = 357
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
    Left = 480
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
      FieldName = 'COD_CONTROLE'
    end
    object cdsINSC_EST: TStringField
      FieldName = 'INSC_EST'
      Size = 30
    end
    object cdsINSC_MUN: TStringField
      FieldName = 'INSC_MUN'
      Size = 30
    end
    object cdsUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 200
    end
    object cdsNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 30
    end
    object cdsCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object cdsBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object cdsCEP: TIntegerField
      FieldName = 'CEP'
    end
    object cdsFONE: TStringField
      FieldName = 'FONE'
      Size = 100
    end
    object cdsFAX: TStringField
      FieldName = 'FAX'
      Size = 100
    end
    object cdsMAIL: TStringField
      FieldName = 'MAIL'
      Size = 100
    end
    object cdsTIPO_EMP: TIntegerField
      FieldName = 'TIPO_EMP'
    end
    object cdsCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object cdsMAIL_EMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'MAIL_EMAIL'
      Size = 100
    end
    object cdsMAIL_SERV_SMTP: TStringField
      FieldName = 'MAIL_SERV_SMTP'
      Size = 100
    end
    object cdsMAIL_PORTA_SMTP: TStringField
      FieldName = 'MAIL_PORTA_SMTP'
      Size = 30
    end
    object cdsMAIL_SERV_POP3: TStringField
      FieldName = 'MAIL_SERV_POP3'
      Size = 100
    end
    object cdsMAIL_PORTA_POP3: TStringField
      FieldName = 'MAIL_PORTA_POP3'
      Size = 30
    end
    object cdsMAIL_USUARIO: TStringField
      FieldName = 'MAIL_USUARIO'
      Size = 100
    end
    object cdsMAIL_SENHA: TStringField
      FieldName = 'MAIL_SENHA'
      Size = 30
    end
    object cdsMAIL_CONF_SENHA: TStringField
      FieldName = 'MAIL_CONF_SENHA'
      Size = 30
    end
    object cdsMAIL_AUTENTICACAO: TStringField
      FieldName = 'MAIL_AUTENTICACAO'
      FixedChar = True
      Size = 1
    end
    object cdsMAIL_SSL: TStringField
      FieldName = 'MAIL_SSL'
      FixedChar = True
      Size = 1
    end
    object cdsINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      ProviderFlags = []
      Size = 200
    end
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 232
  end
  object ds: TDataSource
    DataSet = cds
    Left = 360
    Top = 65528
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
    Top = 65520
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select e.*, c.nome nome_cidade from SGC_EMPRESAS e'
      'left join SGC_cidades c on c.id = e.cod_cidade')
    Left = 440
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
    object qrMAIL_EMAIL: TStringField
      FieldName = 'MAIL_EMAIL'
      Size = 100
    end
    object qrMAIL_SERV_SMTP: TStringField
      FieldName = 'MAIL_SERV_SMTP'
      Size = 100
    end
    object qrMAIL_PORTA_SMTP: TStringField
      FieldName = 'MAIL_PORTA_SMTP'
      Size = 30
    end
    object qrMAIL_SERV_POP3: TStringField
      FieldName = 'MAIL_SERV_POP3'
      Size = 100
    end
    object qrMAIL_PORTA_POP3: TStringField
      FieldName = 'MAIL_PORTA_POP3'
      Size = 30
    end
    object qrMAIL_USUARIO: TStringField
      FieldName = 'MAIL_USUARIO'
      Size = 100
    end
    object qrMAIL_SENHA: TStringField
      FieldName = 'MAIL_SENHA'
      Size = 30
    end
    object qrMAIL_CONF_SENHA: TStringField
      FieldName = 'MAIL_CONF_SENHA'
      Size = 30
    end
    object qrMAIL_AUTENTICACAO: TStringField
      FieldName = 'MAIL_AUTENTICACAO'
      FixedChar = True
      Size = 1
    end
    object qrMAIL_SSL: TStringField
      FieldName = 'MAIL_SSL'
      FixedChar = True
      Size = 1
    end
    object qrINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object qrNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      ProviderFlags = []
      Size = 200
    end
  end
end
