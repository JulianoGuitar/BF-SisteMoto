object dtmConexao: TdtmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 216
  Top = 117
  Height = 296
  Width = 326
  object SQLDB: TSQLConnection
    ConnectionName = 'UIB FireBird15 Connection'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=c:\Projetosfdb\kalykim.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'fbclient.dll'
    Left = 32
    Top = 24
  end
  object qrApoio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLDB
    Left = 80
    Top = 24
  end
  object qr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLDB
    Left = 32
    Top = 80
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 96
    Top = 120
  end
  object dsp: TDataSetProvider
    DataSet = qr
    UpdateMode = upWhereKeyOnly
    Left = 152
    Top = 128
  end
  object ds: TDataSource
    DataSet = cds
    Left = 216
    Top = 112
  end
  object qrTela: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLDB
    Left = 32
    Top = 160
  end
end
