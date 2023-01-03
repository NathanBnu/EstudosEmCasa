object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 302
  Width = 427
  object sqlConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\natha\OneDrive\Documentos\EstudosEmCasa\academ' +
        'ia do codigo\MinilitoFinanceiro\db\SistemaFinanceiro.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 264
    Top = 136
  end
  object FDQuery1: TFDQuery
    Connection = sqlConexao
    SQL.Strings = (
      'SELECT * FROM usuarios;')
    Left = 144
    Top = 128
  end
end
