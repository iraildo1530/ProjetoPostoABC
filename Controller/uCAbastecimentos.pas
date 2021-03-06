unit uCAbastecimentos;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB, uMAbastecimento, uIoAbastecimentos,
  DateUtils, Vcl.Dialogs;

type
  ToAbastecimento = class(TInterfacedObject, IoAbastecimentos)
    private
      FnIDBomba          : Integer;
      FnVlrLitro         : Currency;
      FnQtdLitros        : Currency;
      FnVlrAbastecimento : Currency;

      procedure SetIDBomba(const Value: Integer);
      procedure SetVlrLitro(const Value: Currency);
      procedure SetQtdLitros(const Value: Currency);
      procedure SetVlrAbastecimento(const Value: Currency);
    public
      procedure SalvarAbastecimento(oConexao: TFDConnection);
      procedure ExcluirAbastecimento(oConexao: TFDConnection; IDAbastecimento: Integer);

      property IDBomba : Integer read FnIDBomba write SetIDBomba;
      property VlrLitro : Currency read FnVlrLitro write SetVlrLitro;
      property QtdLitros : Currency read FnQtdLitros write SetQtdLitros;
      property VlrAbastecimento : Currency read FnVlrAbastecimento write SetVlrAbastecimento;

      constructor Create(nIDBomba : Integer; nVlrLitro, nQtdLitros, nVlrAbastecimento: Currency);
      class function New(nIDBomba : Integer; nVlrLitro, nQtdLitros, nVlrAbastecimento: Currency): IoAbastecimentos;
      destructor Destroy; override;
  end;

  TCAbastecimentos = class
  private
    FFDCon               : TFDConnection;
    FFDQAbastecimentos   : TFDQuery;
    FDSAbastecimentos    : TDataSource;

    FFDStoredProcInserir : TFDStoredProc;
    FFDStoredProcExcluir : TFDStoredProc;

    FoModelAbastecimento   : TAbastecimento;

    procedure SetFDCon(const Value: TFDConnection);
    procedure SetFDQAbastecimentos(const Value: TFDQuery);
    procedure SetDSAbastecimentos(const Value: TDataSource);

    procedure SetFDStoredProcInserir(const Value: TFDStoredProc);
    procedure SetFDStoredProcExcluir(const Value: TFDStoredProc);
  public
    procedure AtualizarInfoAbastecimento;

    property FDCon : TFDConnection read FFDCon write SetFDCon;
    property FDQAbastecimentos : TFDQuery read FFDQAbastecimentos write SetFDQAbastecimentos;
    property DSAbastecimentos : TDataSource read FDSAbastecimentos write SetDSAbastecimentos;

    property FDStoredProcInserir : TFDStoredProc read FFDStoredProcInserir write SetFDStoredProcInserir;
    property FDStoredProcExcluir : TFDStoredProc read FFDStoredProcExcluir write SetFDStoredProcExcluir;

    constructor Create(oConexao: TFDConnection);
    destructor Destroy; override;
  end;

implementation

{ TCAbastecimentos }

procedure TCAbastecimentos.AtualizarInfoAbastecimento;
begin
  FDQAbastecimentos.Refresh;
end;

constructor TCAbastecimentos.Create(oConexao: TFDConnection);
begin
  FoModelAbastecimento := TAbastecimento.Create(oConexao);

  with FoModelAbastecimento do
  begin
    CarregarDados;
    SetFDQAbastecimentos(GetFDQAbastecimentos);
    SetDSAbastecimentos(GetDSAbastecimentos);
    SetFDStoredProcInserir(GetFDStoredProcInserir);
    SetFDStoredProcExcluir(GetFDStoredProcExcluir);
  end;
end;

destructor TCAbastecimentos.Destroy;
begin
  FoModelAbastecimento.Destroy;
  FreeAndNil(FFDCon);
  FreeAndNil(FFDQAbastecimentos);
  FreeAndNil(FDSAbastecimentos);
  FreeAndNil(FFDStoredProcInserir);
  FreeAndNil(FFDStoredProcExcluir);
  inherited;
end;

constructor ToAbastecimento.Create(nIDBomba: Integer; nVlrLitro, nQtdLitros,
  nVlrAbastecimento: Currency);
begin
  SetIDBomba(nIDBomba);
  SetVlrLitro(nVlrLitro);
  SetQtdLitros(nQtdLitros);
  SetVlrAbastecimento(nVlrAbastecimento);
end;

destructor ToAbastecimento.Destroy;
begin

  inherited;
end;

procedure ToAbastecimento.ExcluirAbastecimento(oConexao: TFDConnection; IDAbastecimento: Integer);
var
  oCAbastecimento : TCAbastecimentos;
begin
  oCAbastecimento := TCAbastecimentos.Create(oConexao);

  with oCAbastecimento.FDStoredProcExcluir do
  begin
    ParamByName('IDABASTECIMENTO').Value  := IDAbastecimento;
    try
      ExecProc;
    except
      on e: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  end;
end;

class function ToAbastecimento.New(nIDBomba : Integer; nVlrLitro, nQtdLitros,
  nVlrAbastecimento: Currency): IoAbastecimentos;
begin
  Result := ToAbastecimento.Create(nIDBomba,
                                   nVlrLitro,
                                   nQtdLitros,
                                   nVlrAbastecimento);
end;

procedure TCAbastecimentos.SetDSAbastecimentos(const Value: TDataSource);
begin
  FDSAbastecimentos := Value;
end;

procedure TCAbastecimentos.SetFDCon(const Value: TFDConnection);
begin
  FFDCon := Value;
end;

procedure TCAbastecimentos.SetFDQAbastecimentos(const Value: TFDQuery);
begin
  FFDQAbastecimentos := Value;
end;

procedure TCAbastecimentos.SetFDStoredProcExcluir(const Value: TFDStoredProc);
begin
  FFDStoredProcExcluir := Value;
end;

procedure TCAbastecimentos.SetFDStoredProcInserir(const Value: TFDStoredProc);
begin
  FFDStoredProcInserir := Value;
end;

procedure ToAbastecimento.SalvarAbastecimento(oConexao: TFDConnection);
var
  oCAbastecimento : TCAbastecimentos;
begin
  oCAbastecimento := TCAbastecimentos.Create(oConexao);

  with oCAbastecimento.FDStoredProcInserir do
  begin
    ParamByName('DTABASTECIMENTO').Value  := DateOf(now);
    ParamByName('IDBOMBA').Value          := IDBomba;
    ParamByName('VLRLITRO').Value         := VlrLitro;
    ParamByName('QTDLITROS').Value        := QtdLitros;
    ParamByName('VLRABASTECIMENTO').Value := VlrAbastecimento - (0.13 * VlrAbastecimento);
    ParamByName('VLRIMPOSTO').Value       := (0.13 * VlrAbastecimento);

    try
      ExecProc;
    except
      on e: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  end;
end;

procedure ToAbastecimento.SetIDBomba(const Value: Integer);
begin
  FnIDBomba := Value;
end;

procedure ToAbastecimento.SetQtdLitros(const Value: Currency);
begin
  FnQtdLitros := Value;
end;

procedure ToAbastecimento.SetVlrAbastecimento(const Value: Currency);
begin
  FnVlrAbastecimento := Value;
end;

procedure ToAbastecimento.SetVlrLitro(const Value: Currency);
begin
  FnVlrLitro := Value;
end;

end.
