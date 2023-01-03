inherited frmUsuarios: TfrmUsuarios
  Left = 55
  Top = 62
  Caption = 'Cadastro Usu'#225'rios'
  Position = poDesigned
  ExplicitLeft = -178
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPrincipal: TCardPanel
    ActiveCard = CardPesquisa
    inherited CardPesquisa: TCard
      inherited pnlPesquisa: TPanel
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
          ExplicitTop = -5
        end
      end
      inherited pnlGrid: TPanel
        inherited DBGrid1: TDBGrid
          DataSource = DataSource1
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dmConexao.FDQuery1
    Left = 697
    Top = 345
  end
end
