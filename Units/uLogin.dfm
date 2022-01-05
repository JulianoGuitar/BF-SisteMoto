object fmLogin: TfmLogin
  Left = 348
  Top = 245
  ActiveControl = edjUsuario
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Entrar...'
  ClientHeight = 89
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000000000000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000077000000000000000000000
    00000000F7870000000000000000000000077008078700000000000000000000
    0887770087870000000000000000000008F7878F778700000000000080000000
    08F78708F787000000000008B3300000000787070787000000000800BB800000
    00878700878700000000833BB80000008F77878F7787000000008BBB80300000
    08F7878F7787000000800BB80300000000078708F78700000833BB8030000000
    00878708F78800008BBBB803000000008F77878F77F800008BBB803000000000
    8F7788F77F778000BBB803000000000008F78F77F000000BBB80300000000000
    08F8F7700888888BB8030000000000008F8F77088BBBBBBB8030000000000008
    F78F708BBBBBBBB7B30000000000008F778F70BBBB7B7B7B73000000000008F7
    7F8F0BBBB0B0B7B7B300000000008F77F78F8BBBBB0B0B7B7300000000008F77
    7F788BBBBBB0B0B7B300000000008F77F7008BBB880B0B0B7300000000008F77
    708F8BB00000B0B73000000000008F77F0808BB00000BBB730000000000008F7
    708808B00800BB73000000000000008F77000788000BB3300000000000000008
    FFF0878077773000000000000000000088808887888800000000000000000000
    000087778000000000000000000000000000000000000000000000000000FFF9
    FFFFFFF0FFFFFE607FFFFC007FFFF8007FFFF8007FF1F8007FE0FC007F80F800
    7F00F0007F00F8007C01FC007803F8007007F000700FF000201FF800003FF800
    007FF00000FFE00001FFC00001FF800001FF000001FF000001FF000001FF000E
    03FF010603FF800207FFC0000FFFE0001FFFF0007FFFFE03FFFFFF07FFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 18
    Top = 9
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 25
    Top = 36
    Width = 30
    Height = 13
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btSai: TBitBtn
    Left = 135
    Top = 61
    Width = 73
    Height = 25
    Cancel = True
    Caption = 'Desistir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
    NumGlyphs = 2
  end
  object btOK: TBitBtn
    Left = 63
    Top = 61
    Width = 73
    Height = 25
    Caption = 'Entrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
    NumGlyphs = 2
  end
  object edjUsuario: TEditJul
    Left = 63
    Top = 5
    Width = 141
    Height = 21
    CharCase = ecUpperCase
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edjSenha: TEditJul
    Left = 63
    Top = 32
    Width = 141
    Height = 21
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edjSenhaKeyPress
  end
end
