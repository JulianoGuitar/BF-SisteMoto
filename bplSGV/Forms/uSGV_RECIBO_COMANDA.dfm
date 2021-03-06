object fmSGV_RECIBO_COMANDA: TfmSGV_RECIBO_COMANDA
  Left = 0
  Top = 0
  Width = 351
  Height = 342
  Caption = 'SFP307 | Recibo da comanda'
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
    335
    303)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 39
    Height = 13
    Caption = 'Parceiro'
  end
  object Label1: TLabel
    Left = 8
    Top = 80
    Width = 58
    Height = 13
    Caption = 'N'#186' comanda'
  end
  object btImprime: TBitBtn
    Left = 8
    Top = 270
    Width = 113
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Imprimir'
    TabOrder = 1
    OnClick = btImprimeClick
  end
  object cbxParceiros: TComboBox
    Left = 8
    Top = 26
    Width = 273
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'Todos'
    OnKeyPress = cbxParceirosKeyPress
    Items.Strings = (
      'Todos')
  end
  object edtNr_Comanda: TbfNumEdit
    Left = 8
    Top = 99
    Width = 89
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object btSair: TBitBtn
    Left = 214
    Top = 270
    Width = 113
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Sair'
    TabOrder = 3
    OnClick = btSairClick
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Op'#231#245'es'
    TitleStatus = 'Status'
    TitlePreview = 'Visualizar Impress'#227'o'
    SystemSetups = [ssAllowSetup, ssAllowCopies, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Gerando p'#225'gina %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 110.000000000000000000
    SystemPrinter.MarginBottom = 7.000000000000000000
    SystemPrinter.MarginLeft = 10.000000000000000000
    SystemPrinter.MarginRight = 10.000000000000000000
    SystemPrinter.MarginTop = 7.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Imprimindo p'#225'gina %p'
    SystemPrinter.Title = 'Recibo de Pagamento'
    SystemPrinter.Units = unMM
    SystemPrinter.UnitsFactor = 25.400000000000000000
    OnPrint = RvSystem1Print
    OnBeforePrint = RvSystem1BeforePrint
    Left = 164
    Top = 184
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select e.*, c.nome nome_cidade, p.nome NOME_NACIONALIDADE, n.nom' +
        'e NOME_NATURALIDADE, p1.nome nomePaisResid '
      ', s.NOME SETOR_DESC, ca.NOME CARGO_DESC, f.NOME FUNCAO_DESC'
      'from SFP_FUNCIONARIOS e'
      'left join SGD_cidades c on c.id = e.cod_cidade'
      'left join SGD_cidades n on n.id = e.cod_naturalidade'
      'left join SGD_PAISES p on p.id = e.COD_NACIONALIDADE'
      'left join SGD_PAISES p1 on p1.id = e.codPaisResid'
      'left join SFP_SETOR s on s.ID = e.COD_SETOR'
      'left join SFP_CARGOS ca on ca.ID = e.codCargo'
      'left join SFP_FUNCOES f on f.ID = e.codFuncao;')
    Left = 9
    Top = 224
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    EmbedFonts = False
    ImageQuality = 90
    MetafileDPI = 300
    FontEncoding = feWinAnsiEncoding
    DocInfo.Creator = 'Rave Reports (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 208
    Top = 184
  end
end
