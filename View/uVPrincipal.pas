unit uVPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IBX.IBDatabase, Data.DB, uMConexao,
  Vcl.Grids, Vcl.DBGrids, IBX.IBCustomDataSet, IBX.IBQuery, uCFuncoesGerais,
  Vcl.ComCtrls, Vcl.Mask, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  uCHelpersCA, uCPostos, uCBombas, uCAbastecimentos, DateUtils;

type
  TFrmPrincipal = class(TForm)
    DBGrid: TDBGrid;
    BTNovo: TButton;
    Label1: TLabel;
    GBNovoAbastecimento: TGroupBox;
    CMBBombaCombustivel: TComboBox;
    MEQuantLitros: TMaskEdit;
    MEValorTotal: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MEValorLitro: TMaskEdit;
    Label5: TLabel;
    BTSalvar: TButton;
    LNomePosto: TLabel;
    BTExcluir: TButton;
    BTCancelar: TButton;
    BTAtualizar: TButton;
    GBBotoes: TGroupBox;
    BTRelDiario: TButton;
    BTRelPeriodo: TButton;
    DTPDataIni: TDateTimePicker;
    DTPDataFim: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    procedure BTNovoClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CMBBombaCombustivelChange(Sender: TObject);
    procedure MEQuantLitrosExit(Sender: TObject);
    procedure MEValorTotalExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTExcluirClick(Sender: TObject);
    procedure BTRelDiarioClick(Sender: TObject);
    procedure BTRelPeriodoClick(Sender: TObject);
    procedure BTAtualizarClick(Sender: TObject);
  private
    { Private declarations }
    oFuncoesGerais       : TFuncoesGerais;
    oConexao             : TConexao;
    oContrPosto          : TCPostos;
    oContrBombas         : TCBombas;
    oContrAbastecimentos : TCAbastecimentos;

    procedure CarregarFuncoesGerais;
    procedure CarregarConexoes;
    procedure CarregarDadosPosto;
    procedure CarregarDadosAbastecimento;

    procedure AtualizaValorLitro;

    procedure CalcularValorTotalPorQuantidade(nQuantidade: Currency);
    procedure CalcularValorTotalPorValorTotal(nValorTotal: Currency);
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uVRelAbastecimentos;

procedure TFrmPrincipal.AtualizaValorLitro;
begin
  MEValorLitro.Text := FormatCurr('###,###,##0.00',(oContrBombas.GetValorLitro(Integer(CMBBombaCombustivel.Items.Objects[CMBBombaCombustivel.ItemIndex]))));
end;

procedure TFrmPrincipal.BTCancelarClick(Sender: TObject);
begin
  oFuncoesGerais.SetTagStatus(0, FrmPrincipal);
end;

procedure TFrmPrincipal.BTExcluirClick(Sender: TObject);
begin
  if DBGrid.DataSource.DataSet.FieldByName('IDABASTECIMENTO').AsInteger > 0 then
  begin
    if Application.MessageBox('Deseja realmente excluir o abastecimento selecionado?','Alerta', MB_ICONWARNING + MB_YESNO) = mrYes then
    begin
      try
        ToAbastecimento.New(0,0,0,0)
                       .ExcluirAbastecimento(oConexao.FFDConexao,
                                             DBGrid.DataSource.DataSet.FieldByName('IDABASTECIMENTO').AsInteger);
      finally
        Application.MessageBox('Abastecimento exclu?do com sucesso!','Informa??o', MB_ICONINFORMATION + MB_OK);
        oContrAbastecimentos.AtualizarInfoAbastecimento;
        oFuncoesGerais.SetTagStatus(0, FrmPrincipal);
      end;
    end;
  end
  else Application.MessageBox('N?o ha nenhum abastecimento para excluir!','Informa??o', MB_ICONINFORMATION + MB_OK);
end;

procedure TFrmPrincipal.BTNovoClick(Sender: TObject);
begin
  oFuncoesGerais.SetTagStatus(1, FrmPrincipal);

  oContrBombas := TCBombas.Create(oConexao.FFDConexao);

  CMBBombaCombustivel := oContrBombas.CarregarListaComboBox(CMBBombaCombustivel);
  AtualizaValorLitro;
  CMBBombaCombustivel.SetFocus;
end;

procedure TFrmPrincipal.BTRelDiarioClick(Sender: TObject);
var
  oRelatorio : TFrmVRelAbastecimentos;
begin
  oRelatorio := TFrmVRelAbastecimentos.Create(nil);
  oRelatorio.FDCon   := oConexao.FFDConexao;
  oRelatorio.DataIni := DateOf(Now);
  oRelatorio.DataFim := DateOf(Now);
  oRelatorio.RLReport1.Preview;
  FreeAndNil(oRelatorio);
end;

procedure TFrmPrincipal.BTRelPeriodoClick(Sender: TObject);
var
  oRelatorio : TFrmVRelAbastecimentos;
begin
  if DTPDataFim.isDataFimMaiorQueIni(DTPDataIni.Date) then
  begin
    oRelatorio := TFrmVRelAbastecimentos.Create(nil);
    oRelatorio.FDCon   := oConexao.FFDConexao;
    oRelatorio.DataIni := DTPDataIni.Date;
    oRelatorio.DataFim := DTPDataFim.Date;
    oRelatorio.RLReport1.Preview;
    FreeAndNil(oRelatorio);
  end;
end;

procedure TFrmPrincipal.BTSalvarClick(Sender: TObject);
begin
  if (StrToCurr(MEQuantLitros.Text) > 0) and (StrToCurr(MEValorTotal.Text) > 0) then
  begin
    try
      ToAbastecimento.New(Integer(CMBBombaCombustivel.Items.Objects[CMBBombaCombustivel.ItemIndex]),
                          StrToCurr(MEValorLitro.Text),
                          StrToCurr(MEQuantLitros.Text),
                          StrToCurr(MEValorTotal.Text))
                     .SalvarAbastecimento(oConexao.FFDConexao);
    finally
      Application.MessageBox('Abastecimento realizado com sucesso!','Informa??o', MB_ICONINFORMATION + MB_OK);
      oContrAbastecimentos.AtualizarInfoAbastecimento;
      oFuncoesGerais.SetTagStatus(0, FrmPrincipal);
    end;
  end
  else Application.MessageBox('Informe uma quantidade ou valor para salvar o abastecimento!!','Informa??o', MB_ICONINFORMATION + MB_OK);
end;

procedure TFrmPrincipal.BTAtualizarClick(Sender: TObject);
begin
  oContrAbastecimentos.AtualizarInfoAbastecimento;
end;

procedure TFrmPrincipal.CalcularValorTotalPorQuantidade(nQuantidade: Currency);
begin
  MEValorTotal.Text := CurrToStr(StrToCurr(MEQuantLitros.Text) * StrToCurr(MEValorLitro.Text));
end;

procedure TFrmPrincipal.CalcularValorTotalPorValorTotal(nValorTotal: Currency);
begin
  MEQuantLitros.Text := CurrToStr(StrToCurr(MEValorTotal.Text) / StrToCurr(MEValorLitro.Text));
end;

procedure TFrmPrincipal.CarregarConexoes;
begin
  oConexao := TConexao.Create;
end;

procedure TFrmPrincipal.CarregarDadosAbastecimento;
begin
  //Monta Objeto do Abastecimentos
  oContrAbastecimentos := TCAbastecimentos.Create(oConexao.FFDConexao);

  //Setar DataSource no DBGrid
  DBGrid.DataSource := oContrAbastecimentos.DSAbastecimentos;

  //Trata tamanho dos campos do grid
  with DBGrid do
  begin
    Fields[0].DisplayWidth := 10; //Data
    Fields[1].DisplayWidth := 20; //Bomba
    Fields[2].DisplayWidth := 10; //Vlr. Litro
    Fields[3].DisplayWidth := 10; //Quant. Litros
    Fields[4].DisplayWidth := 10; //Valor Total
    Fields[5].DisplayWidth := 10; //Imposto
  end;
end;

procedure TFrmPrincipal.CarregarDadosPosto;
begin
  //Monta Objeto do Posto
  oContrPosto := TCPostos.Create(oConexao.FFDConexao);

  //Setar Nome do Posto na Lebel Inicial
  LNomePosto.Caption := oContrPosto.Nome;
end;

procedure TFrmPrincipal.CarregarFuncoesGerais;
begin
  oFuncoesGerais := TFuncoesGerais.Create;
end;

procedure TFrmPrincipal.CMBBombaCombustivelChange(Sender: TObject);
begin
  AtualizaValorLitro;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  oConexao.Destroy;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  CarregarFuncoesGerais;
  CarregarConexoes;
  CarregarDadosPosto;
  CarregarDadosAbastecimento;

  oFuncoesGerais.SetTagStatus(0, FrmPrincipal);

  DTPDataIni.Date := Now - 30;
  DTPDataFim.Date := Now;
end;

procedure TFrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmPrincipal.MEQuantLitrosExit(Sender: TObject);
begin
  CalcularValorTotalPorQuantidade(StrToCurr(MEQuantLitros.Text));
  MEQuantLitros.TratarMascaraNumero;
end;

procedure TFrmPrincipal.MEValorTotalExit(Sender: TObject);
begin
  CalcularValorTotalPorValorTotal(StrToCurr(MEValorTotal.Text));
  MEValorTotal.TratarMascaraNumero;
end;

end.
