unit uFuncoesDB;
(******************************************************************************)
(*  SGD Bluefield - 01/04/2017                                                  *)
(******************************************************************************)

interface

uses
  midaslib,
  Sysutils, Windows, Forms, Controls, Grids, DBGrids,
  udtmConexao, DB, SqlExpr, DBXpress;

function AbreDataModule(dtmOp: TdtmConexao; sOpPath: string; sOpDB : string = 'FIREBIRD'): boolean;
function FechaDataModule(dtmOp: TdtmConexao): boolean;
function AbreTransacao(dtmOp: TdtmConexao): boolean;

function QueryExec(sOpSQL,sPath_Local:string):boolean;
function QueryExecDTM(sOpSQL:string; dtmOp: TdtmConexao):boolean;
function Query(sOpSQL,sPath_Local,sOpCampoRetorno:string): string;
function QueryDbGrid(sOpSQL:string; dbg:TCustomDbgrid; dtmOp: TdtmConexao): string;
function DireitosUsuario(sOpUSUARIO,sOpACESSO:string; qrOp:TSQLQuery): string;

function LoginDB(sUsuario,sSenha:string):string;

implementation

uses uFuncoes, uLogin; //, RTLConsts

function AbreDataModule(dtmOp: TdtmConexao; sOpPath: string; sOpDB : string = 'FIREBIRD'): boolean;
begin
  result := false;
  //DataModule tem que estar criado na memoraia

  if not FileExists(sOpPath+'\SGDCon.ini') then
  begin
    MessageBox(Application.Handle, pchar('Arquivo "'+sOpPath+'\SGDCon.ini" n?o foi encontrado.'), 'Aviso', MB_ICONWARNING);
    exit;
  end;

  dtmOp.sPath_Local := sOpPath;


  with dtmOp.SQLDB do
  try
    LoadParamsFromIniFile(sOpPath+'\SGDCon.ini');
    if sOpDB = 'FIREBIRD' then
    begin
      Params.Add('User_Name=SYSDBA');
      Params.Add('Password=masterkey');
    end;
    if sOpDB = 'SQLSERVER' then
    begin
      Params.Add('User_Name=sa');
      Params.Add('Password=1');
    end;

  //  MessageBox(Application.Handle, pchar(sOpDB+#13+Params.Text), 'Aviso', MB_ICONWARNING);

    Open;
//    MessageBox(Application.Handle, pchar(sOpDB+#13+Params.Text), 'Aviso', MB_ICONWARNING);
  finally

  end;
                        
  try
    if not dtmOp.SQLDB.Connected then
    begin
      MessageBox(Application.Handle, pchar('Banco de dados n?o conectado!'), 'Erro', MB_ICONERROR);
      Exit;
    end;
    dtmOp.sIDSessao := FormatDateTime('yyyymmdd-hh:nn:ss',now);
//    MessageBox(Application.Handle, pchar('ID Sessao '+dtmConexao.sIDSessao), 'Aviso', MB_ICONWARNING);

  except
    on e : Exception do
    begin
      MessageBox(Application.Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    end;
  end;
  result := true;
end;

function AbreTransacao(dtmOp: TdtmConexao): boolean;
begin
  result := false;
  try
    dtmOp.td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    dtmOp.td.IsolationLevel := xilREADCOMMITTED;
    dtmOp.SQLDB.StartTransaction(dtmOp.td);

    result := true;
  except
    on e : Exception
    do MessageBox(Application.Handle, pchar(e.Message), 'Erro ao abrir transa??o!', MB_ICONERROR);
  end;
end;

function FechaDataModule(dtmOp: TdtmConexao): boolean;
begin
  result := false;
  try
//    MessageBox(Application.Handle, pchar('Fechando '+dtmOp.sIDSessao), 'Aviso', MB_ICONWARNING);

    if dtmOp.SQLDB.Connected
    then
    begin
      dtmOp.SQLDB.Close;
    end;
    dtmOp.Free;

  except
    on e : Exception do
    begin
      MessageBox(Application.Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    end;
  end;
  result := true;
end;

function DireitosUsuario(sOpUSUARIO,sOpACESSO : string; qrOp:TSQLQuery): string;
begin
  result := '';

  with qrOp do
  begin
    sql.Clear;
    sql.Add(' select * from SGD_USUARIOS_ACESSO where USUARIO = :u and ACESSO = :a ');
    ParamByName('u').AsString := sOpUSUARIO;
    ParamByName('a').AsString := sOpACESSO;
    Open;
    if IsEmpty
    then result := ''
    else result := FieldByName('CAD').AsString+';'
                 + FieldByName('INC').AsString+';'
                 + FieldByName('ALT').AsString+';'
                 + FieldByName('EXC').AsString+';'
                 ;
    Close;
  end;
end;

function QueryDbGrid(sOpSQL:string; dbg:TCustomDbgrid;dtmOp: TdtmConexao): string;
begin

  dbg.DataSource := dtmOp.ds;
  dtmOp.qr.SQL.Text := sOpSQL;
  dtmOp.cds.Open;

end;

function Query(sOpSQL,sPath_Local,sOpCampoRetorno:string): string;
var
  dtmCon : TdtmConexao;
  bDBAberto : boolean;
begin
  result := '';

  if trim(sPath_Local) = ''
  then sPath_Local := GetCurrentDir;

  dtmCon := TdtmConexao.Create(Application);
  bDBAberto := AbreDataModule(dtmCon,sPath_Local,'FIREBIRD');
  if not bDBAberto then
  begin
    FechaDataModule(dtmCon);
    exit;
  end;

  with dtmCon.qr do
  try

    sql.Text := sOpSQL;
    Open;

    result := FieldByName(sOpCampoRetorno).AsString;

  except
    on e : Exception do
    begin
      MessageBox(Application.Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
//      SQLConnection.Rollback(td);
      FechaDataModule(dtmCon);
      exit;
    end;
  end;

  FechaDataModule(dtmCon);

end;

function LoginDB(sUsuario,sSenha:string):string;
var
  sPath_Local, u, s, a : string;
  dtmCon : TdtmConexao;
  bDBAberto : boolean;
begin
  result := '';
  u := '';
  s := '';
  sPath_Local := GetCurrentDir;

  u := Login(sUsuario,sSenha);
  if trim(u)= '' then exit;
  s := Separa_String(u,2);
  u := Separa_String(u,1);

  dtmCon := TdtmConexao.Create(Application);
  bDBAberto := AbreDataModule(dtmCon,sPath_Local);
  if not bDBAberto then
  begin
    FechaDataModule(dtmCon);
    exit;
  end;
  with dtmCon.qr do
  begin
    if active then close;

    SQL.Clear;
    SQL.Add(' select * from SGC_EMPRESAS where ID = 1 ');
    Open;
    if IsEmpty then
    begin
      Close;
      MessageBox(Application.Handle, pchar('Empresa n?o habilitada.'), 'Provisual TI', MB_ICONWARNING);
      FechaDataModule(dtmCon);
      Result := '';
      Exit;
    end;

    if (FieldByName('DTULT').AsDateTime < date)
    or (FieldByName('DTULT').AsDateTime < FieldByName('DTLOG').AsDateTime)
    then
    begin
      Close;
      MessageBox(Application.Handle, pchar('H? um problema na instala??o do programa. (C?digo 111)'+#13
                                          +'Entre em contato com o suporte t?cico.'+#13+#13
                                          +'provisualpoa@gmail.com'#13
                                          +'+55 51 98402 5128' ), 'Provisual TI', MB_ICONINFORMATION);
      FechaDataModule(dtmCon);
      Result := '';
      Exit;
    end;

    if (FieldByName('DTLOG').AsDateTime < now) then
    begin

      if u = 'SYSDBA'
      then a := ''
      else a := ', USULOG = '''+u+''' ';
      if not QueryExecDTM('update SGC_EMPRESAS set DTLOG = ''now'' '+a+', idalterado = idalt where ID = 1 ',dtmCon)
      then
      begin
        FechaDataModule(dtmCon);
        Result := '';
        Exit;
      end;
    end;

    SQL.Clear;
    SQL.Add(' select * from SGD_USUARIOS where usuario = :u ');
    ParamByName('u').AsString := u;
    Open;
    if IsEmpty then
    begin
      Close;
      MessageBox(Application.Handle, pchar('Usu?rio n?o cadastrado.'), 'Erro', MB_ICONWARNING);
      FechaDataModule(dtmCon);
      Result := LoginDB(u,s);
      Exit;
    end;
    if s <> FieldByName('senha').AsString then
    begin
      Close;
      MessageBox(Application.Handle, pchar('Senha inv?lida.'), 'Erro', MB_ICONWARNING);
      FechaDataModule(dtmCon);
      Result := LoginDB(u,s);
      Exit;
    end;
    Close;
  end;
  result := u;

  FechaDataModule(dtmCon);

end;
function QueryExecDTM(sOpSQL:string; dtmOp: TdtmConexao):boolean;
var
  td : TTransactionDesc;
begin
  result := false;

//  MessageBox(Application.Handle, pChar(sOpSQL), 'SQL', MB_ICONASTERISK);

  with dtmOp.qr do
  try
    td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    td.IsolationLevel := xilREADCOMMITTED;
    SQLConnection.StartTransaction(td);

    sql.Text := sOpSQL;
    ExecSQL;

    SQLConnection.Commit(td);

  except
    on e : Exception do
    begin
      MessageBox(Application.Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      SQLConnection.Rollback(td);
      exit;
    end;
  end;
  result := true;


end;

function QueryExec(sOpSQL,sPath_Local:string):boolean;
var
  dtmConQR : TdtmConexao;
  bDBAberto : boolean;
  td : TTransactionDesc;
begin
  result := false;
  if trim(sPath_Local) = ''
  then sPath_Local := GetCurrentDir;

  dtmConQR := TdtmConexao.Create(Application);
  bDBAberto := AbreDataModule(dtmConQR,sPath_Local,'FIREBIRD');
  if not bDBAberto then
  begin
    FechaDataModule(dtmConQR);
    exit;
  end;

  with dtmConQR.qr do
  try
    td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    td.IsolationLevel := xilREADCOMMITTED;
    SQLConnection.StartTransaction(td);

    sql.Text := sOpSQL;
    ExecSQL;

    SQLConnection.Commit(td);

  except
    on e : Exception do
    begin
      MessageBox(Application.Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      SQLConnection.Rollback(td);
      FechaDataModule(dtmConQR);
      exit;
    end;
  end;
  result := true;

  FechaDataModule(dtmConQR);

end;

end.
