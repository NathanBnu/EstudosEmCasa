unit MonolitoFinanceiro.View.CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXPanels, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList,
  Vcl.WinXCtrls;

type
  TfrmCadastroPadrao = class(TForm)
    pnlPrincipal: TCardPanel;
    CardCadastro: TCard;
    CardPesquisa: TCard;
    pnlPesquisa: TPanel;
    Panel1: TPanel;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    edtPesquisar: TEdit;
    Label1: TLabel;
    btnPesquisar: TButton;
    ImageList1: TImageList;
    btnFechar: TButton;
    btnImprimir: TButton;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    Panel2: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    ToggleStatus: TToggleSwitch;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.dfm}

procedure TfrmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := cardPesquisa;
end;

procedure TfrmCadastroPadrao.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastroPadrao.btnIncluirClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmCadastroPadrao.FormShow(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := CardPesquisa;
end;

end.
