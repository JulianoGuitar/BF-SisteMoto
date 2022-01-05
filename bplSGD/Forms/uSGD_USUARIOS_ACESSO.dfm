object fmSGD_USUARIOS_ACESSO: TfmSGD_USUARIOS_ACESSO
  Left = 0
  Top = 0
  Caption = 'SGD010 | Controle de Acesso'
  ClientHeight = 282
  ClientWidth = 708
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
    708
    282)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 708
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
        700
        254)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 700
        Height = 223
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Consulta'
        TabOrder = 0
        object btConsulta: TBitBtn
          Left = 608
          Top = 29
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
          Top = 51
          Width = 696
          Height = 170
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
              FieldName = 'USUARIO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACESSO'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACESSO_NOME'
              Width = 307
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODULO'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EXC'
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 3
          Top = 29
          Width = 91
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnClick = edtConsultaClick
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsAcesso: TbfEdit
          Left = 95
          Top = 29
          Width = 59
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
          OnClick = edtConsultaClick
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsDescricao: TbfEdit
          Left = 155
          Top = 29
          Width = 307
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
          OnClick = edtConsultaClick
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsModulo: TbfEdit
          Left = 463
          Top = 29
          Width = 47
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 5
          OnClick = edtConsultaClick
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
      end
      object btEditar: TBitBtn
        Left = 426
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
        Left = 334
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
        700
        254)
      object btSalva: TBitBtn
        Left = 335
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
        Left = 426
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
        Width = 700
        Height = 224
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cadastro'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 72
          Width = 34
          Height = 13
          Caption = 'Acesso'
          FocusControl = edtAcesso
        end
        object Label3: TLabel
          Left = 16
          Top = 112
          Width = 34
          Height = 13
          Caption = 'M'#243'dulo'
        end
        object Label5: TLabel
          Left = 16
          Top = 152
          Width = 29
          Height = 13
          Caption = 'Grupo'
        end
        object Label4: TLabel
          Left = 16
          Top = 32
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
          FocusControl = edtUsuario
        end
        object Label6: TLabel
          Left = 114
          Top = 72
          Width = 44
          Height = 13
          Caption = 'Cadastro'
        end
        object Label8: TLabel
          Left = 168
          Top = 72
          Width = 40
          Height = 13
          Caption = 'Inclus'#227'o'
        end
        object Label9: TLabel
          Left = 221
          Top = 72
          Width = 46
          Height = 13
          Caption = 'Altera'#231#227'o'
        end
        object Label10: TLabel
          Left = 277
          Top = 72
          Width = 42
          Height = 13
          Caption = 'Exclus'#227'o'
        end
        object edtAcesso: TbfdbEdit
          Left = 17
          Top = 85
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
          TabOrder = 1
          OnChange = edtAcessoChange
          OnExit = edtAcessoExit
        end
        object edtModuloNome: TbfdbEdit
          Left = 111
          Top = 128
          Width = 489
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
          TabOrder = 7
        end
        object edtGrupoNome: TbfdbEdit
          Left = 112
          Top = 171
          Width = 489
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
          TabOrder = 9
        end
        object cbxCadastro: TbfdbComboBox
          Left = 112
          Top = 85
          Width = 53
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'CAD'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'S'
            'N')
          ParentFont = False
          TabOrder = 2
        end
        object edtUsuario: TbfdbEdit
          Left = 16
          Top = 48
          Width = 145
          Height = 21
          CharCase = ecUpperCase
          DataField = 'USUARIO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cbxInclusao: TbfdbComboBox
          Left = 166
          Top = 85
          Width = 53
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'INC'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'S'
            'N')
          ParentFont = False
          TabOrder = 3
        end
        object cbxAlteracao: TbfdbComboBox
          Left = 220
          Top = 85
          Width = 53
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'ALT'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'S'
            'N')
          ParentFont = False
          TabOrder = 4
        end
        object cbxExclusao: TbfdbComboBox
          Left = 274
          Top = 85
          Width = 53
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'EXC'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'S'
            'N')
          ParentFont = False
          TabOrder = 5
        end
        object edtModuloCod: TbfdbEditButton
          Left = 16
          Top = 128
          Width = 89
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
          TabOrder = 6
          OnChange = edtModuloCodChange
          OnDblClick = edtModuloCodButtonClick
          OnExit = edtModuloCodExit
          NumGlyphs = 1
          Text = 'edtModuloCod'
          OnButtonClick = edtModuloCodButtonClick
        end
        object edtGrupoCod: TbfdbEditButton
          Left = 17
          Top = 171
          Width = 89
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
          TabOrder = 8
          OnChange = edtGrupoCodChange
          OnDblClick = edtGrupoCodButtonClick
          OnExit = edtGrupoCodExit
          NumGlyphs = 1
          Text = 'edtGrupoCod'
          OnButtonClick = edtGrupoCodButtonClick
        end
      end
    end
  end
  object btSai: TBitBtn
    Left = 612
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
    Left = 521
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
    Left = 624
    Top = 128
    object cdsACESSO: TStringField
      DisplayLabel = 'Acesso'
      FieldName = 'ACESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object cdsUSUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object cdsCAD: TStringField
      DisplayLabel = 'Cadastro'
      FieldName = 'CAD'
      FixedChar = True
      Size = 1
    end
    object cdsINC: TStringField
      DisplayLabel = 'Inclus'#227'o'
      FieldName = 'INC'
      FixedChar = True
      Size = 1
    end
    object cdsALT: TStringField
      DisplayLabel = 'Altera'#231#227'o'
      FieldName = 'ALT'
      FixedChar = True
      Size = 1
    end
    object cdsEXC: TStringField
      DisplayLabel = 'Exclus'#227'o'
      FieldName = 'EXC'
      FixedChar = True
      Size = 1
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
    object cdsMODULO: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'MODULO'
      Size = 30
    end
    object cdsGRUPOMENU: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPOMENU'
    end
    object cdsACESSO_NOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'ACESSO_NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsMODULO_NOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'MODULO_NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsGRUPO_NOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GRUPO_NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 592
    Top = 128
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select a.*, p.nome acesso_nome, m.nome MODULO_NOME, g.nome GRUPO' +
        '_NOME'
      'from SGD_USUARIOS_ACESSO a'
      'left join sgd_modulos m on m.modulo = a.modulo'
      'left join sgd_grupomenu g on g.id = a.grupomenu'
      'left join sgd_acessos p on p.acesso = a.acesso')
    Left = 440
    Top = 120
    object qrUSUARIO: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object qrACESSO: TStringField
      FieldName = 'ACESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object qrCAD: TStringField
      FieldName = 'CAD'
      FixedChar = True
      Size = 1
    end
    object qrINC: TStringField
      FieldName = 'INC'
      FixedChar = True
      Size = 1
    end
    object qrALT: TStringField
      FieldName = 'ALT'
      FixedChar = True
      Size = 1
    end
    object qrEXC: TStringField
      FieldName = 'EXC'
      FixedChar = True
      Size = 1
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
    object qrMODULO: TStringField
      FieldName = 'MODULO'
      Size = 30
    end
    object qrGRUPOMENU: TIntegerField
      FieldName = 'GRUPOMENU'
    end
    object qrACESSO_NOME: TStringField
      FieldName = 'ACESSO_NOME'
      ProviderFlags = []
      Size = 100
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
  end
  object ds: TDataSource
    DataSet = cds
    Left = 552
    Top = 128
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
    Left = 192
    Top = 168
  end
  object qrApoio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 400
    Top = 120
    object StringField1: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'ACESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object StringField3: TStringField
      FieldName = 'CAD'
      FixedChar = True
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'INC'
      FixedChar = True
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'ALT'
      FixedChar = True
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'EXC'
      FixedChar = True
      Size = 1
    end
    object StringField7: TStringField
      FieldName = 'USU_INCLUI'
      Size = 30
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
    end
    object StringField8: TStringField
      FieldName = 'USU_ALTERA'
      Size = 30
    end
    object SQLTimeStampField2: TSQLTimeStampField
      FieldName = 'DT_ALTERA'
    end
    object StringField9: TStringField
      FieldName = 'IDALT'
      Size = 100
    end
    object StringField10: TStringField
      FieldName = 'IDALTERADO'
      Size = 100
    end
    object StringField11: TStringField
      FieldName = 'MODULO'
      Size = 30
    end
    object IntegerField1: TIntegerField
      FieldName = 'GRUPOMENU'
    end
    object StringField12: TStringField
      FieldName = 'ACESSO_NOME'
      ProviderFlags = []
      Size = 100
    end
    object StringField13: TStringField
      FieldName = 'MODULO_NOME'
      ProviderFlags = []
      Size = 100
    end
    object StringField14: TStringField
      FieldName = 'GRUPO_NOME'
      ProviderFlags = []
      Size = 100
    end
  end
end
