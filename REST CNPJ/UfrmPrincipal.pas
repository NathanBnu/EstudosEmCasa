unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TfrmPrincipal = class(TForm)
    edtCNPJ: TEdit;
    Label1: TLabel;
    btnPesquisar: TButton;
    Memo1: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
begin
  memo1.Clear;
  RestClient1.BaseURL := 'HTTPS://www.receitaws.com.br/v1/cnpj/' + edtCNPJ.Text;
  RestRequest1.Execute;
  Memo1.Lines.Add(RestRequest1.Response.JSONText);
end;

end.
