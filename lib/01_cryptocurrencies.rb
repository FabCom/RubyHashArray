require_relative '../data/crypto_data'



def start()
  h_crypto ={}
  @t_cryptos = @t_cryptos.map {|x| x.to_sym}
  @t_values = @t_values.map {|x| x.to_f}
  @t_cryptos.each_with_index { |k, v| h_crypto[k] = @t_values[v] }
  puts "";puts "";puts ""
  puts "          ###########   Bienvenue   ##########"
  puts ""

  puts "1 : Afficher le hash complet"
  puts "2 : La ou les crypto qui ont la plus grosse valeur."
  puts "3 : La ou les crypto qui ont la plus petite valeur."
  puts "4 : Les devises dont le cours est inférieur à 6000"
  puts "5 : La devise la plus chère parmi celles dont le cours est inférieur à 6000"
  puts "6 : Quitter"

  print "> "
  cmd = gets.chomp
  puts "";puts "";puts ""
  case cmd
  when "1"
    puts "Hash complet : " ;  puts h_crypto
    start()
  when "2"
    puts "La ou les crypto qui ont la plus grosse valeur. : " ;  h_crypto.each { |k, v| puts k.to_s + " : " + v.to_s if v == h_crypto.values.max }
    start()
  when "3"
    puts "La ou les crypto qui ont la plus petite valeur : " ; h_crypto.each { |k, v| puts k.to_s + " : " + v.to_s if v == h_crypto.values.min }
    start()
  when "4"
    puts "Les devises dont le cours est inférieur à 6000 : " ; h_crypto.each { |k, v| puts k.to_s + " : " + v.to_s if v < 6000 } ; puts ""
    start()
  when "5"
    puts "La devise la plus chère parmi celles dont le cours est inférieur à 6000"
    x = h_crypto.select {|k,v| v < 6000 }.values.max ; print "#{h_crypto.key(x)} : #{x}"
  start()
  when "6"
    puts "Bye bye !"
  else
    puts "Commande inexistante"
    start()
  end
end
start()
