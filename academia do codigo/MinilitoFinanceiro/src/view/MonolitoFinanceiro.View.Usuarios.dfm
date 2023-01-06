inherited frmUsuarios: TfrmUsuarios
  Left = 55
  Top = 62
  Caption = 'Cadastro Usu'#225'rios'
  Position = poDesigned
  ExplicitLeft = -332
  ExplicitTop = -129
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPrincipal: TCardPanel
    inherited CardPesquisa: TCard
      inherited pnlPesquisa: TPanel
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
        end
      end
      inherited Panel1: TPanel
        inherited btnAlterar: TButton
          ExplicitLeft = 77
          ExplicitTop = 5
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
    inherited CardCadastro: TCard
      ExplicitLeft = 1
      inherited Panel2: TPanel
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
        end
      end
      inherited ToggleStatus: TToggleSwitch
        Width = 106
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        ExplicitWidth = 106
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dmUsuarios.cdsUsuarios
    Left = 697
    Top = 345
  end
end
