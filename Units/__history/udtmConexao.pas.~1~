unit udtmConexao;
(******************************************************************************)
(*  SGD Bluefield - 01/04/2017                                                  *)
(******************************************************************************)

interface

uses
  Windows, SysUtils, Forms, Classes, FMTBcd, DB, SqlExpr,
  Provider, DBClient, DBXpress;

type
  TdtmConexao = class(TDataModule)
    SQLDB: TSQLConnection;
    qrApoio: TSQLQuery;
    qr: TSQLQuery;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    ds: TDataSource;
    qrTela: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    td : tTransactionDesc;
    sIDSessao,
    sPath_Local : string;
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{$R *.dfm}

procedure TdtmConexao.DataModuleCreate(Sender: TObject);
begin
  inherited;
  RemoveDataModule(Self);
end;

end.
