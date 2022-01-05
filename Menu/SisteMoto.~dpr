program SisteMoto;

uses
  Forms,
  uMenu in 'uMenu.pas' {fmMenu},
  udtmConexao in '..\Units\udtmConexao.pas' {dtmConexao: TDataModule},
  uFuncoes in '..\Units\uFuncoes.pas',
  uSplash in 'uSplash.pas' {fmSplash},
  uLogin in '..\Units\uLogin.pas' {fmLogin},
  uFuncoesDB in '..\Units\uFuncoesDB.pas',
  uAltera_Senha in '..\Units\uAltera_Senha.pas' {fmAltera_Senha},
  uFuncoesTelas in '..\Units\uFuncoesTelas.pas';

{$R *.res}
{$R BFBMP.res}
var
  u, s : string;

begin
  Application.Initialize;
  Application.Title := 'SisteMoto';

  fmSplash := TfmSplash.Create(nil);
  //fmSplash.lbl.Caption := 'Embacaps';
  //fmSplash.lbls.Caption := 'Embacaps';
  //fmSplash.lbl2.Caption := 'provisualpoa@gmail.com';
  fmSplash.Show;
  fmSplash.Refresh;
  fmSplash.Informacao('Bem vindo!');
  u := LoginDB('','');
  fmSplash.Informacao('Verificando usuário...');
  if u <> '' then
  begin
    fmSplash.Informacao('Bem vindo!');
    Application.CreateForm(TfmMenu, fmMenu);
    fmMenu.Caption := 'SisteMoto | '+u;
    fmMenu.sUsuario := u;
    fmSplash.Informacao('Montando menu...');
    fmMenu.MontaMenu;

    fmSplash.Informacao('Pronto!');
    fmsplash.Close;
    Application.Run;
  end
  else Application.Terminate;


end.
