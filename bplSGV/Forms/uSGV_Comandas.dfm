object fmSGV_COMANDAS: TfmSGV_COMANDAS
  Left = 296
  Top = 183
  BorderStyle = bsSingle
  Caption = 'SGV002 | Comandas'
  ClientHeight = 380
  ClientWidth = 660
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
    660
    380)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 660
    Height = 380
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      OnShow = tsConsultaShow
      DesignSize = (
        652
        352)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 652
        Height = 321
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Consulta'
        TabOrder = 0
        object btConsulta: TBitBtn
          Left = 558
          Top = 12
          Width = 88
          Height = 21
          Caption = 'Consultar'
          TabOrder = 2
          OnClick = btConsultaClick
        end
        object dbgConsulta: TbfdbGrid
          Left = 2
          Top = 36
          Width = 648
          Height = 283
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
              FieldName = 'COMANDA'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_CLIENTE'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLIENTE'
              Width = 195
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USU_INCLUI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_INCLUI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USU_ALTERA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_ALTERA'
              Visible = True
            end>
        end
        object edtConsultaNOME: TbfEdit
          Left = 66
          Top = 14
          Width = 130
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = edtConsultaCodChange
          OnKeyDown = edtConsultaCodKeyDown
          OnKeyPress = edtConsultaCodKeyPress
          SairComEnter = False
        end
        object edtConsComanda: TbfEdit
          Left = 2
          Top = 14
          Width = 63
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaCodChange
          OnKeyDown = edtConsultaCodKeyDown
          OnKeyPress = edtConsultaCodKeyPress
          SairComEnter = False
        end
        object ckbAbertasCons: TCheckBox
          Left = 424
          Top = 14
          Width = 61
          Height = 17
          Caption = 'Abertas'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = btConsultaClick
        end
      end
      object btEditar: TBitBtn
        Left = 378
        Top = 324
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Visualizar'
        TabOrder = 2
        OnClick = btIncluiClick
      end
      object btTransporta: TBitBtn
        Left = 287
        Top = 324
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
        Left = 136
        Top = 324
        Width = 110
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Relat'#243'rio'
        TabOrder = 3
        Visible = False
        OnClick = btImprimeClick
      end
      object btFecharComanda: TBitBtn
        Left = 9
        Top = 324
        Width = 110
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Fechar Comanda'
        TabOrder = 4
        OnClick = btFecharComandaClick
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      DesignSize = (
        652
        352)
      object btSalva: TBitBtn
        Left = 287
        Top = 324
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
        Left = 378
        Top = 324
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
        Top = 324
        Width = 91
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'E&xcluir!'
        Enabled = False
        TabOrder = 1
        TabStop = False
        Visible = False
        OnClick = btExcluiClick
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 652
        Height = 322
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cadastro'
        TabOrder = 0
        object Label2: TLabel
          Left = 97
          Top = 17
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = edtCliente
        end
        object Label3: TLabel
          Left = 11
          Top = 18
          Width = 45
          Height = 13
          Caption = 'Comanda'
          FocusControl = edtComanda
        end
        object Label4: TLabel
          Left = 11
          Top = 84
          Width = 33
          Height = 13
          Caption = 'Cliente'
        end
        object edtCliente: TbfdbEdit
          Left = 95
          Top = 31
          Width = 353
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
        object edtComanda: TbfdbEdit
          Left = 11
          Top = 31
          Width = 80
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMANDA'
          DataSource = ds
          TabOrder = 0
          OnExit = edtComandaExit
        end
        object edtNomeCli: TbfdbEdit
          Left = 85
          Top = 99
          Width = 364
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'NOME_CLIENTE'
          DataSource = ds
          ReadOnly = True
          TabOrder = 3
        end
        object edtCodCli: TbfdbEditButton
          Left = 11
          Top = 99
          Width = 71
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'ID_CLIENTE'
          DataSource = ds
          TabOrder = 2
          OnChange = edtCodCliChange
          OnDblClick = edtCodCliButtonClick
          OnExit = edtCodCliExit
          NumGlyphs = 1
          Text = 'edtCodCli'
          OnButtonClick = edtCodCliButtonClick
        end
        object DBCheckBox1: TDBCheckBox
          Left = 14
          Top = 144
          Width = 72
          Height = 17
          TabStop = False
          Caption = 'Associado'
          DataField = 'SOCIO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  object btSai: TBitBtn
    Left = 564
    Top = 348
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
    Left = 473
    Top = 348
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
    Left = 448
    Top = 65527
    object cdsID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object cdsCOMANDA: TIntegerField
      DisplayLabel = 'Comanda'
      FieldName = 'COMANDA'
      Required = True
    end
    object cdsNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 200
    end
    object cdsID_CLIENTE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'd.Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object cdsFECHADA: TStringField
      DisplayLabel = 'Fechada'
      FieldName = 'FECHADA'
      FixedChar = True
      Size = 1
    end
    object cdsTOTAL: TFMTBCDField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 8
    end
    object cdsNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = []
      Size = 100
    end
    object cdsSOCIO: TStringField
      DisplayLabel = 'Associado'
      FieldName = 'SOCIO'
      Size = 1
    end
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 480
    Top = 65527
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select c.*, p.nome NOME_CLIENTE'
      ' from SGV_COMANDAS c'
      ' left join sgc_participantes p on p.id = c.id_cliente'
      ''
      ''
      ' where c.ID > 0')
    Left = 528
    Top = 65527
    object qrID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object qrCOMANDA: TIntegerField
      FieldName = 'COMANDA'
      Required = True
    end
    object qrNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 200
    end
    object qrID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object qrFECHADA: TStringField
      FieldName = 'FECHADA'
      FixedChar = True
      Size = 1
    end
    object qrTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 18
      Size = 8
    end
    object qrNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = []
      Size = 100
    end
    object qrSOCIO: TStringField
      FieldName = 'SOCIO'
      Size = 1
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
    Left = 400
    Top = 65518
  end
end
