unit uVRelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrmVRelAbastecimentos = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    DSRel: TDataSource;
    FDQRel: TFDQuery;
    FDQRelDTABASTECIMENTO: TDateField;
    FDQRelBOMBA: TStringField;
    FDQRelVLRABASTECIMENTO: TFMTBCDField;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLDraw1: TRLDraw;
    FDQRelTANQUE: TStringField;
    DSSumario: TDataSource;
    FDQSumario: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FMTBCDField1: TFMTBCDField;
    RLBand3: TRLBand;
    RLBand2: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLDraw2: TRLDraw;
    RLGroup1: TRLGroup;
    RLGGeral: TRLGroup;
    RLBCHeaData: TRLBand;
    RLLabel13: TRLLabel;
    RLDBText1: TRLDBText;
    RLGDiario: TRLGroup;
    RLBCHeaTanque: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLDBText6: TRLDBText;
    RLBDetBomba: TRLBand;
    RLDBText2: TRLDBText;
    RLDBTValorAbastecimento: TRLDBText;
    RLBSumTanque: TRLBand;
    RLLabel8: TRLLabel;
    RLLResTanque: TRLLabel;
    RLDraw4: TRLDraw;
    RLBSumDiario: TRLBand;
    RLLabel12: TRLLabel;
    RLLResDia: TRLLabel;
    RLDraw5: TRLDraw;
    RLSubDetail1: TRLSubDetail;
    RLBand4: TRLBand;
    RLLabel6: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel14: TRLLabel;
    RLBand5: TRLBand;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand6: TRLBand;
    RLLResGeral: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel15: TRLLabel;
    procedure RLBSumDiarioBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBSumTanqueBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDBTValorAbastecimentoBeforePrint(Sender: TObject;
      var Text: string; var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDBText5BeforePrint(Sender: TObject; var Text: string;
      var PrintIt: Boolean);
  private
    { Private declarations }
    FFDCon    : TFDConnection;

    FdDataIni : TDate;
    FdDataFim : TDate;

    procedure SetFdDataIni(const Value: TDate);
    procedure SetFdDataFim(const Value: TDate);
    procedure SetFDCon(const Value: TFDConnection);
  public
    { Public declarations }
    property FDCon : TFDConnection read FFDCon write SetFDCon;

    property DataIni : TDate read FdDataIni write SetFdDataIni;
    property DataFim : TDate read FdDataFim write SetFdDataFim;
  end;

var
  FrmVRelAbastecimentos: TFrmVRelAbastecimentos;
  FnVlrTotalTanque, FnVlrTotalDia, FnVlrTotal, FnVlrTotalGeral : Currency;

implementation

{$R *.dfm}

procedure TFrmVRelAbastecimentos.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLResGeral.Caption := FormatCurr('###,###,##0.00', FnVlrTotalGeral);
  FnVlrTotalGeral := 0;
end;

procedure TFrmVRelAbastecimentos.RLBSumDiarioBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLResDia.Caption := FormatCurr('###,###,##0.00', FnVlrTotalDia);
  FnVlrTotal       := FnVlrTotal + FnVlrTotalDia;
  FnVlrTotalDia    := 0;
  FnVlrTotalTanque := 0;
end;

procedure TFrmVRelAbastecimentos.RLBSumTanqueBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLResTanque.Caption := FormatCurr('###,###,##0.00', FnVlrTotalTanque);
  FnVlrTotalDia    := FnVlrTotalDia + FnVlrTotalTanque;
  FnVlrTotalTanque := 0;
end;

procedure TFrmVRelAbastecimentos.RLDBText5BeforePrint(Sender: TObject;
  var Text: string; var PrintIt: Boolean);
begin
  FnVlrTotalGeral := FnVlrTotalGeral + FDQSumario.FieldByName('VLRABASTECIMENTO').AsCurrency;
end;

procedure TFrmVRelAbastecimentos.RLDBTValorAbastecimentoBeforePrint(
  Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  FnVlrTotalTanque := FnVlrTotalTanque + FDQRel.FieldByName('VLRABASTECIMENTO').AsCurrency;
end;

procedure TFrmVRelAbastecimentos.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  FDQRel.Connection := FDCon;
  FDQRel.Close;
  FDQRel.Params.ClearValues;
  FDQRel.Params.Items[0].Value := DataIni;
  FDQRel.Params.Items[1].Value := DataFim;
  FDQRel.Open;

  FDQSumario.Connection := FDCon;
  FDQSumario.Close;
  FDQSumario.Params.ClearValues;
  FDQSumario.Params.Items[0].Value := DataIni;
  FDQSumario.Params.Items[1].Value := DataFim;
  FDQSumario.Open;
end;

procedure TFrmVRelAbastecimentos.SetFDCon(const Value: TFDConnection);
begin
  FFDCon := Value;
end;

procedure TFrmVRelAbastecimentos.SetFdDataFim(const Value: TDate);
begin
  FdDataFim := Value;
end;

procedure TFrmVRelAbastecimentos.SetFdDataIni(const Value: TDate);
begin
  FdDataIni := Value;
end;

end.
