program ControleAbastecimento;

uses
  Vcl.Forms,
  uVPrincipal in 'View\uVPrincipal.pas' {FrmPrincipal},
  uCHelpersCA in 'Controller\uCHelpersCA.pas',
  uMConexao in 'Model\uMConexao.pas',
  uCFuncoesGerais in 'Controller\uCFuncoesGerais.pas',
  uMPosto in 'Model\uMPosto.pas',
  uMTanque in 'Model\uMTanque.pas',
  uCPostos in 'Controller\uCPostos.pas',
  UCTanques in 'Controller\UCTanques.pas',
  uMAbastecimento in 'Model\uMAbastecimento.pas',
  uMBomba in 'Model\uMBomba.pas',
  uCAbastecimentos in 'Controller\uCAbastecimentos.pas',
  uCBombas in 'Controller\uCBombas.pas',
  uIoAbastecimentos in 'Controller\Interface\uIoAbastecimentos.pas',
  uICPostos in 'Controller\Interface\uICPostos.pas',
  uVRelAbastecimentos in 'View\uVRelAbastecimentos.pas' {FrmVRelAbastecimentos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
