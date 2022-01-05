object dtmConexao: TdtmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 296
  Width = 326
  object SQLDB: TSQLConnection
    ConnectionName = 'UIB FireBird15 Connection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=15.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'VendorLib=fbclient.DLL'
      'Database=PauloRSA-Acer:\Projetosbin\BF SisteMoto\Sistemoto.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    VendorLib = 'fbclient.DLL'
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
