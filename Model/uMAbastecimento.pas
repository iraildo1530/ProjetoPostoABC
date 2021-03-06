unit uMAbastecimento;

interface

uses FireDAC.Comp.Client, System.SysUtils, Data.DB, uMConexao;

type
  TAbastecimento= class
    private
      FFDQAbastecimentos  : TFDQuery;
      FDSAbastecimentos   : TDataSource;
      FFDStoredProcInserir : TFDStoredProc;

      oDadosQry          : TDadosQry;
    FFDStoredProcExcluir: TFDStoredProc;

      procedure SetFDQAbastecimentos(const Value: TFDQuery);
      procedure SetDSAbastecimentos(const Value: TDataSource);

      procedure SetFDStoredProcInserir;
      procedure SetFDStoredProcExcluir;
    public
      procedure CarregarDados;

      function GetFDQAbastecimentos : TFDQuery;
      function GetDSAbastecimentos : TDataSource;

      function GetFDStoredProcInserir : TFDStoredProc;
      function GetFDStoredProcExcluir: TFDStoredProc;

      property FDQAbastecimentos : TFDQuery read GetFDQAbastecimentos write SetFDQAbastecimentos;
      property DSAbastecimentos : TDataSource read GetDSAbastecimentos write SetDSAbastecimentos;

      property FDStoredProcInserir : TFDStoredProc read GetFDStoredProcInserir write FFDStoredProcInserir;
      property FDStoredProcExcluir : TFDStoredProc read GetFDStoredProcExcluir write FFDStoredProcExcluir;

      constructor Create(const oConexao: TFDConnection);
      destructor Destroy; override;
    end;

const
  _SQL_All_Default = ' SELECT A.IDABASTECIMENTO,                    '+
                     '        A.DTABASTECIMENTO,                    '+
                     '        A.IDBOMBA,                            '+
                     '        B.NOME BOMBA,                         '+
                     '        A.VLRLITRO,                           '+
                     '        A.QTDLITROS,                          '+
                     '        A.VLRABASTECIMENTO,                   '+
                     '        A.VLRIMPOSTO                          '+
                     ' FROM ABASTECIMENTO A                         '+
                     ' INNER JOIN BOMBAS B ON B.IDBOMBA = A.IDBOMBA '+
                     ' ORDER BY A.IDABASTECIMENTO                   ';

  _StoredProc_Inserir = 'ABASTECIMENTO_INS';
  _StoredProc_Excluir = 'ABASTECIMENTO_DEL';

implementation

{ TAbastecimento }

procedure TAbastecimento.CarregarDados;
begin
  FFDQAbastecimentos := oDadosQry.CarregarDados(FDQAbastecimentos, 'FDQAbastecimentos', _SQL_All_Default, True);

  with FFDQAbastecimentos do
  begin
    FieldByName('IDABASTECIMENTO').DisplayLabel  := 'C?digo';
    FieldByName('IDABASTECIMENTO').Visible       := False;
    FieldByName('DTABASTECIMENTO').DisplayLabel  := 'Data';

    FieldByName('IDBOMBA').DisplayLabel          := 'C?d. Bomba';
    FieldByName('IDBOMBA').Visible               := False;

    FieldByName('BOMBA').DisplayLabel            := 'Bomba';

    FieldByName('VLRLITRO').DisplayLabel         := 'Vlr. Litro';
    FieldByName('QTDLITROS').DisplayLabel        := 'Quant. Litros';
    FieldByName('VLRABASTECIMENTO').DisplayLabel := 'Valor Total';
    FieldByName('VLRIMPOSTO').DisplayLabel       := 'Imposto';
  end;
end;

constructor TAbastecimento.Create(const oConexao: TFDConnection);
begin
  FFDQAbastecimentos   := TFDQuery.Create(nil);
  FDSAbastecimentos    := TDataSource.Create(nil);
  FFDStoredProcInserir := TFDStoredProc.Create(nil);
  FFDStoredProcExcluir  := TFDStoredProc.Create(nil);
  oDadosQry  := TDadosQry.Create;

  //Configura Conex?o da Query Abastecimentos
  FDQAbastecimentos.Connection := oConexao;

  //Configura Dataset do DataSource Abastecimentos
  DSAbastecimentos.DataSet := FDQAbastecimentos;

  //Configura Conex?o do StoredProcedure Inserir
  FFDStoredProcInserir.Connection := oConexao;
  SetFDStoredProcInserir;

  //Configura Conex?o do StoredProcedure Excluir
  FFDStoredProcExcluir.Connection := oConexao;
  SetFDStoredProcExcluir;
end;

destructor TAbastecimento.Destroy;
begin
  FreeAndNil(oDadosQry);
  FreeAndNil(FFDQAbastecimentos);
  FreeAndNil(FDSAbastecimentos);
  FreeAndNil(FFDStoredProcInserir);
  inherited;
end;

function TAbastecimento.GetDSAbastecimentos: TDataSource;
begin
  Result := FDSAbastecimentos;
end;

function TAbastecimento.GetFDQAbastecimentos: TFDQuery;
begin
  Result := FFDQAbastecimentos;
end;

function TAbastecimento.GetFDStoredProcExcluir: TFDStoredProc;
begin
  Result := FFDStoredProcExcluir;
end;

function TAbastecimento.GetFDStoredProcInserir: TFDStoredProc;
begin
  Result := FFDStoredProcInserir;
end;

procedure TAbastecimento.SetDSAbastecimentos(const Value: TDataSource);
begin
  FDSAbastecimentos := Value;
end;

procedure TAbastecimento.SetFDQAbastecimentos(const Value: TFDQuery);
begin
  FFDQAbastecimentos := Value;
end;

procedure TAbastecimento.SetFDStoredProcExcluir;
begin
  FFDStoredProcExcluir.StoredProcName := _StoredProc_Excluir;
  FFDStoredProcExcluir.Prepare;
end;

procedure TAbastecimento.SetFDStoredProcInserir;
begin
  FFDStoredProcInserir.StoredProcName := _StoredProc_Inserir;
  FFDStoredProcInserir.Prepare;
end;

end.
