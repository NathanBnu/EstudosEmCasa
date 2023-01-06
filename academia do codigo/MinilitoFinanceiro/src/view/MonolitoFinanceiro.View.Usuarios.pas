unit MonolitoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Model.Usuarios, Vcl.WinXCtrls,
  MonolitoFinanceiro.Utilitarios;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    DataSource1: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;

  dmUsuarios.cdsUsuarios.Edit;

  edtNome.Text := dmUsuarios.cdsUsuariosNome.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuariosLogin.AsString;
  edtSenha.Text := dmUsuarios.cdsUsuariosSenha.AsString;

  ToggleStatus.State := tssOn;
  if dmUsuarios.cdsUsuariosstatus.AsString = 'B' then
    ToggleStatus.State := tssOff;
end;

procedure TfrmUsuarios.btnCancelarClick(Sender: TObject);
begin
  inherited;

  dmUsuarios.cdsUsuarios.Cancel;
end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pegunta', MB_YESNO + MB_ICONQUESTION) <> mryes then
    exit;

  try
    dmUsuarios.cdsUsuarios.Delete;
    dmUsuarios.cdsUsuarios.ApplyUpdates(0);

    ShowMessage('Registro excluído com sucesso!');
  except on E: Exception do
    Application.MessageBox(PWideChar(E.Message), 'Erro ao excluir registro', MB_OK +MB_ICONERROR);
  end;
end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  dmUsuarios.cdsUsuarios.Insert;
end;

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.close;
  dmUsuarios.cdsUsuarios.CommandText := 'Select * from Usuarios';
  dmUsuarios.cdsUsuarios.Open;

end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  LStatus: String;
  Mensagem: String;
begin
  if Trim(edtNome.text) = '' then
  begin
    edtNome.setFocus;
    Application.MessageBox('O campo nome não pode ser vazio', 'Atenção', MB_OK + MB_Iconwarning);
    abort;
  end;

    if Trim(edtLogin.text) = '' then
  begin
    edtLogin.setFocus;
    Application.MessageBox('O campo login não pode ser vazio', 'Atenção', MB_OK + MB_Iconwarning);
    abort;
  end;

    if Trim(edtSenha.text) = '' then
  begin
    edtSenha.setFocus;
    Application.MessageBox('O campo senha não pode ser vazio', 'Atenção', MB_OK + MB_Iconwarning);
    abort;
  end;

  lStatus := 'A';

  if ToggleStatus.State = tssoff then
    LStatus := 'B';

  if dmUsuarios.cdsUsuarios.state in [dsInsert] then
  begin
    Mensagem := 'Registro incluído com sucesso';
    dmUsuarios.cdsUsuariosid.AsString := TUtilitarios.GetID;
    dmUsuarios.cdsUsuariosdata_cadastro.AsDateTime := now;
  end;

  dmUsuarios.cdsUsuariosnome.AsString := Trim(edtNome.Text);
  dmUsuarios.cdsUsuarioslogin.AsString := Trim(edtLogin.Text);
  dmUsuarios.cdsUsuariossenha.AsString := Trim(edtSenha.Text);
  dmUsuarios.cdsUsuariosstatus.AsString := lStatus;

  dmUsuarios.cdsUsuarios.Post;
  dmUsuarios.cdsUsuarios.ApplyUpdates(0);

  ShowMessage('Registro Alterado com sucesso!');

  pnlPrincipal.ActiveCard := CardPesquisa;
  inherited;

end;

procedure TfrmUsuarios.LimparCampos;
var
  Contador: Integer;
begin
  for Contador := 0 to Pred(ComponentCount) do
  begin
    if Components[contador] is TCustomEdit then
      TCustomEdit(Components[Contador]).Clear
    else if Components[Contador] is TToggleSwitch then
      TToggleSwitch(Components[Contador]).state := tssOn;
  end;
end;

end.
