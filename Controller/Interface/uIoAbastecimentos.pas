unit uIoAbastecimentos;

interface

uses
  FireDAC.Comp.Client;

type
  IoAbastecimentos = interface
    ['{8A5AE3D5-2114-422C-B9F7-CEC4D6F17D19}']
    procedure SalvarAbastecimento(oConexao: TFDConnection);
    procedure ExcluirAbastecimento(oConexao: TFDConnection; IDAbastecimento: Integer);
  end;

implementation

end.
