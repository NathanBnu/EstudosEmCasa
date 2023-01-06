unit MonolitoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Model.Usuarios, Vcl.WinXCtrls;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    DataSource1: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
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

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.close;
  dmUsuarios.cdsUsuarios.CommandText := 'Select * from Usuarios';
  dmUsuarios.cdsUsuarios.Open;
  //dmConexao.FDQuery1.SQL.Add('SELECT * FROM usuarios');
  //dmConexao.FDQuery1.Open;
end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  LStatus: String;
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

end.
