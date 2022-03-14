unit uMConexao;

interface

uses
  System.SysUtils,FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Forms;

type

  TConexao = class
    FFDConexao : TFDConnection;
    private

    public
      constructor Create;
      destructor Destroy; override;
  end;

  TDadosQry = class (TConexao)
    function CarregarDados(FDQuery: TFDQuery; NomeQuery: String;
      SQL: String; Ativo: Boolean): TFDQuery;
  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FFDConexao := TFDConnection.Create(nil);
  with FFDConexao do
  begin
    Params.Add(Pchar('Database='+ExtractFilePath(Application.ExeName)+'\CADADOS.FDB'));
    Params.Add('User_Name=SYSDBA');
    Params.Add('Password=masterkey');
    Params.Add('DriverID=FB');
    Name        := 'CAConexao';
    LoginPrompt := False;
    Connected   := True;
  end;
end;

destructor TConexao.Destroy;
begin
  inherited;
end;

{ TDadosQry }

function TDadosQry.CarregarDados(FDQuery: TFDQuery; NomeQuery, SQL: String;
  Ativo: Boolean): TFDQuery;
begin
  FDQuery.Name       := NomeQuery;
  FDQuery.Active     := False;
  FDQuery.Connection := FFDConexao;

  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(SQL);

  if Ativo then
    FDQuery.Active := True
  else FDQuery.Active := False;

  Result := FDQuery;
end;

end.
