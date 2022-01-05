object fmSGD_AcessoS: TfmSGD_AcessoS
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'SGD003 | Acessos'
  ClientHeight = 391
  ClientWidth = 729
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
    729
    391)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 729
    Height = 391
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      OnShow = tsConsultaShow
      DesignSize = (
        721
        363)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 721
        Height = 332
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Consulta'
        TabOrder = 0
        object Label6: TLabel
          Left = 320
          Top = 7
          Width = 63
          Height = 13
          Caption = 'Observa'#231#245'es'
          Visible = False
        end
        object btConsulta: TBitBtn
          Left = 626
          Top = 21
          Width = 88
          Height = 21
          Caption = 'Consultar'
          TabOrder = 3
          OnClick = btConsultaClick
        end
        object dbgConsulta: TbfdbGrid
          Left = 2
          Top = 42
          Width = 717
          Height = 288
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
          OnKeyDown = dbgConsultaKeyDown
          OnKeyPress = dbgConsultaKeyPress
          SairComEnter = False
          Columns = <
            item
              Expanded = False
              FieldName = 'ACESSO'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 211
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODULO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODULO_NOME'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRUPOMENU'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRUPO_NOME'
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOSTRAMENU'
              Width = 34
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 4
          Top = 19
          Width = 77
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsultaOBS: TbfEdit
          Left = 320
          Top = 20
          Width = 300
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
          Visible = False
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsultaNome: TbfEdit
          Left = 82
          Top = 19
          Width = 211
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
        Left = 447
        Top = 335
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Visualizar'
        TabOrder = 2
        OnClick = btIncluiClick
      end
      object btTransporta: TBitBtn
        Left = 355
        Top = 335
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
        Top = 335
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
        721
        363)
      object btSalva: TBitBtn
        Left = 356
        Top = 335
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
        Left = 447
        Top = 335
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
        Top = 335
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
        Width = 721
        Height = 333
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cadastro'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 34
          Height = 13
          Caption = 'Acesso'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 16
          Top = 104
          Width = 34
          Height = 13
          Caption = 'M'#243'dulo'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 16
          Top = 144
          Width = 29
          Height = 13
          Caption = 'Grupo'
          FocusControl = DBEdit5
        end
        object Label7: TLabel
          Left = 16
          Top = 184
          Width = 26
          Height = 13
          Caption = 'Menu'
        end
        object Label4: TLabel
          Left = 16
          Top = 224
          Width = 76
          Height = 13
          Caption = 'Palavras-Chave'
          Visible = False
        end
        object DBEdit1: TbfdbEdit
          Left = 16
          Top = 40
          Width = 89
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ACESSO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit2: TbfdbEdit
          Left = 16
          Top = 80
          Width = 585
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
        object DBEdit3: TbfdbEditButton
          Left = 16
          Top = 120
          Width = 71
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'MODULO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = DBEdit3Change
          OnDblClick = DBEdit3ButtonClick
          OnExit = DBEdit3Exit
          ClickKey = 122
          NumGlyphs = 1
          Text = 'DBEDIT3'
          OnButtonClick = DBEdit3ButtonClick
        end
        object DBEdit4: TbfdbEdit
          Left = 89
          Top = 120
          Width = 515
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'MODULO_NOME'
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
        object DBEdit5: TbfdbEditButton
          Left = 16
          Top = 160
          Width = 71
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'GRUPOMENU'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = DBEdit5Change
          OnDblClick = DBEdit5ButtonClick
          OnExit = DBEdit5Exit
          ClickKey = 122
          NumGlyphs = 1
          Text = 'DBEDIT5'
          OnButtonClick = DBEdit5ButtonClick
        end
        object DBEdit6: TbfdbEdit
          Left = 89
          Top = 160
          Width = 515
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'GRUPO_NOME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object bfdbComboBox1: TbfdbComboBox
          Left = 16
          Top = 200
          Width = 53
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'MOSTRAMENU'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            'S'
            'N')
          ParentFont = False
          TabOrder = 6
        end
        object bfdbMemo1: TbfdbMemo
          Left = 16
          Top = 240
          Width = 377
          Height = 89
          DataField = 'OBS'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          TabOrder = 7
          Visible = False
        end
      end
    end
  end
  object btSai: TBitBtn
    Left = 633
    Top = 359
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
    Left = 542
    Top = 359
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
    OnPostError = cdsPostError
    Left = 336
    Top = 96
    object cdsACESSO: TStringField
      DisplayLabel = 'Acesso'
      FieldName = 'ACESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object cdsNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 100
    end
    object cdsMODULO: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'MODULO'
      Size = 30
    end
    object cdsMODULO_NOME: TStringField
      DisplayLabel = 'Descri'#231#227'o M'#243'dulo'
      FieldName = 'MODULO_NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsGRUPOMENU: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPOMENU'
    end
    object cdsGRUPO_NOME: TStringField
      DisplayLabel = 'Descri'#231#227'o Grupo'
      FieldName = 'GRUPO_NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsMOSTRAMENU: TStringField
      DisplayLabel = 'Menu'
      FieldName = 'MOSTRAMENU'
      FixedChar = True
      Size = 1
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
    object cdsOBS: TStringField
      FieldName = 'OBS'
      Size = 500
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
      'select a.*, m.nome MODULO_NOME, g.nome GRUPO_NOME'
      'from SGD_ACESSOS a'
      'left join sgd_modulos m on m.modulo = a.modulo'
      'left join sgd_grupomenu g on g.id = a.grupomenu')
    Left = 336
    Top = 136
    object qrACESSO: TStringField
      FieldName = 'ACESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object qrNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qrMODULO: TStringField
      FieldName = 'MODULO'
      Size = 30
    end
    object qrGRUPOMENU: TIntegerField
      FieldName = 'GRUPOMENU'
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
    object qrMOSTRAMENU: TStringField
      FieldName = 'MOSTRAMENU'
      FixedChar = True
      Size = 1
    end
    object qrMODULO_NOME: TStringField
      FieldName = 'MODULO_NOME'
      ProviderFlags = []
      Size = 100
    end
    object qrGRUPO_NOME: TStringField
      FieldName = 'GRUPO_NOME'
      ProviderFlags = []
      Size = 100
    end
    object qrOBS: TStringField
      FieldName = 'OBS'
      Size = 500
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 376
    Top = 136
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
    Top = 112
  end
end
