object fmSGC_PRODUTOS: TfmSGC_PRODUTOS
  Left = 186
  Top = 62
  BorderStyle = bsSingle
  Caption = 'SGC030 | Produtos'
  ClientHeight = 409
  ClientWidth = 712
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
  OnShow = FormShow
  DesignSize = (
    712
    409)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 712
    Height = 409
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      OnShow = tsConsultaShow
      DesignSize = (
        704
        381)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 704
        Height = 350
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Consulta'
        TabOrder = 0
        object btConsulta: TBitBtn
          Left = 592
          Top = 17
          Width = 88
          Height = 21
          Caption = 'Consultar'
          TabOrder = 4
          OnClick = btConsultaClick
        end
        object dbgConsulta: TbfdbGrid
          Left = 2
          Top = 40
          Width = 700
          Height = 308
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
              FieldName = 'COD_PROD'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADE'
              Width = 16
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUSTO_REP'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_FAMILIA'
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_GRUPO'
              Width = 223
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NCM'
              Width = 90
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 2
          Top = 18
          Width = 82
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsultaNOME: TbfEdit
          Left = 85
          Top = 18
          Width = 300
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object ckbInativoCons: TCheckBox
          Left = 497
          Top = 19
          Width = 94
          Height = 17
          Caption = 'Mostrar Inativo'
          TabOrder = 3
          OnClick = btConsultaClick
        end
        object edtConsNCM: TbfEdit
          Left = 386
          Top = 18
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
          Visible = False
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
      end
      object btEditar: TBitBtn
        Left = 430
        Top = 353
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Visualizar'
        TabOrder = 2
        OnClick = btIncluiClick
      end
      object btTransporta: TBitBtn
        Left = 339
        Top = 353
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
        Top = 353
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
        704
        381)
      object btSalva: TBitBtn
        Left = 339
        Top = 353
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
        Left = 430
        Top = 353
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
        Top = 353
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
        Width = 704
        Height = 351
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cadastro'
        TabOrder = 0
        DesignSize = (
          704
          351)
        object Label2: TLabel
          Left = 95
          Top = 17
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = edtNomeProd
        end
        object Label3: TLabel
          Left = 11
          Top = 18
          Width = 45
          Height = 13
          Caption = 'C'#243'd.Prod'
          FocusControl = edtCodProd
        end
        object Label4: TLabel
          Left = 11
          Top = 55
          Width = 43
          Height = 13
          Caption = 'ID Grupo'
        end
        object Label5: TLabel
          Left = 460
          Top = 18
          Width = 39
          Height = 13
          Caption = 'Unidade'
        end
        object Label6: TLabel
          Left = 11
          Top = 89
          Width = 53
          Height = 13
          Caption = 'ID Parceiro'
        end
        object Label7: TLabel
          Left = 85
          Top = 89
          Width = 39
          Height = 13
          Caption = 'Parceiro'
          FocusControl = edtNomeFamilia
        end
        object Label8: TLabel
          Left = 85
          Top = 55
          Width = 29
          Height = 13
          Caption = 'Grupo'
          FocusControl = edtNomeGrupo
        end
        object Label9: TLabel
          Left = 341
          Top = 54
          Width = 42
          Height = 13
          Caption = 'Ref. Fab'
          FocusControl = edtRefFab
          Visible = False
        end
        object Label12: TLabel
          Left = 341
          Top = 88
          Width = 56
          Height = 13
          Caption = 'Local Almox'
          FocusControl = edtLocalAlmox
          Visible = False
        end
        object Label1: TLabel
          Left = 11
          Top = 125
          Width = 51
          Height = 13
          Caption = 'Fabricante'
          FocusControl = edtFabricante
        end
        object Label19: TLabel
          Left = 12
          Top = 171
          Width = 27
          Height = 13
          Caption = 'Pre'#231'o'
          FocusControl = bfdbEdit1
        end
        object Label23: TLabel
          Left = 12
          Top = 211
          Width = 86
          Height = 13
          Caption = 'Pre'#231'o (Associado)'
          FocusControl = bfdbEdit2
        end
        object Label24: TLabel
          Left = 12
          Top = 251
          Width = 85
          Height = 13
          Caption = 'Pre'#231'o (Promo'#231#227'o)'
          FocusControl = bfdbEdit3
        end
        object edtNomeProd: TbfdbEdit
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
        object ckbInativo: TDBCheckBox
          Left = 626
          Top = 15
          Width = 54
          Height = 17
          TabStop = False
          Caption = 'Inativo'
          DataField = 'INATIVO'
          DataSource = ds
          TabOrder = 13
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object edtCodProd: TbfdbEdit
          Left = 11
          Top = 31
          Width = 80
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COD_PROD'
          DataSource = ds
          TabOrder = 0
        end
        object edtNomeFamilia: TbfdbEdit
          Left = 85
          Top = 101
          Width = 250
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'NOME_FAMILIA'
          DataSource = ds
          ReadOnly = True
          TabOrder = 7
        end
        object edtNomeGrupo: TbfdbEdit
          Left = 85
          Top = 67
          Width = 250
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'NOME_GRUPO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 4
        end
        object edtRefFab: TbfdbEdit
          Left = 341
          Top = 67
          Width = 200
          Height = 21
          CharCase = ecUpperCase
          DataField = 'REF_FAB'
          DataSource = ds
          TabOrder = 5
          Visible = False
        end
        object edtLocalAlmox: TbfdbEdit
          Left = 341
          Top = 101
          Width = 250
          Height = 21
          CharCase = ecUpperCase
          DataField = 'LOCAL_ALMOX'
          DataSource = ds
          TabOrder = 8
          Visible = False
        end
        object pgcDados: TPageControl
          Left = 11
          Top = 312
          Width = 696
          Height = 181
          ActivePage = tbTributacao
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 14
          Visible = False
          object tbTributacao: TTabSheet
            Caption = 'Tributa'#231#227'o'
            object Label13: TLabel
              Left = 2
              Top = 3
              Width = 22
              Height = 13
              Caption = 'NCM'
              FocusControl = edtNCM
            end
            object Label14: TLabel
              Left = 110
              Top = 3
              Width = 65
              Height = 13
              Caption = 'NCM Exce'#231#227'o'
              FocusControl = edtNCMExcessao
            end
            object Label15: TLabel
              Left = 4
              Top = 44
              Width = 105
              Height = 13
              Caption = 'Origem da Mercadoria'
            end
            object Label16: TLabel
              Left = 369
              Top = 44
              Width = 60
              Height = 13
              Caption = 'Tipo do Item'
            end
            object Label17: TLabel
              Left = 4
              Top = 87
              Width = 24
              Height = 13
              Caption = 'GTIN'
              FocusControl = edtGTIN
            end
            object edtNCM: TbfdbEdit
              Left = 2
              Top = 19
              Width = 89
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NCM'
              DataSource = ds
              MaxLength = 8
              TabOrder = 0
            end
            object edtNCMExcessao: TbfdbEdit
              Left = 110
              Top = 19
              Width = 43
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NCM_EXCECAO'
              DataSource = ds
              MaxLength = 4
              TabOrder = 1
            end
            object edtGTIN: TbfdbEdit
              Left = 4
              Top = 103
              Width = 500
              Height = 21
              CharCase = ecUpperCase
              DataField = 'GTIN'
              DataSource = ds
              TabOrder = 4
            end
            object cbxOrigemMercadoria: TbfdbComboBox
              Left = 4
              Top = 60
              Width = 357
              Height = 21
              Style = csDropDownList
              CharCase = ecUpperCase
              DataField = 'ORIGEM_MERCADORIA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemHeight = 13
              Items.Strings = (
                '0 - NACIONAL, EXCETO AS INDICADAS NOS C'#211'DIGOS 3, 4, 5 E 8'
                
                  '1 - ESTRANGEIRA - IMPORTA'#199#195'O DIRETA, EXCETO A INDICADA NO C'#211'DIGO' +
                  ' 6'
                
                  '2 - ESTRANGEIRA - ADQUIRIDA NO MERCADO INTERNO, EXCETO A INDICAD' +
                  'A NO C'#211'DIGO 7'
                
                  '3 - NACIONAL, MERCADORIA OU BEM COM CONTE'#218'DO DE IMPORTA'#199#195'O SUPER' +
                  'IOR A 40% E INFERIOR OU IGUAL A 70%'
                
                  '4 - NACIONAL, CUJA PRODU'#199#195'O TENHA SIDO FEITA EM CONFORMIDADE COM' +
                  ' OS PROCESSOS PRODUTIVOS B'#193'SICOS DE QUE TRATAM O DECRETO-LEI N'#186' ' +
                  '288/67, E AS LEIS N'#186'S 8.248/91, 8.387/91, 10.176/01 E 11.484/07'
                
                  '5 - NACIONAL, MERCADORIA OU BEM COM CONTE'#218'DO DE IMPORTA'#199#195'O INFER' +
                  'IOR OU IGUAL A 40% '
                
                  '6 - ESTRANGEIRA - IMPORTA'#199#195'O DIRETA, SEM SIMILAR NACIONAL, CONST' +
                  'ANTE EM LISTA DE RESOLU'#199#195'O CAMEX'
                
                  '7 - ESTRANGEIRA - ADQUIRIDA NO MERCADO INTERNO, SEM SIMILAR NACI' +
                  'ONAL, CONSTANTE EM LISTA DE RESOLU'#199#195'O CAMEX'
                
                  '8 - NACIONAL, MERCADORIA OU BEM COM CONTE'#218'DO DE IMPORTA'#199#195'O SUPER' +
                  'IOR A 70% (SETENTA POR CENTO). (AJUSTE SINIEF 15/2013 VIG.01/08/' +
                  '2013)')
              ParentFont = False
              TabOrder = 2
            end
            object cbxTipoItem: TbfdbComboBox
              Left = 369
              Top = 60
              Width = 290
              Height = 21
              Style = csDropDownList
              CharCase = ecUpperCase
              DataField = 'TIPO_ITEM'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemHeight = 13
              Items.Strings = (
                '00 - MERCADORIA PARA REVENDA'
                '01 - MAT'#201'RIA-PRIMA'
                '02 - EMBALAGEM'
                '03 - PRODUTO EM PROCESSO'
                '04 - PRODUTO ACABADO'
                '05 - SUBPRODUTO'
                '06 - PRODUTO INTERMEDI'#193'RIO'
                '07 - MATERIAL DE USO E CONSUMO'
                '08 - ATIVO IMOBILIZADO'
                '09 - SERVI'#199'OS'
                '10 - OUTROS INSUMOS'
                '99 - OUTRAS')
              ParentFont = False
              TabOrder = 3
            end
          end
          object tbFichaTecnica: TTabSheet
            Caption = 'Ficha T'#233'cnica'
            ImageIndex = 1
            object Label18: TLabel
              Left = 4
              Top = 3
              Width = 64
              Height = 13
              Caption = 'Ficha T'#233'cnica'
            end
            object Label20: TLabel
              Left = 556
              Top = 39
              Width = 43
              Height = 13
              Caption = 'Peso Liq.'
            end
            object Label21: TLabel
              Left = 556
              Top = 80
              Width = 50
              Height = 13
              Caption = 'Peso Brut.'
            end
            object Label22: TLabel
              Left = 556
              Top = 117
              Width = 54
              Height = 13
              Caption = 'Embalagem'
            end
            object Label11: TLabel
              Left = 408
              Top = 80
              Width = 32
              Height = 13
              Caption = 'Moeda'
            end
            object Label10: TLabel
              Left = 404
              Top = 36
              Width = 54
              Height = 13
              Caption = 'Custo Rep.'
              FocusControl = edtCustoRep
            end
            object edtPesoLiq: TbfdbEdit
              Left = 556
              Top = 55
              Width = 100
              Height = 21
              DataField = 'PESO_LIQ'
              DataSource = ds
              TabOrder = 3
            end
            object edtPesoBru: TbfdbEdit
              Left = 556
              Top = 95
              Width = 100
              Height = 21
              DataField = 'PESO_BRU'
              DataSource = ds
              TabOrder = 4
            end
            object edtEmbalagem: TbfdbEdit
              Left = 556
              Top = 133
              Width = 100
              Height = 21
              DataField = 'EMBALAGEM'
              DataSource = ds
              TabOrder = 5
            end
            object memFichaTecnica: TbfdbMemo
              Left = 4
              Top = 22
              Width = 372
              Height = 126
              DataField = 'FICHA_TECNICA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              TabOrder = 0
            end
            object ckbControlePF: TDBCheckBox
              Left = 556
              Top = 9
              Width = 97
              Height = 17
              Caption = 'Controle PF'
              DataField = 'CONTROLE_PF'
              DataSource = ds
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbxMoeda: TbfdbComboBox
              Left = 408
              Top = 95
              Width = 93
              Height = 21
              Style = csDropDownList
              CharCase = ecUpperCase
              DataField = 'MOEDA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemHeight = 13
              Items.Strings = (
                'REAL'
                'DOLAR'
                'EURO')
              ParentFont = False
              TabOrder = 1
            end
            object edtCustoRep: TbfdbEdit
              Left = 404
              Top = 52
              Width = 100
              Height = 21
              DataField = 'CUSTO_REP'
              DataSource = ds
              TabOrder = 6
            end
          end
        end
        object edtUnidade: TbfdbEditButton
          Left = 460
          Top = 31
          Width = 81
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'UNIDADE'
          DataSource = ds
          TabOrder = 2
          NumGlyphs = 1
          Text = 'edtUnidade'
          OnButtonClick = edtUnidadeButtonClick
        end
        object edtCodGrupo: TbfdbEditButton
          Left = 11
          Top = 67
          Width = 71
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'ID_GRUPO'
          DataSource = ds
          TabOrder = 3
          OnChange = edtCodGrupoChange
          OnDblClick = edtCodGrupoButtonClick
          OnExit = edtCodGrupoExit
          NumGlyphs = 1
          Text = 'edtCodGrupo'
          OnButtonClick = edtCodGrupoButtonClick
        end
        object edtCodFamilia: TbfdbEditButton
          Left = 11
          Top = 101
          Width = 72
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'ID_FAMILIA'
          DataSource = ds
          TabOrder = 6
          OnChange = edtCodFamiliaChange
          OnDblClick = edtCodFamiliaButtonClick
          OnExit = edtCodFamiliaExit
          NumGlyphs = 1
          Text = 'edtCodFamilia'
          OnButtonClick = edtCodFamiliaButtonClick
        end
        object edtFabricante: TbfdbEdit
          Left = 11
          Top = 140
          Width = 325
          Height = 21
          CharCase = ecUpperCase
          DataField = 'FABRICANTE'
          DataSource = ds
          TabOrder = 9
        end
        object bfdbEdit1: TbfdbEdit
          Left = 12
          Top = 185
          Width = 100
          Height = 21
          DataField = 'PRECO'
          DataSource = ds
          TabOrder = 10
        end
        object bfdbEdit2: TbfdbEdit
          Left = 12
          Top = 225
          Width = 100
          Height = 21
          DataField = 'PRECO_SOCIO'
          DataSource = ds
          TabOrder = 11
        end
        object bfdbEdit3: TbfdbEdit
          Left = 12
          Top = 265
          Width = 100
          Height = 21
          DataField = 'PRECO_ESPECIAL'
          DataSource = ds
          TabOrder = 12
        end
      end
    end
  end
  object btSai: TBitBtn
    Left = 616
    Top = 377
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
    Left = 525
    Top = 377
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
      OnGetText = cdsIDGetText
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
    object cdsCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      Size = 30
    end
    object cdsNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 100
    end
    object cdsID_GRUPO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'ID Grupo'
      FieldName = 'ID_GRUPO'
    end
    object cdsUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 5
    end
    object cdsID_FAMILIA: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'ID Familia'
      FieldName = 'ID_FAMILIA'
    end
    object cdsREF_FAB: TStringField
      DisplayLabel = 'Ref. Fab'
      FieldName = 'REF_FAB'
      Size = 30
    end
    object cdsFABRICANTE: TStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      Size = 100
    end
    object cdsCUSTO_REP: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'CUSTO_REP'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 8
    end
    object cdsMOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'MOEDA'
      Size = 10
    end
    object cdsLOCAL_ALMOX: TStringField
      DisplayLabel = 'Local Almox'
      FieldName = 'LOCAL_ALMOX'
      Size = 100
    end
    object cdsPALAVRAS_CHAVE: TStringField
      DisplayLabel = 'Palavras-Chave'
      FieldName = 'PALAVRAS_CHAVE'
      Size = 500
    end
    object cdsNCM: TStringField
      FieldName = 'NCM'
      Size = 30
    end
    object cdsNCM_EXCESSAO: TStringField
      DisplayLabel = 'NCM Exce'#231#227'o'
      FieldName = 'NCM_EXCECAO'
      Size = 10
    end
    object cdsORIGEM_MERCADORIA: TStringField
      DisplayLabel = 'Origem da Mercadoria'
      FieldName = 'ORIGEM_MERCADORIA'
      OnGetText = cdsORIGEM_MERCADORIAGetText
      FixedChar = True
      Size = 1
    end
    object cdsTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo do Item'
      FieldName = 'TIPO_ITEM'
      OnGetText = cdsTIPO_ITEMGetText
      FixedChar = True
      Size = 2
    end
    object cdsGTIN: TStringField
      FieldName = 'GTIN'
      Size = 100
    end
    object cdsFICHA_TECNICA: TStringField
      DisplayLabel = 'Ficha T'#233'cnica'
      FieldName = 'FICHA_TECNICA'
      Size = 5000
    end
    object cdsCONTROLE_PF: TStringField
      DisplayLabel = 'Controle PF'
      FieldName = 'CONTROLE_PF'
      FixedChar = True
      Size = 1
    end
    object cdsPESO_LIQ: TFMTBCDField
      DisplayLabel = 'Peso Liq.'
      FieldName = 'PESO_LIQ'
      Required = True
      DisplayFormat = '#,####0.0000'
      Precision = 18
      Size = 8
    end
    object cdsPESO_BRU: TFMTBCDField
      DisplayLabel = 'Peso Brut.'
      FieldName = 'PESO_BRU'
      Required = True
      DisplayFormat = '#,####0.0000'
      Precision = 18
      Size = 8
    end
    object cdsEMBALAGEM: TFMTBCDField
      DisplayLabel = 'Embalagem'
      FieldName = 'EMBALAGEM'
      Required = True
      DisplayFormat = '#,####0.0000'
      Precision = 18
      Size = 8
    end
    object cdsNOME_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'NOME_GRUPO'
      ProviderFlags = []
      Size = 100
    end
    object cdsNOME_FAMILIA: TStringField
      DisplayLabel = 'Parceiro'
      FieldName = 'NOME_FAMILIA'
      ProviderFlags = []
      Size = 100
    end
    object cdsPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Required = True
      Precision = 18
      Size = 8
    end
    object cdsPRECO_SOCIO: TFMTBCDField
      FieldName = 'PRECO_SOCIO'
      Required = True
      Precision = 18
      Size = 8
    end
    object cdsPRECO_ESPECIAL: TFMTBCDField
      FieldName = 'PRECO_ESPECIAL'
      Required = True
      Precision = 18
      Size = 8
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
      ''
      
        'select p.*, f.nome NOME_FAMILIA ,g.cod_grupo || '#39' '#39' || g.sub_gru' +
        'po || '#39' '#39' || g.descricao NOME_GRUPO from SGC_PRODUTOS p left joi' +
        'n SGC_FAMILIA_PROD f on f.ID = p.ID_FAMILIA  left join SGC_UNIDA' +
        'DES u on u.UNIDADE = p.UNIDADE'
      ' left join SGC_GRUPO_PRODUTOS g on g.ID = p.ID_GRUPO')
    Left = 528
    Top = 65527
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
    object qrINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object qrCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Size = 30
    end
    object qrNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qrID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
    end
    object qrUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 5
    end
    object qrID_FAMILIA: TIntegerField
      FieldName = 'ID_FAMILIA'
    end
    object qrREF_FAB: TStringField
      FieldName = 'REF_FAB'
      Size = 30
    end
    object qrFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      Size = 100
    end
    object qrCUSTO_REP: TFMTBCDField
      FieldName = 'CUSTO_REP'
      Required = True
      Precision = 18
      Size = 8
    end
    object qrMOEDA: TStringField
      FieldName = 'MOEDA'
      Size = 10
    end
    object qrLOCAL_ALMOX: TStringField
      FieldName = 'LOCAL_ALMOX'
      Size = 100
    end
    object qrPALAVRAS_CHAVE: TStringField
      FieldName = 'PALAVRAS_CHAVE'
      Size = 500
    end
    object qrNCM: TStringField
      FieldName = 'NCM'
      Size = 30
    end
    object qrNCM_EXCESSAO: TStringField
      FieldName = 'NCM_EXCECAO'
      Size = 10
    end
    object qrORIGEM_MERCADORIA: TStringField
      FieldName = 'ORIGEM_MERCADORIA'
      FixedChar = True
      Size = 1
    end
    object qrTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 2
    end
    object qrGTIN: TStringField
      FieldName = 'GTIN'
      Size = 100
    end
    object qrFICHA_TECNICA: TStringField
      FieldName = 'FICHA_TECNICA'
      Size = 5000
    end
    object qrCONTROLE_PF: TStringField
      FieldName = 'CONTROLE_PF'
      FixedChar = True
      Size = 1
    end
    object qrPESO_LIQ: TFMTBCDField
      FieldName = 'PESO_LIQ'
      Required = True
      Precision = 18
      Size = 8
    end
    object qrPESO_BRU: TFMTBCDField
      FieldName = 'PESO_BRU'
      Required = True
      Precision = 18
      Size = 8
    end
    object qrEMBALAGEM: TFMTBCDField
      FieldName = 'EMBALAGEM'
      Required = True
      Precision = 18
      Size = 8
    end
    object qrNOME_FAMILIA: TStringField
      FieldName = 'NOME_FAMILIA'
      ProviderFlags = []
      Size = 100
    end
    object qrNOME_GRUPO: TStringField
      FieldName = 'NOME_GRUPO'
      ProviderFlags = []
      Size = 100
    end
    object qrPRECO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO'
      Required = True
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 8
    end
    object qrPRECO_SOCIO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o (S'#243'cio)'
      FieldName = 'PRECO_SOCIO'
      Required = True
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 8
    end
    object qrPRECO_ESPECIAL: TFMTBCDField
      DisplayLabel = 'Pre'#231'o Especial'
      FieldName = 'PRECO_ESPECIAL'
      Required = True
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 8
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
