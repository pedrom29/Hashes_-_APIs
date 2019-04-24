n = ARGV
ventas = {
  Enero: 15000,
  Febrero: 22000,
  Marzo: 12000,
  Abril: 17000,
  Mayo: 81000,
  Junio: 13000,
  Julio: 21000,
  Agosto: 41200,
  Septiembre: 25000,
  Octubre: 21500,
  Noviembre: 91000,
  Diciembre: 21000
}


def converter(ventas)
  array = ventas.values
  q = ['Q1', 'Q2', 'Q3', 'Q4']
  array.each_slice(3) do |a|
    puts a.sum    
  end
end
converter(ventas)