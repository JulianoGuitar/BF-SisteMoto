object fmSGC_TRANSPORTADORAS: TfmSGC_TRANSPORTADORAS
  Left = 0
  Top = 0
  Width = 748
  Height = 622
  Caption = 'SGC019 | Transportadoras'
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
    732
    583)
  PixelsPerInch = 96
  TextHeight = 13
  object Label24: TLabel
    Left = 214
    Top = 333
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 732
    Height = 583
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      OnShow = tsConsultaShow
      DesignSize = (
        724
        555)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 724
        Height = 524
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Consulta'
        TabOrder = 0
        object btConsulta: TBitBtn
          Left = 630
          Top = 9
          Width = 88
          Height = 21
          Caption = 'Consultar'
          TabOrder = 6
          OnClick = btConsultaClick
        end
        object dbgConsulta: TbfdbGrid
          Left = 2
          Top = 54
          Width = 720
          Height = 493
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 7
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
              Width = 21
              Visible = True
            end>
        end
        object edtConsulta: TbfEdit
          Left = 50
          Top = 32
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
          Top = 32
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
          Top = 11
          Width = 94
          Height = 17
          Caption = 'Mostrar Inativo'
          TabOrder = 5
          OnClick = btConsultaClick
        end
        object edtConsID: TbfEdit
          Left = 2
          Top = 32
          Width = 47
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsCidade: TbfEdit
          Left = 505
          Top = 32
          Width = 171
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
        object edtConsUF: TbfEdit
          Left = 677
          Top = 32
          Width = 21
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
          OnKeyPress = edtConsultaKeyPress
          SairComEnter = False
        end
      end
      object btEditar: TBitBtn
        Left = 450
        Top = 527
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Visualizar'
        TabOrder = 2
        OnClick = btIncluiClick
      end
      object btTransporta: TBitBtn
        Left = 357
        Top = 527
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
        Top = 527
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
      OnShow = tsCadastroShow
      DesignSize = (
        724
        555)
      object btSalva: TBitBtn
        Left = 359
        Top = 527
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
        Top = 527
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
        Top = 527
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
        Height = 525
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cadastro'
        TabOrder = 0
        object Label2: TLabel
          Left = 11
          Top = 58
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
          Left = 217
          Top = 20
          Width = 48
          Height = 13
          Caption = 'CPF/CNPJ'
          FocusControl = edtCNPJ
        end
        object Label7: TLabel
          Left = 632
          Top = 155
          Width = 13
          Height = 13
          Caption = 'UF'
          FocusControl = edtUF
        end
        object Label8: TLabel
          Left = 11
          Top = 194
          Width = 45
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = edtEndereco
        end
        object Label9: TLabel
          Left = 469
          Top = 194
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = edtNumero
        end
        object Label10: TLabel
          Left = 567
          Top = 194
          Width = 65
          Height = 13
          Caption = 'Complemento'
          FocusControl = edtComplemento
        end
        object Label11: TLabel
          Left = 11
          Top = 230
          Width = 28
          Height = 13
          Caption = 'Bairro'
          FocusControl = edtBairro
        end
        object Label12: TLabel
          Left = 532
          Top = 230
          Width = 19
          Height = 13
          Caption = 'CEP'
          FocusControl = edtCEP
        end
        object Label13: TLabel
          Left = 431
          Top = 305
          Width = 24
          Height = 13
          Caption = 'Fone'
          FocusControl = edtFone
        end
        object Label14: TLabel
          Left = 550
          Top = 306
          Width = 33
          Height = 13
          Caption = 'Celular'
          FocusControl = edtCel
        end
        object Label15: TLabel
          Left = 13
          Top = 306
          Width = 24
          Height = 13
          Caption = 'Email'
          FocusControl = edtEmail
        end
        object Label17: TLabel
          Left = 11
          Top = 155
          Width = 56
          Height = 13
          Caption = 'C'#243'd.Cidade'
          FocusControl = edtCodCidade
        end
        object Label18: TLabel
          Left = 120
          Top = 155
          Width = 78
          Height = 13
          Caption = 'Nome da Cidade'
          FocusControl = edtNomeCidade
        end
        object Label4: TLabel
          Left = 11
          Top = 269
          Width = 42
          Height = 13
          Caption = 'C'#243'd.Pa'#237's'
          FocusControl = edtCodCidade
        end
        object Label19: TLabel
          Left = 121
          Top = 268
          Width = 64
          Height = 13
          Caption = 'Nome do Pa'#237's'
          FocusControl = edtCodCidade
        end
        object Label23: TLabel
          Left = 11
          Top = 95
          Width = 71
          Height = 13
          Caption = 'Nome Fantasia'
          FocusControl = edtNomeFantasia
        end
        object Label25: TLabel
          Left = 215
          Top = 306
          Width = 46
          Height = 13
          Caption = 'Email NFe'
          FocusControl = edtEmail
        end
        object edtNome: TbfdbEdit
          Left = 11
          Top = 73
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
          Left = 217
          Top = 36
          Width = 200
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
          TabOrder = 2
        end
        object edtUF: TbfdbEdit
          Left = 632
          Top = 171
          Width = 34
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'UF'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object edtEndereco: TbfdbEdit
          Left = 11
          Top = 209
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
          TabOrder = 9
        end
        object edtNumero: TbfdbEdit
          Left = 469
          Top = 209
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
          TabOrder = 10
        end
        object edtComplemento: TbfdbEdit
          Left = 565
          Top = 209
          Width = 101
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
          TabOrder = 11
        end
        object edtBairro: TbfdbEdit
          Left = 11
          Top = 246
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
          TabOrder = 12
        end
        object edtCEP: TbfdbEdit
          Left = 532
          Top = 246
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
          TabOrder = 13
        end
        object edtFone: TbfdbEdit
          Left = 431
          Top = 321
          Width = 115
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
          TabOrder = 18
        end
        object edtCel: TbfdbEdit
          Left = 548
          Top = 321
          Width = 118
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CEL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
        end
        object edtEmail: TbfdbEdit
          Left = 11
          Top = 321
          Width = 200
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
        object edtCodCidade: TbfdbEditButton
          Left = 11
          Top = 171
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
          TabOrder = 6
          OnChange = edtCodCidadeChange
          OnDblClick = edtCodCidadeButtonClick
          OnExit = edtCodCidadeExit
          NumGlyphs = 1
          Text = 'EDTCODCIDADE'
          OnButtonClick = edtCodCidadeButtonClick
        end
        object edtNomeCidade: TbfdbEdit
          Left = 120
          Top = 171
          Width = 511
          Height = 21
          TabStop = False
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
          TabOrder = 7
        end
        object btConsultaCNPJ: TBitBtn
          Left = 528
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
          TabOrder = 3
          OnClick = btConsultaCNPJClick
        end
        object ckbInativo: TDBCheckBox
          Left = 663
          Top = 16
          Width = 54
          Height = 17
          TabStop = False
          Caption = 'Inativo'
          DataField = 'INATIVO_TRANSP'
          DataSource = ds
          TabOrder = 20
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object cbxPessoa: TbfdbComboBox
          Left = 109
          Top = 36
          Width = 100
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'PESSOA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            '1 - F'#205'SICA'
            '2 - JUR'#205'DICA'
            '3 - EXTERIOR')
          ParentFont = False
          TabOrder = 1
          OnExit = cbxPessoaExit
        end
        object pgcDados: TPageControl
          Left = 2
          Top = 346
          Width = 720
          Height = 177
          ActivePage = tbDocumentos
          Align = alBottom
          TabOrder = 21
          object tbDocumentos: TTabSheet
            Caption = 'Documentos'
            object Label5: TLabel
              Left = 4
              Top = 8
              Width = 65
              Height = 13
              Caption = 'Insc.Estadual'
              FocusControl = edtInscEstadual
            end
            object Label6: TLabel
              Left = 176
              Top = 9
              Width = 67
              Height = 13
              Caption = 'Insc.Municipal'
              FocusControl = edtIscMunicipal
            end
            object Label16: TLabel
              Left = 350
              Top = 8
              Width = 78
              Height = 13
              Caption = 'Simples Nacional'
            end
            object Label20: TLabel
              Left = 474
              Top = 8
              Width = 82
              Height = 13
              Caption = 'Tipo Contribuinte'
            end
            object Label21: TLabel
              Left = 4
              Top = 50
              Width = 40
              Height = 13
              Caption = 'Suframa'
              FocusControl = edtSuframa
            end
            object Label22: TLabel
              Left = 210
              Top = 51
              Width = 40
              Height = 13
              Caption = 'Validade'
              FocusControl = edtSuframaValidade
            end
            object edtInscEstadual: TbfdbEdit
              Left = 4
              Top = 24
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
              TabOrder = 0
            end
            object edtIscMunicipal: TbfdbEdit
              Left = 174
              Top = 24
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
              TabOrder = 1
            end
            object edtSuframa: TbfdbEdit
              Left = 4
              Top = 66
              Width = 200
              Height = 21
              CharCase = ecUpperCase
              DataField = 'SUFRAMA'
              DataSource = ds
              TabOrder = 4
            end
            object edtSuframaValidade: TbfdbEdit
              Left = 210
              Top = 67
              Width = 90
              Height = 21
              DataField = 'SUFRAMA_VALIDADE'
              DataSource = ds
              TabOrder = 5
            end
            object cbxSimplesNacional: TbfdbComboBox
              Left = 350
              Top = 24
              Width = 80
              Height = 21
              Style = csDropDownList
              CharCase = ecUpperCase
              DataField = 'SIMPLES_NACIONAL'
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
              TabOrder = 2
              SairComSeta = False
            end
            object cbxTipoContribuinte: TbfdbComboBox
              Left = 475
              Top = 24
              Width = 167
              Height = 21
              Style = csDropDownList
              CharCase = ecUpperCase
              DataField = 'TIPO_CONTRIBUINTE'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemHeight = 13
              Items.Strings = (
                '1 - CONTRIBUINTE'
                '2 - CONTRIBUINTE ISENTO'
                '9 - N'#195'O CONTRIBUINTE')
              ParentFont = False
              TabOrder = 3
              SairComSeta = False
            end
          end
          object tbContatos: TTabSheet
            Caption = 'Contatos'
            ImageIndex = 3
            object gbContatos: TGroupBox
              Left = 0
              Top = 0
              Width = 712
              Height = 149
              Align = alClient
              TabOrder = 0
              object bfdbGrid2: TbfdbGrid
                Left = 2
                Top = 15
                Width = 708
                Height = 132
                Align = alClient
                DataSource = dsContatos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = [fsBold]
                OnDblClick = bfdbGrid2DblClick
                SairComEnter = False
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CONTATO'
                    Width = 200
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
                    FieldName = 'MAIL'
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FONE'
                    Width = 100
                    Visible = True
                  end>
              end
            end
          end
        end
        object edtCodPais: TbfdbEditButton
          Left = 11
          Top = 284
          Width = 109
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'COD_PAIS'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnChange = edtCodPaisChange
          OnDblClick = edtCodPaisButtonClick
          OnExit = edtCodPaisExit
          NumGlyphs = 1
          Text = 'EDTCODPAIS'
          OnButtonClick = edtCodPaisButtonClick
        end
        object edtNomePais: TbfdbEdit
          Left = 121
          Top = 284
          Width = 545
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'NOME_PAIS'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object edtNomeFantasia: TbfdbEdit
          Left = 11
          Top = 111
          Width = 655
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME_FANTASIA'
          DataSource = ds
          TabOrder = 5
        end
        object bfdbEdit2: TbfdbEdit
          Left = 217
          Top = 321
          Width = 200
          Height = 21
          CharCase = ecLowerCase
          DataField = 'MAIL_NFE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
      end
    end
  end
  object btSai: TBitBtn
    Left = 636
    Top = 551
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
    Top = 551
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
    Left = 544
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
    object COD_CONTROLE: TIntegerField
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
    object cdsCEL: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'CEL'
      Size = 100
    end
    object cdsMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'MAIL'
      Size = 100
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
    object cdsPESSOA: TStringField
      DisplayLabel = 'Pessoa'
      FieldName = 'PESSOA'
      OnGetText = cdsPESSOAGetText
      Size = 1
    end
    object cdsCOD_PAIS: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'COD_PAIS'
    end
    object cdsNOME_PAIS: TStringField
      FieldName = 'NOME_PAIS'
      ProviderFlags = []
      Size = 100
    end
    object cdsNOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantas'#237'a'
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object cdsMAIL_NFE: TStringField
      DisplayLabel = 'Email NFe'
      FieldName = 'MAIL_NFE'
      Size = 100
    end
    object cdsSIMPLES_NACIONAL: TStringField
      DisplayLabel = 'Simples Nacional'
      FieldName = 'SIMPLES_NACIONAL'
      FixedChar = True
      Size = 1
    end
    object cdsTIPO_CONTRIBUINTE: TStringField
      DisplayLabel = 'Tipo Contribuinte'
      FieldName = 'TIPO_CONTRIBUINTE'
      OnGetText = cdsTIPO_CONTRIBUINTEGetText
      FixedChar = True
      Size = 1
    end
    object cdsSUFRAMA: TStringField
      DisplayLabel = 'Suframa'
      FieldName = 'SUFRAMA'
      Size = 30
    end
    object cdsSUFRAMA_VALIDADE: TSQLTimeStampField
      DisplayLabel = 'Validade'
      FieldName = 'SUFRAMA_VALIDADE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1; '
    end
    object cdsCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 1
    end
    object cdsFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 1
    end
    object cdsTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Size = 1
    end
    object cdsVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 1
    end
    object cdsOUTROS: TStringField
      FieldName = 'OUTROS'
      Size = 1
    end
    object cdsINATIVO_CLI: TStringField
      FieldName = 'INATIVO_CLI'
      Size = 1
    end
    object cdsINATIVO_FOR: TStringField
      FieldName = 'INATIVO_FOR'
      Size = 1
    end
    object cdsINATIVO_TRANSP: TStringField
      FieldName = 'INATIVO_TRANSP'
      Size = 1
    end
    object cdsINATIVO_VEND: TStringField
      FieldName = 'INATIVO_VEND'
      Size = 1
    end
    object cdsINATIVO_OUTROS: TStringField
      FieldName = 'INATIVO_OUTROS'
      Size = 1
    end
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 584
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select e.*, c.nome nome_cidade, p.nome nome_pais from SGC_PARTIC' +
        'IPANTES e'
      'left join SGC_cidades c on c.id = e.cod_cidade'
      'left join SGC_PAISES p on p.id = e.cod_pais')
    Left = 512
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
    object qrCEL: TStringField
      FieldName = 'CEL'
      Size = 100
    end
    object qrMAIL: TStringField
      FieldName = 'MAIL'
      Size = 100
    end
    object qrCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object qrNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      ProviderFlags = []
      Size = 200
    end
    object qrPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 1
    end
    object qrCOD_PAIS: TIntegerField
      FieldName = 'COD_PAIS'
    end
    object qrNOME_PAIS: TStringField
      FieldName = 'NOME_PAIS'
      ProviderFlags = []
      Size = 100
    end
    object qrNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object qrMAIL_NFE: TStringField
      FieldName = 'MAIL_NFE'
      Size = 100
    end
    object qrSIMPLES_NACIONAL: TStringField
      FieldName = 'SIMPLES_NACIONAL'
      FixedChar = True
      Size = 1
    end
    object qrTIPO_CONTRIBUINTE: TStringField
      FieldName = 'TIPO_CONTRIBUINTE'
      FixedChar = True
      Size = 1
    end
    object qrSUFRAMA: TStringField
      FieldName = 'SUFRAMA'
      Size = 30
    end
    object qrSUFRAMA_VALIDADE: TSQLTimeStampField
      FieldName = 'SUFRAMA_VALIDADE'
    end
    object qrCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 1
    end
    object qrFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 1
    end
    object qrTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Size = 1
    end
    object qrVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 1
    end
    object qrOUTROS: TStringField
      FieldName = 'OUTROS'
      Size = 1
    end
    object qrINATIVO_CLI: TStringField
      FieldName = 'INATIVO_CLI'
      Size = 1
    end
    object qrINATIVO_FOR: TStringField
      FieldName = 'INATIVO_FOR'
      Size = 1
    end
    object qrINATIVO_TRANSP: TStringField
      FieldName = 'INATIVO_TRANSP'
      Size = 1
    end
    object qrINATIVO_VEND: TStringField
      FieldName = 'INATIVO_VEND'
      Size = 1
    end
    object qrINATIVO_OUTROS: TStringField
      FieldName = 'INATIVO_OUTROS'
      Size = 1
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 616
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
  object qrContatos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from SGC_CONTATOS')
    Left = 648
    Top = 392
    object IntegerField2: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StringField1: TStringField
      FieldName = 'USU_INCLUI'
      Size = 30
    end
    object SQLTimeStampField5: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
    end
    object StringField6: TStringField
      FieldName = 'USU_ALTERA'
      Size = 30
    end
    object SQLTimeStampField6: TSQLTimeStampField
      FieldName = 'DT_ALTERA'
    end
    object StringField7: TStringField
      FieldName = 'IDALT'
      Size = 100
    end
    object StringField8: TStringField
      FieldName = 'IDALTERADO'
      Size = 100
    end
    object StringField10: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object IntegerField4: TIntegerField
      FieldName = 'ID_PARTICIPANTE'
      Required = True
    end
    object qrContatosCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 100
    end
    object qrContatosSETOR: TStringField
      FieldName = 'SETOR'
      Size = 100
    end
    object qrContatosMAIL: TStringField
      FieldName = 'MAIL'
      Size = 100
    end
    object qrContatosFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
  end
  object cdsContatos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContatos'
    AfterInsert = cdsAfterInsert
    AfterEdit = cdsAfterEdit
    BeforePost = cdsBeforePost
    AfterPost = cdsAfterPost
    AfterCancel = cdsAfterCancel
    AfterDelete = cdsAfterDelete
    OnNewRecord = cdsNewRecord
    Left = 648
    Top = 433
    object cdsContatosID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      OnGetText = cdsIDGetText
    end
    object StringField20: TStringField
      FieldName = 'USU_INCLUI'
      Size = 30
    end
    object SQLTimeStampField7: TSQLTimeStampField
      FieldName = 'DT_INCLUI'
    end
    object StringField25: TStringField
      FieldName = 'USU_ALTERA'
      Size = 30
    end
    object SQLTimeStampField8: TSQLTimeStampField
      FieldName = 'DT_ALTERA'
    end
    object StringField26: TStringField
      FieldName = 'IDALT'
      Size = 100
    end
    object StringField27: TStringField
      FieldName = 'IDALTERADO'
      Size = 100
    end
    object StringField29: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object cdsContatosID_PARTICIPANTE: TIntegerField
      FieldName = 'ID_PARTICIPANTE'
      Required = True
    end
    object cdsContatosCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 100
    end
    object cdsContatosSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 100
    end
    object cdsContatosMAIL: TStringField
      DisplayLabel = 'Mail'
      FieldName = 'MAIL'
      Size = 100
    end
    object cdsContatosFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Size = 30
    end
  end
  object dspContatos: TDataSetProvider
    DataSet = qrContatos
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUpdateError
    BeforeUpdateRecord = BeforeUpdateRecord
    Left = 640
    Top = 486
  end
  object dsContatos: TDataSource
    DataSet = cdsContatos
    Left = 644
    Top = 533
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
