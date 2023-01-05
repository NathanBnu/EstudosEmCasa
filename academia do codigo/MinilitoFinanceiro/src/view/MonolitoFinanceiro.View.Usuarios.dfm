inherited frmUsuarios: TfrmUsuarios
  Left = 55
  Top = 62
  Caption = 'Cadastro Usu'#225'rios'
  Position = poDesigned
  ExplicitLeft = 2
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPrincipal: TCardPanel
    ActiveCard = CardPesquisa
    inherited CardPesquisa: TCard
      inherited pnlPesquisa: TPanel
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
        end
      end
      inherited pnlGrid: TPanel
        inherited DBGrid1: TDBGrid
          DataSource = DataSource1
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 234
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'login'
              Title.Caption = 'Login'
              Width = 351
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'Status'
              Width = 315
              Visible = True
            end>
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dmUsuarios.cdsUsuarios
    Left = 697
    Top = 345
  end
end
