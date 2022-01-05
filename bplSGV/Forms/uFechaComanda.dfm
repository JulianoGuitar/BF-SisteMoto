object fmFechaComanda: TfmFechaComanda
  Left = 309
  Top = 297
  ActiveControl = DBEdit4
  BorderStyle = bsDialog
  Caption = 'Fechar Comanda'
  ClientHeight = 160
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    370
    160)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 34
    Width = 51
    Height = 13
    Caption = 'Valor Total'
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 12
    Top = 58
    Width = 44
    Height = 13
    Caption = 'Recebido'
    FocusControl = DBEdit4
  end
  object Label6: TLabel
    Left = 30
    Top = 82
    Width = 27
    Height = 13
    Caption = 'Troco'
    FocusControl = DBEdit5
  end
  object btOK: TBitBtn
    Left = 212
    Top = 130
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btOKClick
    NumGlyphs = 2
  end
  object btCanc: TBitBtn
    Left = 287
    Top = 130
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Desistir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 7
    NumGlyphs = 2
  end
  object DBEdit1: TbfdbEdit
    Left = 8
    Top = 8
    Width = 53
    Height = 21
    DataField = 'COMANDA'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TbfdbEdit
    Left = 62
    Top = 8
    Width = 301
    Height = 21
    DataField = 'COMANDA_NOME'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit3: TbfdbEdit
    Left = 62
    Top = 31
    Width = 90
    Height = 21
    TabStop = False
    DataField = 'TOTAL'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit4: TbfdbEdit
    Left = 62
    Top = 55
    Width = 90
    Height = 21
    DataField = 'PAGO'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit5: TbfdbEdit
    Left = 62
    Top = 79
    Width = 90
    Height = 21
    TabStop = False
    DataField = 'TROCO'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
  end
  object bfdbComboBox1: TbfdbComboBox
    Left = 153
    Top = 56
    Width = 211
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    DataField = 'FORMA'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    Items.Strings = (
      'DINHEIRO'
      'CR'#201'DITO'
      'D'#201'BITO'
      'PIX')
    ParentFont = False
    TabOrder = 4
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsCalcFields
    Left = 232
    Top = 64
    object cdsCOMANDA: TIntegerField
      DisplayLabel = 'Comanda'
      FieldName = 'COMANDA'
    end
    object cdsCOMANDA_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'COMANDA_NOME'
      Size = 100
    end
    object cdsTOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPAGO: TFMTBCDField
      DisplayLabel = 'Recebido'
      FieldName = 'PAGO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsTROCO: TFMTBCDField
      DisplayLabel = 'Troco'
      FieldKind = fkCalculated
      FieldName = 'TROCO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
      Calculated = True
    end
    object cdsFORMA: TStringField
      DisplayLabel = 'Forma Pagamento'
      FieldName = 'FORMA'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 280
    Top = 64
  end
end
