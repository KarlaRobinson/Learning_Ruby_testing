require 'csv'

formularios = {}
  CSV.foreach('prueba-formularios.csv') do |row|
    formularios[row[0]] = [row[1], row[2]]
  end

credit_card = {}
  CSV.foreach('prueba-redirecciones.csv') do |row|
    credit_card[row[0]] = row[1]
  end

origin = {}
  CSV.foreach('prueba-redirecciones.csv') do |row|
    origin[row[0]] = row[2]
  end

bcc = {}
  CSV.foreach('prueba-resultados.csv') do |row|
    bcc[row[0]] = row[1]
  end

formularios.map do |key, value|
    value << credit_card[key]
    value << origin[key]
    value << bcc[key]
end

CSV.open("KarlaArchivoNuevo.csv", "wb") do |csv|
     formularios.each { |key, value| csv << [key, value[0], value[1], value[2], value[3], value[4]]}
end