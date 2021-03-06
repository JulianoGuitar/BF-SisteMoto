unit uSGV_RECIBO_COMANDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, udtmConexao, Buttons, RpDefine, RpBase, RpSystem, RpMemo ,  bfEdit,
  FMTBcd, DB, SqlExpr, RpRender, RpRenderPDF, DateUtils, Mask, bfNumEdit;

type
  TfmSGV_RECIBO_COMANDA = class(TForm)
    btImprime: TBitBtn;
    RvSystem1: TRvSystem;
    qr: TSQLQuery;
    RvRenderPDF1: TRvRenderPDF;
    cbxParceiros: TComboBox;
    Label2: TLabel;
    Label1: TLabel;
    edtNr_Comanda: TbfNumEdit;
    btSair: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RvSystem1Print(Sender: TObject);
    procedure btImprimeClick(Sender: TObject);
    procedure RvSystem1BeforePrint(Sender: TObject);
    procedure cbxParceirosKeyPress(Sender: TObject; var Key: Char);
    procedure btSairClick(Sender: TObject);
  private
    procedure ParametrosIniciais;
    { Private declarations }
  public
  cCorBluefield, cCorNormal : tColor;


  sMATRICULA,  sNOME, sENDERECO, sNACIONALIDADE, sESTADO_CIVIL, sRG, sRG_ORGAO, sUF,  sCPF, sNUMERO_ENDERECO, sCIDADE, sBAIRRO,
  sCNPJ, sENDERECO_EMP, sNUMERO_EMP, sBAIRRO_EMP, sCIDADE_EMP, sFUNCAO, sDT_ADMISSAO, sDT_TERMINO, sDT_EXPERIENCIA, sCEP, sCBO, sCNAE, sSALARIO, sSALARIO_EXTENSO , sCARGO,
  sFONE, sCTPS, sCTPS_SERIE,sCTPS_UF ,sHORAS_TRABALHADAS, sLOCAL_COBRANCA, sFone_Emp, sUf_Emp, sCEP_Emp, sCompl_Emp,
  sDEP_NOME, sDEP_TIPO, sDEP_NASCTO,sTIPO_RECIBO, sLocalTrabGeral_nrInsc,

    sRetorno,
    sEmpresa,
    sUsuario, sPath_Local, sBancoDeDados: string;
    bDBAberto, bModal,
    bCad, bInc, bAlt, bExc : boolean;
    dtmCon : TdtmConexao;
    id, iEmp, iPag : integer;
    xTOTAL_DESCONTOS, xTOTAL_LIQUIDO, xBASE_INSS, xBASE_FGTS, xBASE_IRRF, xFGTS_MES, xTOTAL_VENCIMENTOS : extended;
    { Public declarations }
  end;

var
  fmSGV_RECIBO_COMANDA: TfmSGV_RECIBO_COMANDA;

const
  sCodProg : string = 'SFP307';

implementation

uses uFuncoesDB, uFuncoesTelas, uFuncoes, uExtenso;

{$R *.dfm}

function SGV307(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGV_RECIBO_COMANDA.Create(Application) do
  begin;
    bModal := bOpModal;

    if bModal then
    begin
      FormStyle := fsStayOnTop;
      Visible := false;
//      BorderStyle := bsDialog;
//    Position := poScreenCenter;
    end;
    sUsuario := sOpUsuario;
    sPath_Local := sOpLocal; sBancoDeDados := sOpDBSel;
    cCorBluefield := cOpBlueField;
    cCorNormal := cOpNormal;

    iEmp := iEmpresa;
    sEmpresa := Query(' select * from SGC_EMPRESAS where ID = '+IntToStr(iEmp),sPath_Local,'NOME');
    ParametrosIniciais;

   { Direitos;
    //desabilitar em telas com muitos dados
    btConsultaClick(btConsulta);
    }
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


procedure TfmSGV_RECIBO_COMANDA.btImprimeClick(Sender: TObject);
begin
  {if StrToIntDef(edtNr_Comanda.Text,0) = 0 then
  begin
    MessageBox(Handle, pchar('Informe o N? da comanda.'), 'Aviso', MB_ICONWARNING);
    edtNr_Comanda.SetFocus;
    Exit;
  end;  }


  //DadosFuncionario;

  RvSystem1.Execute;
end;

procedure TfmSGV_RECIBO_COMANDA.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGV_RECIBO_COMANDA.cbxParceirosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btImprime.SetFocus;
end;

procedure TfmSGV_RECIBO_COMANDA.ParametrosIniciais;
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGV_RECIBO_COMANDA);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;


  with dtmCon.qrApoio do
  begin
    if active then close;
    SQL.Clear;
    SQL.Add(' select f.nome ');
    SQL.Add(' from SGC_FAMILIA_PROD  f ');
    Open;
    while not eof do
    begin
      cbxParceiros.Items.Add(FieldByName('NOME').AsString);

      Next;
    end;
    Close;
  end;

end;

procedure TfmSGV_RECIBO_COMANDA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGV_RECIBO_COMANDA := nil;
    Action := caFree;
  end;
end;

procedure TfmSGV_RECIBO_COMANDA.FormCreate(Sender: TObject);
begin
  bDBAberto := false;

  btImprime.Glyph.LoadFromResourceName(HInstance,'PRINT');
  //btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');


end;

procedure TfmSGV_RECIBO_COMANDA.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_escape) then
  begin
    Close;
  end;
end;

procedure TfmSGV_RECIBO_COMANDA.RvSystem1BeforePrint(Sender: TObject);
begin
  with Sender as TBaseReport do
  begin
    SetPaperSize(DMPAPER_USER,80,297);
    SetFont('Arial',10);

    ClearTabs;
    SetTab(MarginLeft, pjCenter, 30, 0,BOXLINERIGHT,0);
    SetTab(na, pjLeft, 50, 0,BOXLINERIGHT,0);
    SetTab(na, pjright, 60, 0,BOXLINERIGHT,0);
    SetTab(na, pjRight, 5, 0,BOXLINERIGHT,0);
    SetTab(na, pjRight, 80, 0,BOXLINENONE,0);
    SaveTabs(1);
  end;
end;

procedure TfmSGV_RECIBO_COMANDA.RvSystem1Print(Sender: TObject);
var
  i, l : integer;
  xTop, xX, xY, xHeight : extended;
  memoBuf : TMemoBuf;
  Finished : Boolean;
  sParceiro: string;
begin
  sParceiro := '';
  if not bDBAberto then
  begin
    dtmCon := TdtmConexao.Create(fmSGV_RECIBO_COMANDA);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;
  if not bDBAberto then exit;

  with Sender as TBaseReport do
  begin
    SetFont('Arial',8);
    Newline;
    if LinesLeft <= 0 then NewPage;

    with qr do
    begin
      SQLConnection := dtmCon.SQLDB;
      if active then close;
      SQL.Clear;
      SQL.Add(' select  v.quantidade, v.cod_prod, p.nome produto ');
      SQL.Add(', v.obs '); // observa??o do item na linha de baixo
      SQL.Add(', v.tag '); // numero do tag opcional para avisar o cliente que o pedido est? pronto
      SQL.Add(', v.dt_inclui, v.comanda, v.comanda_nome '); // dados da venda no cabe?alho
      SQL.Add(', f.nome parceiro '); // loja que vende o produto colocar no cabe?alho
      SQL.Add(', v.impresso '); // controle para saber se j? foi impresso

      SQL.Add(' from SGV_VENDAS v ');

      SQL.Add(' left join sgc_produtos p on p.cod_prod = v.cod_prod ');
      SQL.Add(' left join SGC_FAMILIA_PROD f on f.ID = v.ID_FAMILIA ');

      SQL.Add(' where 1=1 ');
      //SQL.Add(' where coalesce(v.fechada,'N') = 'N' ');
      //SQL.Add(' and coalesce(v.impresso,'N') = 'N' ');
      //SQL.Add(' --and f.nome = '' ');  --sempre vai filtrar o parceiro

      if StrToInt64Def(edtNr_Comanda.Text, 0) > 0 then
      begin
        SQL.Add(' and v.comanda = '+ Trim(edtNr_Comanda.Text));
      end;

      if cbxParceiros.ItemIndex > 0 then
      begin
        SQL.Add(' and trim(f.nome) = '+ QuotedStr(Trim(cbxParceiros.Text)));
      end;

      SQL.Add(' order by f.nome, v.comanda, v.comanda_nome, v.dt_inclui ');

      Open;

      while not EOF do
      begin
        if sParceiro <> Trim(FieldByName('parceiro').AsString) then
        begin
          if sParceiro <> '' then
          begin
            NewLine;
            if LinesLeft <= 0 then NewPage;
            NewLine;
            if LinesLeft <= 0 then NewPage;
            NewLine;
            if LinesLeft <= 0 then NewPage;
            NewLine;
            if LinesLeft <= 0 then NewPage;
          end;

          Bold := True;
          sParceiro := Trim(FieldByName('parceiro').AsString);
          PrintLeft(sParceiro, MarginLeft);
          Bold := False;
          NewLine;
          if LinesLeft <= 0 then NewPage;
          NewLine;
          if LinesLeft <= 0 then NewPage;

          PrintLeft('Comanda: '+FieldByName('comanda').AsString, MarginLeft);
          Print(' - '+FieldByName('comanda_nome').AsString);
          NewLine;
          if LinesLeft <= 0 then NewPage;
          NewLine;
          if LinesLeft <= 0 then NewPage;

          PrintLeft('Data/Hora: '+FormatDateTime('dd/mm/yy hh:mm:ss', FieldByName('dt_inclui').AsDateTime), MarginLeft);
          NewLine;
          if LinesLeft <= 0 then NewPage;
          NewLine;
          if LinesLeft <= 0 then NewPage;

          PrintLeft('TAG: '+FieldByName('tag').AsString, MarginLeft);
          NewLine;
          if LinesLeft <= 0 then NewPage;
          NewLine;
          if LinesLeft <= 0 then NewPage;
        end;

        PrintLeft(FieldByName('quantidade').AsString, MarginLeft);
        Print(' - '+FieldByName('produto').AsString);
        NewLine;
        if LinesLeft <= 0 then NewPage;

        if Trim(FieldByName('obs').AsString) <> '' then
        begin
          PrintLeft(FieldByName('obs').AsString, MarginLeft);
          NewLine;
          if LinesLeft <= 0 then NewPage;
        end;

        Next;
      end;
      Close;
    end;

  end;



end;

exports
  SGV307;

end.
