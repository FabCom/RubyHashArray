require_relative '../data/journalists_data'

def start()
  puts "";puts "";puts ""
  puts "          ###########   Bienvenue   ##########"
  puts ""

  puts "1 : Combien y a-t-il de handle dans cette array ?"
  puts "2 : Quel est le handle le plus court de cette liste ?"
  puts "3 : Combien y-a-t'il de handle contenant 5 caractères (le @ ne compte pas pour un caractère)"
  puts "4 : Combien commencent par une majuscule (première lettre juste après le @) ?"
  puts "5 : Trie la liste de handle par ordre alphabétique."
  puts "6 : Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)"
  puts "7 : Quelle est la position dans l'array de la personne @epenser ?"
  puts "8 : Sors-moi une répartition des handle par taille de ces derniers (nombre de handle avec 1 caractère, nombre de handle avec 2 caractères, nombre de handle avec 3 caractères, etc)"
  puts "9 : Quitter"

  print "> "
  cmd = gets.chomp
  puts "";puts "";puts ""
  case cmd
  when "1"
    print "Nombre de journalistes : " ;  puts @t_journalists.length
    start()
  when "2"
    print "Pseudo du journaliste le plus court : " ;  puts @t_journalists.min {|a, b| a.length <=> b.length}
    start()
  when "3"
    print "Nombre de journalistes contenant 5 caractères : " ; puts @t_journalists.select { |i| i.length <= 6}.length
    start()
  when "4"
    print "Nombre de journalistes dont le nom commence par une majuscule : " ; puts @t_journalists.select { |i| i[1] == i[1].capitalize }.length
    start()
  when "5"
    puts "Liste ordonnée par ordre alphabétique  :" ; print @t_journalists.sort { |a, b| a[1] <=> b[1]}
    start()
  when "6"
    puts "Liste ordonnée par le nombre de caractères  : " ; print @t_journalists.sort { |a, b| a.length <=> b.length}
    start()
  when "7"
    print "Position dans le tableau de @epenser : " ;  puts "#{@t_journalists.index("@epenser")+1}ème position. Index du tableau +1 :-)"
    start()
  when "8"
    lengthCateg = Array.new(@t_journalists.length) { |i| @t_journalists[i].length}.sort.uniq

    lengthCateg.each do |n|
      puts @t_journalists.select { |i| i.length == n}.length.to_s + " pseudo de " + (n-1).to_s + " caractères"
    end
    start()
  when "9"
    puts "Bye bye !"
  else
    puts "Commande inexistante"
    start()
  end
end
start()
