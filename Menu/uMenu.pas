unit uMenu;
(******************************************************************************)
(*  Sistemoto     - 14/12/2021                                                *)
(*  SGD Bluefield - 01/04/2017                                                *)
(******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, ImgList, Menus, ExtDlgs, jpeg, udtmConexao,
  ActnList;

type

  TfmMenu = class(TForm)
    MainMenu: TMainMenu;
    Opes1: TMenuItem;
    Sair1: TMenuItem;
    StatusBar: TStatusBar;
    ImageList: TImageList;
    ImagemdeFundo1: TMenuItem;
    N1: TMenuItem;
    OpenDLGFundo: TOpenPictureDialog;
    Sobre1: TMenuItem;
    AlterarSenha1: TMenuItem;
    N3: TMenuItem;
    AtualizaoSQL1: TMenuItem;
    N2: TMenuItem;
    Encontrarprograma1: TMenuItem;
    N5: TMenuItem;
    opendlg: TOpenDialog;
    memSQL: TMemo;
    Cascade1: TMenuItem;
    N4: TMenuItem;
    Closeall1: TMenuItem;

    Procedure MontaMenu;
    procedure Informacao(sOp : string);
    procedure Sair1Click(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure FormCreate(Sender: TObject);
    procedure ImagemdeFundo1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure AlterarSenha1Click(Sender: TObject);
    procedure Encontrarprograma1Click(Sender: TObject);
    procedure AtualizaoSQL1Click(Sender: TObject);
    procedure Closeall1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);

  private
    { Private declarations }

    //MontaMenu
    procedure AddModulo(sOP: string);
    procedure AddModuloSub(sOpNome, sOpCod: string; idModulo, idTag: integer; bClick: boolean);
    procedure AddTela(sOpNome, sOpCod: string; idModulo, idSub, idTag: integer);
    procedure AbreTelaMenu(Sender: TObject);

  public
    Fundo: TJPEGImage;
    dtmCon : TdtmConexao;
    cCorBluefield, cCorNormal : tColor;

    idTela : integer;
    iEmp : integer;
    sUsuario, sEmpresa, sCNPJ, sCidade,
    sPath_Fundo, sPath_Temp, sPath_Local : string;
    { Public declarations }
  end;

var
  fmMenu: TfmMenu;

implementation

uses uFuncoes, uAltera_Senha, uFuncoesDB, uFuncoesTelas;

{$R *.dfm}

(******************************************************************************)

procedure TfmMenu.Sobre1Click(Sender: TObject);
begin
  MessageBox(Handle, pchar('SisteMoto V2'+#13
                          +'Vers?o 1.1 | 25/01/2022'+#13
                          +'(c)2022 Provisual TI'
                          ), 'SisteMoto', MB_ICONINFORMATION);
end;

(******************************************************************************)

//monta menu
procedure TfmMenu.MontaMenu;
var
 sNome_Tela,
 sModulo, sSub,
 sItemModulo, sItemSub, sItemTela: string;
 iIDModulo, iIDSub, iIDTag, iItemSub : integer;
begin
//  Abre_Alertas;

  iIDModulo := 1;
  iIDSub := 0;
  iIDTag := 0;

  dtmCon := TdtmConexao.Create(Application);
  AbreDataModule(dtmCon,sPath_Local);

  with dtmCon.qr do
  begin
    if active then close;
    SQL.Clear;
    SQL.Add(' select e.*, c.nome nome_cidade from SGC_EMPRESAS e ');
    SQL.Add(' left join SGC_cidades c on c.id = e.cod_cidade ');
    SQL.Add(' where e.ID = 1 ');
    Open;

    iEmp := 1;
    sEmpresa := FieldByName('NOME').AsString;
    sCNPJ := CgcCpfPic(FieldByName('CNPJ').AsString);
    sCidade := FieldByName('NOME_CIDADE').AsString+' | '+FieldByName('UF').AsString;
    Close;

    SQL.Clear;
    SQL.Add(' select u.acesso, a.nome nome_acesso, a.mostramenu, u.modulo, m.nome nome_modulo, u.grupomenu, g.nome nome_grupo ');
    SQL.Add(' from SGD_USUARIOS_ACESSO u ');
    SQL.Add(' left join sgd_acessos a on a.acesso = u.acesso ');
    SQL.Add(' left join sgd_modulos m on m.modulo = u.modulo ');
    SQL.Add(' left join sgd_grupomenu g on g.id = u.grupomenu ');
    SQL.Add(' where u.usuario = :u ');
    SQL.Add(' and a.mostramenu = ''S'' ');
    SQL.Add(' order by u.USUARIO, m.nome, u.modulo, u.grupomenu, u.ACESSO ');
    ParamByName('u').AsString := sUsuario;
    Open;

    sItemModulo  := '';
    sItemSub := '';
    sItemTela := '';
    sNome_Tela := '';
    iItemSub := -1;
    While not Eof do
    begin

      sItemModulo := Trim(FieldByName('NOME_MODULO').AsString);
      sItemSub := Trim(FieldByName('NOME_GRUPO').AsString);
      sItemTela := Trim(FieldByName('ACESSO').AsString);
      sNome_Tela := Trim(FieldByName('ACESSO').AsString)+' | '+trim(FieldByName('NOME_ACESSO').AsString);

      iItemSub := FieldByName('grupomenu').AsInteger;

      if sItemModulo <> sModulo then
      begin
        AddModulo(sItemModulo); // Cria o Modulo no Menu
        if sModulo <> '' then
        begin
          iIDModulo := iIDModulo + 1;
          iIDSub := 0;
          sSub := '';
        end;
        sModulo := sItemModulo;
      end;

      if iItemSub = 0 then
      begin
        AddModuloSub(sNome_Tela,sItemTela, iIDModulo, iIDTag, true); // Cria os Programas sem entidade
        iIDSub := iIDSub + 1;
      end
      else
      begin
        if sItemSub <> sSub then
        begin
           AddModuloSub(sItemSub, sItemSub, iIDModulo, iIDTag, false); // Cria a Entidade no Menu
           if sSub <> ''
           then iIDSub := iIDSub + 1;
           sSub := sItemSub;
        end;

        AddTela(sNome_Tela, sItemTela, iIDModulo, iIDSub, iIDTag); // Cria os Programas no Menu
      end;

      iIDTag := iIDTag + 1;

      Next;
    end;

    close;
  end;

  FechaDataModule(dtmCon);

end;

(******************************************************************************)

procedure TfmMenu.AbreTelaMenu(Sender: TObject);
var
//  i_Mes_Aut, i_Ano_Aut,
  iIDTag : integer;
  ssTela, ssBPL: string;
  //d : tDate;
begin
  //d := Data_Servidor(qrApoio);
  //i_Mes_Aut  := StrToInt(FormatDateTime('mm',d));
  //i_Ano_Aut := StrToInt(FormatDateTime('yyyy',d));
  //if (i_Mes_Aut <> iMes_Aut) or (i_Ano_Aut <> iAno_Aut) then fmGerenciador.Autorizacoes;
  //bo_Zera_Emp := false;

  iIDTag := (Sender as TMenuItem).Tag;
  ssTela := (Sender as TMenuItem).Hint;
  ssBPL := copy(ssTela,1,3)+'.bpl';
  inc(idTela);
  WindowMenu := Opes1;
  AbreTela(ssTela,ssBPL, sUsuario, sPath_Local, '','FIREBIRD', cCorBluefield, cCorNormal, iEmp, 0 );


end;

(******************************************************************************)

procedure TfmMenu.AddModulo(sOP: string);
var
 Item: TMenuItem;
 sNomeItem: string;

begin
  Item := TMenuItem.Create(self);
  Item.Clear;
  Item.Caption := sOP;
  Item.ImageIndex:=-1;
  Item.AutoHotkeys := maAutomatic;
  Item.Break := mbNone;

  sNomeItem := Item.Caption;
  while Pos(' ', sNomeItem) > 0 do
        sNomeItem[Pos(' ', sNomeItem)] := '_';
  while Pos('/', sNomeItem) > 0 do
        sNomeItem[Pos('/', sNomeItem)] := '_';
  while Pos('&', sNomeItem) > 0 do
        sNomeItem[Pos('&', sNomeItem)] := '_';

  Item.Name := sNomeItem;
  MainMenu.Items.Add(Item);
end;

procedure TfmMenu.AddModuloSub(sOpNome, sOpCod: string; idModulo, idTag: integer; bClick: boolean);
var
 Item: TMenuItem;
 iIDSub : integer;
begin
 Item := TMenuItem.Create(self);
 Item.Clear;
 Item.Caption := sOpNome;
 Item.Hint := sOpCod;
 Item.Tag := idTag;
 MainMenu.Items.Items[idModulo].Add(Item);

 iIDSub := MainMenu.Items.Items[idModulo].IndexOf(Item);
 if bClick then
 begin
   MainMenu.Items.Items[idModulo].Items[iIDSub].OnClick := AbreTelaMenu;
   Item.ImageIndex := 2;
 end
 else Item.ImageIndex := 11;

end;

procedure TfmMenu.AddTela(sOpNome, sOpCod: string; idModulo, idSub, idTag: integer);
var
 Item: TMenuItem;
 iIDTela: integer;
begin
  Item := TMenuItem.Create(self);
  Item.Clear;
  Item.Caption := sOpNome;
  Item.Hint := sOpCod;
  Item.Tag := idTag;
  //ExecutaPrograma := nil;

   MainMenu.Items.Items[idModulo].Items[idSub].Add(Item);
   iIDTela := MainMenu.Items.Items[idModulo].Items[idSub].IndexOf(Item);
   MainMenu.Items.Items[idModulo].Items[idSub].Items[iIDTela].OnClick := AbreTelaMenu;
   MainMenu.Items.Items[idModulo].Items[idSub].Items[iIDTela].ImageIndex:=2;
end;

(******************************************************************************)



procedure TfmMenu.Sair1Click(Sender: TObject);
begin
  Close;
end;

(******************************************************************************)

procedure TfmMenu.StatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  s : string;
begin
  with StatusBar.Canvas do
  begin
    FillRect(Rect);
    Font.Name := 'Tahoma';
    Font.Color := clWindowText;

    //Desenha as imagens de acordo com o indice de cada panel
    ImageList.Draw(StatusBar.Canvas,Rect.Left+5,Rect.Top+1,Panel.Index);

    //Escreve o texto em cada panel

    case Panel.Index of
      0 : TextOut(Rect.Left + 25, Rect.Top + 1,' ' + sUsuario);
      1 :
      begin
        if iEmp <> 0 then
          s := ' ' + IntToStr(iEmp) +' | '+ sEmpresa + ' | ' + sCNPJ + ' | ' + sCidade
          else s := '';
        TextOut(Rect.Left + 25, Rect.Top + 1,s);
      end;
    end;
  end;

end;

(******************************************************************************)

procedure TfmMenu.FormCreate(Sender: TObject);
begin
  fmMenu.cCorBluefield := clSkyBlue;
  fmMenu.cCorNormal := clWindow;

  idTela := 0;

  sPath_Temp := ExtractTempDir;
  sPath_Local := GetCurrentDir;
  sPath_Fundo := sPath_Local+'\logos\BFWP.jpg';
  if not FileExists(sPath_Fundo)
  then sPath_Fundo := sPath_Local+'\logos\BF.res';

  try
    //Fundo := TBitmap.Create;
    Fundo := TJPEGImage.Create;
    if FileExists(sPath_Fundo) then Fundo.LoadFromFile (sPath_Fundo);
  except
   // Fundo.Free;
  end;
end;

(******************************************************************************)

procedure TfmMenu.ImagemdeFundo1Click(Sender: TObject);
var
  s: string;
begin
  OpenDLGFundo.FileName := sPath_Fundo;
  if OpenDLGFundo.Execute then
  begin
    s := OpenDLGFundo.FileName;
    if FileExists(s) then
    begin
      sPath_Fundo := sPath_Local+'\logos\BFWP.jpg';
      CopyFile(pchar(s),pchar(sPath_Fundo),false);
      Fundo.Free;

      //Fundo := TBitmap.Create;
      Fundo := TJPEGImage.Create;

      WindowState := wsNormal;
      WindowState := wsMaximized;


      Fundo.LoadFromFile(sPath_Fundo);

    end
    else MessageDlg('Este arquivo n?o existe!',MtWarning,[mbOk],0);
  end;

end;

(******************************************************************************)

procedure TfmMenu.FormPaint(Sender: TObject);
var
  j, i: integer;
begin
  if (Fundo.Width <> 0) and (Fundo.Height <> 0) then
  begin

    if Fundo.Width < 400 then
    begin
      //lado a lado
      for i:= 0 to Round(Width / Fundo.Width) do
        for j := 0 to Round(Height / Fundo.Height) do
          Canvas.Draw(i * Fundo.Width, j * Fundo.Height, Fundo);
    end
    else
    begin
      //expande
      Canvas.StretchDraw(Rect(0,0,width,Height),fundo);
    end;
  end;
//  memSQL.Repaint;
//  StatusBar.Refresh;
end;

(******************************************************************************)


procedure TfmMenu.AlterarSenha1Click(Sender: TObject);
var
  s, n : string;
begin
  s := Query('select senha from SGD_USUARIOS where usuario = '''+sUsuario+''' ',sPath_Local,'SENHA');
  n := '';
  with TfmAltera_Senha.Create(Application) do
  begin
    sSenha_Atual := s;
    ShowModal;
    if ModalResult = mrOK
    then n := edtSenha.Text;
    Release;
  end;

  if trim(n) = '' then exit;

  if QueryExec(' update SGD_USUARIOS set SENHA = '''+n+''', usu_altera = '''+sUsuario+''', dt_altera = ''today'', IDALTERADO = IDALT where usuario = '''+sUsuario+''' ',sPath_Local)
  then MessageBox(Handle, pchar('Senha alterada com sucesso!'), 'Aviso', MB_ICONINFORMATION);
end;

(******************************************************************************)


procedure TfmMenu.Encontrarprograma1Click(Sender: TObject);
var
  s, ssBPL : string;
begin
  s := '';
  if not InputQuery('Encontrar tela','Digite o c?digo da tela que deseja encontrar.',s)
  then Exit;
  if trim(s) = '' then exit;

  s := AnsiUpperCase(s);
  dtmCon := TdtmConexao.Create(Application);
  AbreDataModule(dtmCon,sPath_Local);

  with dtmCon.qr do
  begin
    if active then close;
    SQL.Clear;
    SQL.Add(' select u.acesso, a.nome nome_acesso, a.mostramenu, u.modulo, m.nome nome_modulo, u.grupomenu, g.nome nome_grupo ');
    SQL.Add(' from SGD_USUARIOS_ACESSO u ');
    SQL.Add(' left join sgd_acessos a on a.acesso = u.acesso ');
    SQL.Add(' left join sgd_modulos m on m.modulo = u.modulo ');
    SQL.Add(' left join sgd_grupomenu g on g.id = u.grupomenu ');
    SQL.Add(' where u.usuario = :u ');
    SQL.Add(' and u.acesso = :a ');
    SQL.Add(' and a.mostramenu = ''S'' ');
    ParamByName('u').AsString := sUsuario;
    ParamByName('a').AsString := s;
    Open;
    if IsEmpty
    then MessageBox(Handle, pchar('Tela '+s+' n?o encontrada!'), 'Aviso', MB_ICONWARNING)
    else
    begin
      ssBPL := FieldByName('modulo').AsString + '.bpl';

      //AbreTela(s,copy(s,1,3)+'.bpl', sUsuario, sPath_Local, '', 'FIREBIRD', cCorBluefield, cCorNormal, iEMp, 0 );
    end;
    close;
  end;

  FechaDataModule(dtmCon);

  if trim(ssBPL) <> '' then
  begin
    WindowMenu := Opes1;
    AbreTela(s,ssBPL, sUsuario, sPath_Local, '','FIREBIRD', cCorBluefield, cCorNormal, iEmp, 0 );
  end;


end;

procedure TfmMenu.AtualizaoSQL1Click(Sender: TObject);
var
  slAtualiza : TStringList;
  i : integer;
begin
{
  if MessageBox(Application.Handle, pchar('N?o ? recomendado fazer atualiza??es no banco de dados enquanto ele est? em uso!'+#13+
                                          'Feche todas as janelas e certifique-se de que nenhum usu?rio e est? conectado antes de continuar.'+#13+
                                          'Deseja continuar com a atualiza??o?'), 'Importante!!', MB_YESNO+MB_ICONWARNING) = idNo
  then exit;
 }
  if (opendlg.Execute) and (FileExists(opendlg.FileName)) then
  begin
    slAtualiza := TStringList.Create;
    slAtualiza.LoadFromFile(opendlg.FileName);
    i := 0;
    if trim(slAtualiza.Strings[i]) <> '[INICIO]' then
    begin
      MessageBox(Application.Handle, 'O Arquivo n?o ? v?lido.', 'Erro', MB_ICONERROR);
      slAtualiza.Free;
    end
    else
    begin
      try

        Informacao('Abrindo banco de dados...');
        dtmCon := TdtmConexao.Create(Application);
        AbreDataModule(dtmCon,sPath_Local);

        memSQL.Clear;
//        memSQL.Visible := true;
        Informacao('Abrindo Transa??o...');

        AbreTransacao(dtmCon);


        Informacao('Abrindo arquivo de atualiza??o...');

        while i < slAtualiza.Count do
        begin
          Informacao('Lendo arquivo de atualiza??o...');

          if trim(slAtualiza.Strings[i]) = '[INICIO]' then
          begin
            i := i + 1;
            memSQL.Clear;
            while trim(slAtualiza.Strings[i]) <> '[FIM]' do
            begin
              memSQL.Lines.Add(slAtualiza.Strings[i]);
              Informacao('Lendo arquivo de atualiza??o...');
              //showmessage(slAtualiza.Strings[i]);
              i := i + 1;
            end;
            with dtmCon.qr do
            begin
              if active then close;
              SQL.Clear;
              sql.Text := memSQL.Text;

              Informacao('Executando script SQL...');
              ExecSQL;
            end;
          end;
          if trim(slAtualiza.Strings[i]) = '[COMMIT]' then
          begin
            Informacao('Commit individualizado...');
            dtmCon.SQLDB.Commit(dtmCon.td);
            dtmCon.SQLDB.StartTransaction(dtmCon.td);
            Informacao('ok!');
          end;
          inc(i);
        end;

        Informacao('Fechando transa??o...');
        dtmCon.SQLDB.Commit(dtmCon.td);

        Informacao('Atualiza??o realizada!');

        RenameFile(opendlg.FileName,opendlg.FileName+'1');
        MessageBox(Application.Handle, 'Atualiza??o conclu?da.', 'Conclu?do', MB_ICONINFORMATION);
        Informacao('');

        memSQL.Clear;
//        memSQL.Visible := false;
        FechaDataModule(dtmCon);
      except
        on e : Exception do
        begin
          Informacao('Erro ao rodar atualza??o!');
          dtmCon.SQLDB.Rollback(dtmCon.td);
          MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
          memSQL.Clear;
//          memSQL.Visible := false;
          FechaDataModule(dtmCon);
          exit;
        end;

      end;
    end;

  end;
end;

(******************************************************************************)

procedure TfmMenu.Informacao(sOp: string);
begin
  StatusBar.Panels[2].Text := sOp;
  Application.ProcessMessages;
end;

procedure TfmMenu.Closeall1Click(Sender: TObject);
var i : integer;
begin
  for i := 0 to MDIChildCount-1
  do MDIChildren[i].Close;
end;

procedure TfmMenu.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

end.
