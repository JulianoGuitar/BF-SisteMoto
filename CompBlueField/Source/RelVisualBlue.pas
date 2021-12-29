unit RelVisualBlue;
(******************************************************************************)
(*     © 2018 Jµ£¡åñø¸Ð¸®ø§å ¸ þ®ø¥¡§µå£                                      *)
(******************************************************************************)

interface

uses Windows, Messages, SysUtils, Classes, Controls, printers, DB, DBClient,
Graphics, ShellAPI;

type
  TDestino = (toVisualiza, toImprime, toArquivo, toTela);
  TPapel = (tpPadrao, tpA4, tpCarta, tpA5);
  TOrientacao = (toRetrato, toPaisagem);
  {  }
  TRelVisualBlue = class(TComponent)
  private
    FsCab1E, FsCab1C, FsCab1D, FsCab2E, FsCab2C, FsCab2D, FsCab3E, FsCab3C, FsCab3D,
    FsRodape, FsRodape_Grupo, FsTitulo, fsLogoTipo, fsChar_Sep_TXT, fsArquivo_Destino_TXT : string;
    FCds : TClientDataSet;
    FDestino : TDestino;
    FOrientacao : TOrientacao;
    FTamPapel : TPapel;
    FboLinhaCab, FboLinhaVert, FboCabGrupo, FboRodapeGrupo, FboLinhaGrupo, fboLinhaRodapeGrupo,
    fboQuebraPagGrupo, fboTotalTransp, fboTotais, fboGera_Cab_TXT, fboMostra_Dialogo_Salvar, fboTarja_Cinza, fboVisto : boolean;
    FFonte : TFont;
    FCampos : TStrings;
    FCabecalhos : TStrings;
    FZoom, FPagIni, FBMPLeft, FBMPTop, FBMPRight, FBMPBottom : integer;
    FMargLeft, FMargTop, FMargRight, FMargBottom : extended;
    {}
    function WinExecAndWait32(CommandLine: string; ShowWindow: Word): DWORD;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute; virtual;
    procedure SetCampos(Value: TStrings);
    procedure SetCabecalhos(Value: TStrings);
    procedure SetFonte(Value: TFont);
    procedure Add_Campo(iOp_Opcao, iOp_Tamanho : integer; sOp_Campo_Grupo, sOp_Alinha, sOP_Formato, sOp_Nome, sOp_Descricao : String);
    procedure Limpa_Campos;
  published
    property Cabecalho1Esquerda : string read FsCab1E write FsCab1E;
    property Cabecalho1Centro : string read FsCab1C write FsCab1C;
    property Cabecalho1Direita : string read FsCab1D write FsCab1D;
    property Cabecalho2Esquerda : string read FsCab2E write FsCab2E;
    property Cabecalho2Centro : string read FsCab2C write FsCab2C;
    property Cabecalho2Direita : string read FsCab2D write FsCab2D;
    property Cabecalho3Esquerda : string read FsCab3E write FsCab3E;
    property Cabecalho3Centro : string read FsCab3C write FsCab3C;
    property Cabecalho3Direita : string read FsCab3D write FsCab3D;
    property TextoRodape : string read FsRodape write FsRodape;
    property TextoRodapeGrupo : string read FsRodape_Grupo write FsRodape_Grupo;
    property TituloRelatorio : string read FsTitulo write FsTitulo;
    property ClientDataSet : TClientDataSet read FCds write FCds;
    property Destino : TDestino read FDestino write FDestino default toVisualiza;
    property Orientacao : TOrientacao read FOrientacao write FOrientacao default toRetrato;
    property TamanhoPapel : TPapel read FTamPapel write FTamPapel default tpPadrao;
    property LinhaCabecalho : boolean read FboLinhaCab write FboLinhaCab default true;
    property LinhaVertical : boolean read FboLinhaVert write FboLinhaVert default false;
    property CabecalhoGrupo : boolean read FboCabGrupo write FboCabGrupo default false;
    property RodapeGrupo : boolean read FboRodapeGrupo write FboRodapeGrupo default false;
    property LinhaGrupo : boolean read FboLinhaGrupo write FboLinhaGrupo default false;
    property TotalTransporte : boolean read fboTotalTransp write fboTotalTransp default false;
    property Totais : boolean read fboTotais write fboTotais default true;
    property LinhaRodapeGrupo : boolean read fboLinhaRodapeGrupo write fboLinhaRodapeGrupo default false;
    property QuebraPaginaGrupo : boolean read fboQuebraPagGrupo write fboQuebraPagGrupo default false;
    property LogoTipoBMP : string read fsLogoTipo write fsLogoTipo;
    property LogoLeft : integer read FBMPLeft write FBMPLeft default 0;
    property LogoTop : integer read FBMPTop write FBMPTop default 0;
    property LogoRight : integer read FBMPRight write FBMPRight default 10;
    property LogoBottom : integer read FBMPBottom write FBMPBottom default 10;

    property MarginLeft : extended read FMargLeft write FMargLeft;
    property MarginTop : extended read FMargTop write FMargTop;
    property MarginRight : extended read FMargRight write FMargRight;
    property MarginBottom : extended read FMargBottom write FMargBottom;

    property Fonte : TFont read FFonte write SetFonte;
    property DefinicaoCampos : TStrings read FCampos write SetCampos;
    property Cabecalhos : TStrings read FCabecalhos write SetCabecalhos;
    property Zoom : integer read Fzoom write Fzoom default 100;
    property PaginaInicial : integer read FPagIni write FPagIni default 1;
    property TXTCharSeparador : string read fsChar_Sep_TXT write fsChar_Sep_TXT;
    property TXTArquivoDestino : string read fsArquivo_Destino_TXT write fsArquivo_Destino_TXT;
    property TXTGeraCabecalhoCampos : boolean read fboGera_Cab_TXT write fboGera_Cab_TXT default true;
    property SempreMostrarCaixaSalvar : boolean read fboMostra_Dialogo_Salvar write fboMostra_Dialogo_Salvar default true;
    property ImprimirTarjaCinza : boolean read fboTarja_Cinza write fboTarja_Cinza default false;
    property ImprimirVisto : boolean read fboVisto write fboVisto default false;


    {}
  end;

implementation


{ TRelVisualBlue }

(******************************************************************************)

constructor TRelVisualBlue.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCampos := TStringList.Create;
  FCabecalhos := TStringList.Create;
  FFonte := TFont.Create;

  Destino := toVisualiza;
  Orientacao := toRetrato;
  TamanhoPapel := tpPadrao;
  LinhaCabecalho := true;
  LinhaVertical := false;
  CabecalhoGrupo := false;
  RodapeGrupo := false;
  LinhaGrupo := false;
  TotalTransporte := false;
  Totais := true;
  LinhaRodapeGrupo := false;
  QuebraPaginaGrupo := false;
  LogoLeft := 0;
  LogoTop := 0;
  LogoRight := 10;
  LogoBottom := 10;
  Zoom := 100;

  MarginLeft := 10;
  MarginTop := 10;
  MarginRight := 10;
  MarginBottom := 10;

  PaginaInicial := 1;
  TXTCharSeparador := ';';
  TXTGeraCabecalhoCampos := true;
  SempreMostrarCaixaSalvar := true;
  ImprimirTarjaCinza := false;
  ImprimirVisto := false;
end;

(******************************************************************************)

destructor TRelVisualBlue.Destroy;
begin
  FCampos.Free;
  FCabecalhos.Free;
  FFonte.Free;
  inherited;
end;

(******************************************************************************)

procedure TRelVisualBlue.Execute;
var
  sl : TStringList;
  s, sOp : string;
  i, iOr, iPap, t : integer;
  lng: DWORD;
  thePath: string;
begin
  //acha o diretorio temp do windows
  SetLength(thePath, MAX_PATH) ;
  lng := GetTempPath(MAX_PATH, PChar(thePath));
  SetLength(thePath, lng) ;
  //
  if DirectoryExists(thePath) then
  begin
    if copy(thepath,length(thepath),1) <> '\' then thepath := thepath + '\';
  end
  else ThePath := 'c:\';

  sl := TStringList.Create;

  if ImprimirTarjaCinza then s := 'T1' else s := 'L1';

  if LinhaCabecalho then s:= s + 'T' else s := s + ' ';
  if LinhaVertical then s:= s + 'S' else s := s + ' ';
  if TotalTransporte then s:= s + 'T' else s := s + ' ';
  s := s + 'S';//liga layout novo
  if Totais then s:= s + 'T' else s := s + ' ';
  if ImprimirVisto then s:= s + 'V' else s := s + ' ';
  s := s+trim(TituloRelatorio);
  sl.Add(s);

  if trim(LogoTipoBMP) <> '' then
    sl.Add('C B'+trim(LogoTipoBMP)+';'+IntToStr(LogoLeft)+';'+IntToStr(LogoTop)+';'+IntToStr(LogoRight)+';'+IntToStr(LogoBottom)+';');

  sl.Add('C M'+FloatToStr(MarginLeft)+';'+FloatToStr(MarginTop)+';'+FloatToStr(MarginRight)+';'+FloatToStr(MarginBottom)+';');


  if (trim(Cabecalho1Esquerda) <> '') or (trim(Cabecalho1Centro) <> '') or (trim(Cabecalho1Direita) <> '')
  then sl.Add('C E'+Cabecalho1Esquerda+';C'+Cabecalho1Centro+';D'+Cabecalho1Direita+';');

  if (trim(Cabecalho2Esquerda) <> '') or (trim(Cabecalho2Centro) <> '') or (trim(Cabecalho2Direita) <> '')
  then sl.Add('C E'+Cabecalho2Esquerda+';C'+Cabecalho2Centro+';D'+Cabecalho2Direita+';');

  if (trim(Cabecalho3Esquerda) <> '') or (trim(Cabecalho3Centro) <> '') or (trim(Cabecalho3Direita) <> '')
  then sl.Add('C E'+Cabecalho3Esquerda+';C'+Cabecalho3Centro+';D'+Cabecalho3Direita+';');

  if Cabecalhos.Count > 0 then
    for i := 0 to (Cabecalhos.Count-1) do sl.Add('C E'+Cabecalhos.Strings[i]);

  if DefinicaoCampos.Count > 0 then
    for i := 0 to (DefinicaoCampos.Count-1) do sl.Add(DefinicaoCampos.Strings[i]);

  if trim(TextoRodape) <> '' then sl.Add('R'+trim(TextoRodape));
  if trim(TextoRodapeGrupo) <> '' then sl.Add('r'+trim(TextoRodapeGrupo));
  if trim(ClientDataSet.IndexFieldNames) <> '' then sl.Add('I'+trim(ClientDataSet.IndexFieldNames));
  if ClientDataSet.Filtered then sl.Add('F'+trim(ClientDataSet.Filter));

  if CabecalhoGrupo or RodapeGrupo or LinhaGrupo or LinhaRodapeGrupo then
  begin
    s := 'g';
    if CabecalhoGrupo then s := s+'1' else s := s+'0';
    if RodapeGrupo then s := s+'1' else s := s+'0';
    if LinhaGrupo then s := s+'1' else s := s+'0';
    if LinhaRodapeGrupo then s := s+'1' else s := s+'0';
    if QuebraPaginaGrupo then s := s+'1' else s := s+'0';
    sl.Add(s);
  end;

  s := 'X';
  if TXTGeraCabecalhoCampos then s := s + '1' else s := s + '0';
  s := s + TXTCharSeparador;
  sl.Add(s);

  sl.Add('T ');
  sl.SaveToFile(thepath+'temp.txt');
  sl.Free;

  ClientDataSet.SaveToFile(thepath+'temp.cds');

  sOp := 'D';
  if Destino = toImprime then sOp := sOP + 'I';
  if Destino = toArquivo then sOp := sOP + 'A';
  if Destino = toTela then sOp := sOP + 'T';

  case Orientacao of
    toRetrato  : iOr := 0;
    toPaisagem : iOr := 1;
  end;

  case TamanhoPapel of
    tpPadrao : iPap := -1;
    tpA4     : iPap := 0;
    tpCarta  : iPap := 1;
    tpA5     : iPap := 2;
  end;

  if SempreMostrarCaixaSalvar then s := '1' else s := '0';

  if TXTArquivoDestino = '' then TXTArquivoDestino := ' ';
  t := 1;
  while (not FileExists(thepath+'temp.cds')) and (t < 11) do
  begin
    Sleep(2000);
    inc(t);
  end;

  s := 'VisualR4.exe '+sOp+' "'+thepath+'temp.txt" "'+Fonte.Name+'" '+IntToStr(Fonte.Size)+' '+
       IntToStr(iOr)+' '+IntToStr(iPap)+' '+FloatToStr(Zoom)+' '+
       IntToStr(PaginaInicial)+' "'+TXTArquivoDestino+'" "'+thepath+'temp.cds" '+s;

{  s := sOp+' "'+thepath+'temp.txt" "'+Fonte.Name+'" '+IntToStr(Fonte.Size)+' '+
       IntToStr(iOr)+' '+IntToStr(iPap)+' '+FloatToStr(Zoom)+' '+
       IntToStr(PaginaInicial)+' "'+TXTArquivoDestino+'" "'+thepath+'temp.cds" '+s;
 }
  WinExec(PAnsiChar(AnsiString(s)),SW_SHOW);
  //WinExecAndWait32(s,SW_SHOWNORMAL)
  //ShellExecute (0, Nil, pchar(sAux_Pasta_NFE+'MPIPE.EXE'), pchar(' -TXT'+' '+sOp_File),nil, SW_SHOWNORMAL);
  //ShellExecute(Application.Handle, Nil, PChar('G:\Pro-Analise\BinNovo\VisualR4.exe '), PChar(s),nil, SW_SHOWNORMAL);

end;

(******************************************************************************)

procedure TRelVisualBlue.Add_Campo(iOp_Opcao, iOp_Tamanho: integer; sOp_Campo_Grupo, sOp_Alinha, sOP_Formato, sOp_Nome, sOp_Descricao: String);
begin
  if (sOp_Campo_Grupo <> 'D') and (sOp_Campo_Grupo <> 'G') then sOp_Campo_Grupo := 'D';
  DefinicaoCampos.Add(sOp_Campo_Grupo+IntToStr(iOp_Opcao)+';'+IntToStr(iOp_Tamanho)+';'+sOp_Alinha+';'+sOP_Formato+';'+sOp_Nome+';'+sOp_Descricao);
end;

(******************************************************************************)

procedure TRelVisualBlue.Limpa_Campos;
begin
  DefinicaoCampos.Clear;
end;

(******************************************************************************)

procedure TRelVisualBlue.SetCampos(Value: TStrings);
begin
  if Value <> FCampos then FCampos.Assign(Value);
end;

(******************************************************************************)

procedure TRelVisualBlue.SetCabecalhos(Value: TStrings);
begin
  if Value <> FCabecalhos then FCabecalhos.Assign(Value);
end;

(******************************************************************************)

procedure TRelVisualBlue.SetFonte(Value: TFont);
begin
  if Value <> FFonte then FFonte.Assign(Value);
end;

(******************************************************************************)

// V1 by Pat Ritchey, V2 by P.Below
function TRelVisualBlue.WinExecAndWait32(CommandLine: string; ShowWindow: Word): DWORD;

  procedure WaitFor(ProcessHandle: THandle);
  var
    msg: TMsg;
    ret: DWORD;
  begin
    repeat
      ret := MsgWaitForMultipleObjects(
               1,             { 1 handle to wait on }
               ProcessHandle, { the handle }
               False,         { wake on any event }
               INFINITE,      { wait without timeout }
               QS_PAINT or    { wake on paint messages }
               QS_SENDMESSAGE { or messages from other threads }
               );
      if ret = WAIT_FAILED then Exit; { can do little here }
      if ret = (WAIT_OBJECT_0 + 1) then
      begin
        { Woke on a message, process paint messages only. Calling
          PeekMessage gets messages send from other threads processed. }
        while PeekMessage(msg, 0, WM_PAINT, WM_PAINT, PM_REMOVE) do
          DispatchMessage(msg)
      end
    until ret = WAIT_OBJECT_0
  end;

var
  zAppName: array[0..512] of Char;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, CommandLine);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := Sizeof(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := ShowWindow;
  if not CreateProcess(nil,
    zAppName,             { pointer to command line string }
    nil,                  { pointer to process security attributes }
    nil,                  { pointer to thread security attributes }
    False,                { handle inheritance flag }
    CREATE_NEW_CONSOLE or { creation flags }
    NORMAL_PRIORITY_CLASS,
    nil,                  { pointer to new environment block }
    nil,                  { pointer to current directory name }
    StartupInfo,          { pointer to STARTUPINFO }
    ProcessInfo)          { pointer to PROCESS_INF }
  then
    Result := DWORD(-1)   { failed, GetLastError has error code }
  else
  begin
     WaitFor(ProcessInfo.hProcess);
     GetExitCodeProcess(ProcessInfo.hProcess, Result);
     CloseHandle(ProcessInfo.hProcess);
     CloseHandle(ProcessInfo.hThread)
  end
end;

end.
