object fmAltera_Senha: TfmAltera_Senha
  Left = 381
  Top = 323
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Definir Senha'
  ClientHeight = 128
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    255
    128)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 29
    Top = 37
    Width = 66
    Height = 13
    Caption = 'Nova Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 44
    Top = 63
    Width = 51
    Height = 13
    Caption = 'Confirma'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 27
    Top = 12
    Width = 68
    Height = 13
    Caption = 'Senha Atual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btOK: TBitBtnJul
    Left = 99
    Top = 98
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btOKClick
    NumGlyphs = 2
  end
  object btDesiste: TBitBtnJul
    Left = 174
    Top = 98
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
    TabOrder = 4
    NumGlyphs = 2
  end
  object edtSenha: TEditJul
    Left = 97
    Top = 34
    Width = 152
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    CorComFoco = clSkyBlue
    CursorNoFim = True
  end
  object edtConfirma: TEditJul
    Left = 97
    Top = 59
    Width = 152
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    CorComFoco = clSkyBlue
    CursorNoFim = True
  end
  object edtSenha_Ant: TEditJul
    Left = 97
    Top = 9
    Width = 152
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
    CorComFoco = clSkyBlue
    CursorNoFim = True
  end
end
