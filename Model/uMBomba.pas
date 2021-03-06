unit uMBomba;

interface

uses FireDAC.Comp.Client, System.SysUtils, Data.DB, uMConexao;

type
  TBomba= class
    private
      FFDQBombas : TFDQuery;
      FDSBombas  : TDataSource;

      oDadosQry  : TDadosQry;

      procedure SetFDQBombas(const Value: TFDQuery);
      procedure SetDSBombas(const Value: TDataSource);
    public
      procedure CarregarDados;

      function GetFDQBombas : TFDQuery;
      function GetDSBombas : TDataSource;

      property FDQBombas : TFDQuery read GetFDQBombas write SetFDQBombas;
      property DSBombas : TDataSource read GetDSBombas write SetDSBombas;

      constructor Create(const oConexao: TFDConnection);
      destructor Destroy; override;
    end;

const
  _SQL_All_Default = 'Select * from BOMBAS';

implementation

{ TBomba }

procedure TBomba.CarregarDados;
begin
  FFDQBombas := oDadosQry.CarregarDados(FDQBombas, 'FDQBombas', _SQL_All_Default, True);
end;

constructor TBomba.Create(const oConexao: TFDConnection);
begin
  FFDQBombas := TFDQuery.Create(nil);
  FDSBombas  := TDataSource.Create(nil);
  oDadosQry  := TDadosQry.Create;

  //Configura Conex?o da Query Bombas
  FDQBombas.Connection := oConexao;

  //Configura Dataset do DataSource Bombas
  DSBombas.DataSet := FDQBombas;
end;

destructor TBomba.Destroy;
begin
  FreeAndNil(oDadosQry);
  FreeAndNil(FFDQBombas);
  FreeAndNil(FDSBombas);
  inherited;
end;

function TBomba.GetDSBombas: TDataSource;
begin
  Result := FDSBombas;
end;

function TBomba.GetFDQBombas: TFDQuery;
begin
  Result := FFDQBombas;
end;

procedure TBomba.SetDSBombas(const Value: TDataSource);
begin
  FDSBombas := Value;
end;

procedure TBomba.SetFDQBombas(const Value: TFDQuery);
begin
  FFDQBombas := Value;
end;

end.
