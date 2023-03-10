unit MonolitoFinanceiro.Utilitarios;

interface

type
  TUtilitarios = class
    class function GetId: String;
  end;
implementation

uses
  System.SysUtils;
{ TUtilitarios }

class function TUtilitarios.GetId: String;
begin
  Result := TGUID.NewGuid.ToString;
  Result := StringReplace(Result, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

end.
