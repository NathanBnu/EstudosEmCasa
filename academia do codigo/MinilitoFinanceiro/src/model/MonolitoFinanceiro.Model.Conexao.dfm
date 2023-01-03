object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 302
  Width = 427
  object SQLConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\natha\OneDrive\Documentos\EstudosEmCasa\academ' +
        'ia do codigo\MinilitoFinanceiro\db\SistemaFinanceiro.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 264
    Top = 136
  end
  object FDQuery1: TFDQuery
    Connection = SQLConexao
    SQL.Strings = (
      'select * from usuarios')
    Left = 120
    Top = 144
  end
end
