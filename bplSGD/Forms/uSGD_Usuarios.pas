unit uSGD_Usuarios;

interface                               

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, bfdbGrid, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit, bfdbEdit, DBGrids, RelVisualBlue;

type
  TfmSGD_USUARIOS = class(TForm)
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    qr: TSQLQuery;
    ds: TDataSource;
    qrUSUARIO: TStringField;
    qrMAIL: TStringField;
    qrUSU_INCLUI: TStringField;
    qrUSU_ALTERA: TStringField;
    qrDT_ALTERA: TSQLTimeStampField;
    qrIDALT: TStringField;
    qrIDALTERADO: TStringField;
    qrSENHA: TStringField;
    cdsUSUARIO: TStringField;
    cdsMAIL: TStringField;
    cdsUSU_INCLUI: TStringField;
    cdsUSU_ALTERA: TStringField;
    cdsDT_ALTERA: TSQLTimeStampField;
    cdsIDALT: TStringField;
    cdsIDALTERADO: TStringField;
    cdsSENHA: TStringField;
    pgc: TPageControl;
    tsCadastro: TTabSheet;
    tsConsulta: TTabSheet;
    GroupBox1: TGroupBox;
    btConsulta: TBitBtn;
    btSalva: TBitBtn;
    btDesiste: TBitBtn;
    btExclui: TBitBtn;
    GroupBox2: TGroupBox;
    bfdbEdit1: TbfdbEdit;
    bfdbEdit2: TbfdbEdit;
    btSai: TBitBtn;
    dbgConsulta: TbfdbGrid;
    btInclui: TBitBtn;
    btEditar: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    edtConsulta: TbfEdit;
    btTransporta: TBitBtn;
    btImprime: TBitBtn;
    RelVisual: TRelVisualBlue;
    btCopiaUsuario: TButton;
    qrApoio: TSQLQuery;

    procedure Direitos;
    function Pode_Salvar: boolean;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

    procedure btConsultaClick(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure tsConsultaShow(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgConsultaKeyPress(Sender: TObject; var Key: Char);

    procedure btIncluiClick(Sender: TObject);
    procedure btSalvaClick(Sender: TObject);
    procedure btDesisteClick(Sender: TObject);
    procedure btExcluiClick(Sender: TObject);
    procedure btSaiClick(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspUpdateError(Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsAfterPost(DataSet: TDataSet);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure cdsAfterEdit(DataSet: TDataSet);
    procedure cdsAfterInsert(DataSet: TDataSet);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure cdsAfterCancel(DataSet: TDataSet);
    procedure cdsAfterDelete(DataSet: TDataSet);
    procedure btTransportaClick(Sender: TObject);
    procedure btImprimeClick(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCopiaUsuarioClick(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);

  private
    procedure HabilitaControles;
    { Private declarations }
  public
    cCorBluefield, cCorNormal : tColor;
    sRetorno,
    sEmpresa, sUsuarioCopia,
    sUsuario, sPath_Local, sBancoDeDados: string;
    bCopiaAcessos,
    bDBAberto, bModal,
    bCad, bInc, bAlt, bExc : boolean;
    dtmCon : TdtmConexao;
    id : string;
    iEmp : integer;
    { Public declarations }
  end;

var
  fmSGD_USUARIOS: TfmSGD_USUARIOS;
const
  sCodProg : string = 'SGD001';

implementation

uses uFuncoesDB, uFuncoes;

{$R *.dfm}

function SGD001(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGD_USUARIOS.Create(Application) do
  begin;
    bModal := bOpModal;

    if bModal then
    begin
      FormStyle := fsStayOnTop;
      Visible := false;
      BorderStyle := bsDialog;
//    Position := poScreenCenter;
    end;

    sUsuario := sOpUsuario;
    sPath_Local := sOpLocal; sBancoDeDados := sOpDBSel;
    cCorBluefield := cOpBlueField;
    cCorNormal := cOpNormal;

     iEmp := iEmpresa;
     sEmpresa := Query(' select * from SGC_EMPRESAS where ID = '+IntToStr(iEmp),sPath_Local,'NOME');

    Direitos;
    //desabilitar em telas com muitos dados
    btConsultaClick(btConsulta);

    if bModal then
    begin
      ShowModal;
      if ModalResult = mrOk
      then result := pchar(sRetorno);
      Release;
    end
    else Show;

  end;
end;

procedure TfmSGD_USUARIOS.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsUSUARIO.AsString+';'
               ;

    ModalResult := mrOk;
  end;
end;

procedure TfmSGD_USUARIOS.btCopiaUsuarioClick(Sender: TObject);
var s : string;
begin
  if cds.IsEmpty then exit;

  if InputQuery('Novo usuário','',s) then
  begin
    if trim(s) = '' then exit;
    s := UpperCase(s);
    sUsuarioCopia := cdsUSUARIO.AsString;
    btIncluiClick(btInclui);
    cdsUSUARIO.AsString := s;
    bCopiaAcessos := true;
    btSalvaClick(self);
  end;
end;

procedure TfmSGD_USUARIOS.FormCreate(Sender: TObject);
begin
  bDBAberto := false;

  btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');
  btImprime.Glyph.LoadFromResourceName(HInstance,'PRINT');
  btInclui.Glyph.LoadFromResourceName(HInstance,'INC');
  btSalva.Glyph.LoadFromResourceName(HInstance,'SALVA');
  btDesiste.Glyph.LoadFromResourceName(HInstance,'DESIST');
  btExclui.Glyph.LoadFromResourceName(HInstance,'EXC');
  btSai.Glyph.LoadFromResourceName(HInstance,'SAI');
  btEditar.Glyph.LoadFromResourceName(HInstance,'EDIT');

  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGD_USUARIOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGD_USUARIOS := nil;
    Action := caFree;
  end;
end;

procedure TfmSGD_USUARIOS.HabilitaControles;
begin
  btInclui.Enabled     := bInc and ( not(cds.State in [dsInsert, dsEdit]));
  btSalva.Enabled   := ((cds.State in [dsInsert]) and bInc)
                    or ((cds.State in [dsEdit]) and bAlt)
                    ;
  //BtnEditar.Enabled   := (DSPadrao.DataSet.State in [dsBrowse]);
  btExclui.Enabled  := bExc and (cds.State in [dsBrowse, dsEdit]);
 // btDesiste.Enabled := (cds.State in [dsInsert, dsEdit]);
//  BtnPesquisa.Enabled := not (DSPadrao.DataSet.State in [dsInsert, dsEdit]);
btCopiaUsuario.Enabled     := bInc and ( not(cds.State in [dsInsert, dsEdit]));
end;

procedure TfmSGD_USUARIOS.btConsultaClick(Sender: TObject);
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGD_USUARIOS);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select * from sgd_usuarios ');
    if trim(edtConsulta.Text) <> ''
    then SQL.Add(' where USUARIO = '''+trim(edtConsulta.Text)+''' ');
  end;

  if cds.Active
  then cds.Close;

  dbgConsulta.DataSource := ds;
  cds.Open;

  if not cds.IsEmpty then dbgConsulta.SetFocus;

  HabilitaControles;
end;

procedure TfmSGD_USUARIOS.cdsAfterPost(DataSet: TDataSet);
var
  td : TTransactionDesc;
begin
  td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  td.IsolationLevel := xilREADCOMMITTED;
  qr.SQLConnection.StartTransaction(td);
  try
    id := cdsUSUARIO.AsString;
    cds.ApplyUpdates(-1);

    if bCopiaAcessos then
    with qrAPoio do
    begin
      SQLConnection := dtmCon.SQLDB;
      if active then close;
      SQL.Clear;
      SQL.Add('insert into SGD_USUARIOS_ACESSO ( USUARIO, ACESSO, CAD, INC, ALT');
      SQL.Add(', EXC, USU_INCLUI , MODULO, GRUPOMENU ) ');

      SQL.Add('select :un, ACESSO, CAD, INC, ALT');
      SQL.Add(', EXC, USU_INCLUI , MODULO, GRUPOMENU ');
      SQL.Add('from SGD_USUARIOS_ACESSO where usuario = :uc ');
      ParamByName('uc').AsString := sUsuarioCopia;
      ParamByName('un').AsString := cdsUSUARIO.AsString;
      ExecSQL;
    end;

    qr.SQLConnection.Commit(td);

    cdsUSUARIO.ReadOnly := true;
    cds.Refresh;

    HabilitaControles;

    cds.Locate('USUARIO',id,[]);
    pgc.ActivePage := tsConsulta;
  except
    on e : Exception do
    begin
      qr.SQLConnection.Rollback(td);
      MessageBox(Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      cds.Cancel;
      cds.CancelUpdates;
      cds.Refresh;
      HabilitaControles;
      exit;
    end;
  end;
  bCopiaAcessos := false;
end;

procedure TfmSGD_USUARIOS.cdsBeforePost(DataSet: TDataSet);
begin
  cdsIDALTERADO.AsString := cdsIDALT.AsString;
end;

procedure TfmSGD_USUARIOS.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGD_USUARIOS.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGD_USUARIOS.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGD_USUARIOS.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
                                 DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
                                 var Applied: Boolean);
{var
  Campo : TField;
  SQLStmt, Tabela : String;
  CustomSQLDataSet : TCustomSQLDataSet;^}
begin
{não tem autoincremento nos usuarios


  case UpdateKind of
    ukInsert: // Inserindo um registro
    begin
      //showmessage('aqui');
      Campo := DeltaDS.Fields[0];
//      showmessage(campo.FieldName);
      if (Campo.DataType = ftInteger) and Campo.IsNull then
      begin

        Tabela := UpperCase(IProviderSupport(SourceDS).PSGetTableName);
//        showmessage(Tabela);

        SQLStmt := Format('SELECT GEN_ID(GEN_%s_ID, 1) FROM RDB$DATABASE', [Tabela]);

        dtmCon.SQLDB.Execute(SQLStmt, nil, @CustomSQLDataSet);

        if Assigned(CustomSQLDataSet) then
        begin

          DeltaDS.Edit;
          Campo.NewValue := CustomSQLDataSet.Fields[0].AsInteger;
          DeltaDS.Post;
          id := CustomSQLDataSet.Fields[0].AsInteger;
//          showmessage(IntToStr(CustomSQLDataSet.Fields[0].AsInteger));

          SysUtils.FreeAndNil(CustomSQLDataSet);

        end;
      end;
    end;
  end;
  }
end;
procedure TfmSGD_USUARIOS.dbgConsultaDblClick(Sender: TObject);
begin
  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);
end;


procedure TfmSGD_USUARIOS.cdsNewRecord(DataSet: TDataSet);
begin
  cdsUSUARIO.ReadOnly := false;
  HabilitaControles;
end;

procedure TfmSGD_USUARIOS.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsUSUARIO.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGD_USUARIOS.cdsAfterDelete(DataSet: TDataSet);
var
  td : TTransactionDesc;
begin
  td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  td.IsolationLevel := xilREADCOMMITTED;
  qr.SQLConnection.StartTransaction(td);
  try
//    id := cdsUSUARIO.AsString;
    cds.ApplyUpdates(-1);

    qr.SQLConnection.Commit(td);

    cdsUSUARIO.ReadOnly := true;
    cds.Refresh;

    HabilitaControles;
//    cds.Locate('USUARIO',id,[]);
  except
    on e : Exception do
    begin
      qr.SQLConnection.Rollback(td);
      MessageBox(Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    end;
  end;
end;

procedure TfmSGD_USUARIOS.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
end;

procedure TfmSGD_USUARIOS.btImprimeClick(Sender: TObject);
begin
 if (not cds.Active) or cds.IsEmpty then exit;

  with RelVisual do
  begin
    TituloRelatorio := Caption;

    Cabecalho1Esquerda := sEmpresa;
    Cabecalho2Centro := '';
    if edtConsulta.Text <> '' then
    Cabecalho3Esquerda := ('Filtrando por: '+edtConsulta.Text);

    Cabecalhos.Clear;

    Limpa_Campos;
    DefinicaoCampos.Add('D2;20;E;;USUARIO;Usuário');
    DefinicaoCampos.Add('D0;100;E;;MAIL;e-Mail');
    Execute;
  end;


  end;

procedure TfmSGD_USUARIOS.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then exit;
  if not bCad then Exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then cds.Insert
       else exit;
  pgc.ActivePage := tsCadastro;
  bfdbEdit1.SetFocus;
  HabilitaControles;
end;

procedure TfmSGD_USUARIOS.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
  bCopiaAcessos := false;
end;

procedure TfmSGD_USUARIOS.btExcluiClick(Sender: TObject);
begin
  if trim(cdsUSUARIO.AsString) = 'SYSDBA' then
  begin
    MessageBox(Handle, pchar('SYSDBA não pode ser excluido do sistema!'), 'Aviso', MB_ICONWARNING);
    Exit;
  end;

  if MessageBox(Handle, pchar('Confirma a exclusão deste registro ?'), 'Excluir', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then Exit;
  cds.delete;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGD_USUARIOS.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGD_USUARIOS.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if cds.Active
  and dbgConsulta.CanFocus
  then dbgConsulta.SetFocus;
end;

procedure TfmSGD_USUARIOS.edtConsultaChange(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGD_USUARIOS.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgConsulta.SetFocus;
end;

procedure TfmSGD_USUARIOS.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGD_USUARIOS.dbgConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin


  if key = chr(vk_return) then
  begin
    if bModal
    and not cds.IsEmpty
    then btTransportaClick(self);
    btIncluiClick(btEditar);
  end;
end;


procedure TfmSGD_USUARIOS.
dbgConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f9 then edtConsulta.SetFocus;
end;

procedure TfmSGD_USUARIOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_escape) then
  begin
    if btDesiste.Enabled
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGD_USUARIOS.Direitos;
var
  s : string;
begin
  bCad := false;
  bInc := false;
  bAlt := false;
  bExc := false;

  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGD_USUARIOS);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;


  s := DireitosUsuario(sUsuario,sCodProg,dtmCon.qrApoio);
  if trim(s) <> '' then
  begin
    bCad := Separa_String(s,1) = 'S';
    bInc := Separa_String(s,2) = 'S';
    bAlt := Separa_String(s,3) = 'S';
    bExc := Separa_String(s,4) = 'S';
  end;

  btExclui.Visible := bExc;
  btInclui.Enabled := bCad and bInc;
  btEditar.Enabled := bCad;
  tsCadastro.TabVisible := bCad;

  if not bExc
  then dsp.Options := dsp.Options + [poDisableDeletes];
  if not bInc
  then dsp.Options := dsp.Options + [poDisableInserts];
  if not bAlt
  then dsp.Options := dsp.Options + [poDisableEdits];
end;

(******************************************************************************)

function TfmSGD_USUARIOS.Pode_Salvar: boolean;
begin
    result := false;

  if trim(cdsUSUARIO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe um nome de usuário.'), 'Aviso', MB_ICONWARNING);
    bfdbEdit1.SetFocus;
    Exit;
  end;

{  if trim(cdsNOME.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe a descrição.'), 'Aviso', MB_ICONWARNING);
    bfdbEdit2.SetFocus;
    Exit;
  end;}
       
  result := true;
end;

(******************************************************************************)
//exports tem que ser a ultima coisa antes do end.
exports
  SGD001;


end.
