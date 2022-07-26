require 'faker'
require "open-uri"
require "uri"

puts 'Creating seeds...'

puts "Cleaning DB"

Booking.destroy_all
Castle.destroy_all
User.destroy_all

puts "DB cleaned"

puts 'Creating users'

User.create(
  first_name: "Sylvie",
  last_name: "Nolan",
  email: "sylvie.nolan@laposte.net",
  password: "sylviiie",
)
User.create(
  first_name: "Georges",
  last_name: "Bondel",
  email: "georges.bondel@yahoo.fr",
  password: "georgio",
)
User.create(
  first_name: "Caroline",
  last_name: "Dupont",
  email: "caroline.dpt@gmail.com",
  password: "azerty",
)
User.create(
  first_name: "Etienne",
  last_name: "Lemarchand",
  email: "etiennelmd@gmail.com",
  password: "123456",
)
User.create(
  first_name: "Alexandre",
  last_name: "Duverneuil",
  email: "alexdvn@gmail.com",
  password: "123456",
)
User.create(
  first_name: "Kevin",
  last_name: "Machin",
  email: "kevdev@gmail.com",
  password: "123456",
)
User.create(
  first_name: "Jean-Michel",
  last_name: "Cantal",
  email: "jean-michel.cantal@gmail.com",
  password: "123456",
)
User.create(
  first_name: "Emma",
  last_name: "Proust",
  email: "emmaproust@gmail.com",
  password: "123456",
)
User.create(
  first_name: "Brigitte",
  last_name: "Durand",
  email: "bdurand@gmail.com",
  password: "123456",
)
User.create(
  first_name: "Elodie",
  last_name: "Roland",
  email: "elo@gmail.com",
  password: "123456",
)
User.create(
  first_name: "ja",
  last_name: "dc",
  email: "ja.dc@gmail.com",
  password: "moviefinder",
)

puts 'Users created'

puts 'Creating castles'


castle_one = Castle.new(
  description: "Situé en Bretagne, entre Fougères et Dinan, Combourg, hautaine forteresse féodale, domine un étang mélancolique encombré de roseaux, dans un paysage austère de landes et de bois. Ces lieux ont profondément marqué Chateaubriand, l'un des précurseurs du nromantisme en France, qui y passa toute son enfance. \"C\'est dans les bois de Combourg que je suis devenu ce que je suis, que j\'ai commencé à sentir la première atteinte de cet ennui que j\'ai traîné toute ma vie, de cette trsitesse qui a fait mon tourment et ma félicité.\" Edifié au XIe siècle, le château est complètement rénové au XIXe.",
  price_per_day: 1500,
  name: "Combourg",
  subtitle: "Un château au coeur des lettres françaises",
  style: "Château fort",
  department: "35 - Ille-et-Vilaine",
  address: "23 Rue des Princes, 35270 Combourg",
  user_id: 1,
  number_of_bed: 7,
  number_of_room: 15,
  smokers_welcome: true,
  animals_welcome: false,
  wifi: false,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832466/castrvm/Chateau_de_Combourg_wf4ow8.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832452/castrvm/det_HEMIS_0463390ok_fovw1p.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832291/castrvm/MjAxNTAyMjJiMWNmNWU5ZDAzZjcwNzE2NWY0NjhmNTY0ZjM3OTc_eylwfw.jpg"), filename: "castle", content_type: "image/jpg" }
castle_one.photos.attach([file1, file2, file3])
castle_one.save!
puts 'ok'

castle_two = Castle.new(
  description: "Posé sur les falaises qui dominent l\'océan Atlantique à Hendaye, le château d\'Abbadia offre une vision saisissante : avec ses tours crénelées et ses faux airs de forteresse, on pourrait le croire tout droit venu du Moyen Âge. Il est pourtant né dans la deuxième partie du XIXe siècle, conçu selon les volontés d'un amoureux des étoiles, épris de voyages, de philosophie et de philologie : le scientifique Antoine d'Abbadie.",
  price_per_day: 1800,
  name: "Abbadia",
  subtitle: "La surprenante thébaïde d'un grand voyageur",
  style: "éclectique",
  department: "64 - Pyrénées-Atlantiques",
  address: "Rte de la Corniche, 64700 Hendaye",
  user_id: 1,
  number_of_bed: 9,
  number_of_room: 18,
  smokers_welcome: true,
  animals_welcome: true,
  wifi: true,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832466/castrvm/Chateau_de_Combourg_wf4ow8.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832452/castrvm/det_HEMIS_0463390ok_fovw1p.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832291/castrvm/MjAxNTAyMjJiMWNmNWU5ZDAzZjcwNzE2NWY0NjhmNTY0ZjM3OTc_eylwfw.jpg"), filename: "castle", content_type: "image/jpg" }
castle_two.photos.attach([file1, file2, file3])
castle_two.save!
puts 'ok'

castle_three = Castle.new(
  description: "Edifié au sommet d'une falaise qui surplombe la Dordogne, le château de Beynac constituait un post idéal pour surveiller la rivière et sa vallée. De la fière forteresse médiévale érigée au XIIe siècle subsiste une partie des murs d'enceinte, le donjon et la partie centrale du logis seigneurial, que vinrent compléter trois nouveau corps d'habitation au siècle suivant.",
  price_per_day: 1000,
  name: "Beynac",
  subtitle: "Un balcon sur la Dordogne",
  style: "Château médiéval",
  department: "24 - Dordogne",
  address: "Route du château, 24220 Beynac-et-Cazenac",
  user_id: 2,
  number_of_bed: 5,
  number_of_room: 9,
  smokers_welcome: true,
  animals_welcome: true,
  wifi: false,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832466/castrvm/Chateau_de_Combourg_wf4ow8.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832452/castrvm/det_HEMIS_0463390ok_fovw1p.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832291/castrvm/MjAxNTAyMjJiMWNmNWU5ZDAzZjcwNzE2NWY0NjhmNTY0ZjM3OTc_eylwfw.jpg"), filename: "castle", content_type: "image/jpg" }
castle_three.photos.attach([file1, file2, file3])
castle_three.save!
puts 'ok'

castle_four = Castle.new(
  description: "Ces ruines imposantes qui s'élèvent sur un éperon rocheux entre les vallées de la Thèze et de la Lémance, à la frontière du Quercy, sont celles du tout dernier château fort féodal élevé en terre de France. Illustrant magnifiquement l'évolution des techniques de défense du Moyen Âge à la Renaissance, le château de Bonaguil, qui n'eut à subir aucun asssaut, fut en définitive démantelé à la Révolution.",
  price_per_day: 800,
  name: "Bonaguil",
  subtitle: "La dernière forteresse féodale",
  style: "Château fort",
  department: "47 - Lot-et-Garonne",
  address: "47500 Saint-Front-sur-Lémance",
  user_id: 3,
  number_of_bed: 4,
  number_of_room: 6,
  smokers_welcome: true,
  animals_welcome: true,
  wifi: true,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832466/castrvm/Chateau_de_Combourg_wf4ow8.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832452/castrvm/det_HEMIS_0463390ok_fovw1p.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832291/castrvm/MjAxNTAyMjJiMWNmNWU5ZDAzZjcwNzE2NWY0NjhmNTY0ZjM3OTc_eylwfw.jpg"), filename: "castle", content_type: "image/jpg" }
castle_four.photos.attach([file1, file2, file3])
castle_four.save!
puts 'ok'

castle_five = Castle.new(
  description: "Située aux confins du Nivernais et du Morvan, la forteresse médiévale de Bazoches conserve de ses origines défensives une allure massive de place forte et un plan en forme de quadrilatère irrégulier. De ses propriétaires successifs se détache la figure de l'illustre Vauban : c'est à Bazoches que l'ingénieur militaire de Louis XIV travailla aux plans de plus de trois cents ouvrages fortifiés.",
  price_per_day: 3500,
  name: "Bazoches",
  subtitle: "Une forteresse qui en vit naître beaucoup d'autres",
  style: "Gothique et classique",
  department: "58 - Nièvre",
  address: "58190 Château de Bazoches",
  user_id: 4,
  number_of_bed: 7,
  number_of_room: 16,
  smokers_welcome: false,
  animals_welcome: false,
  wifi: true,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832466/castrvm/Chateau_de_Combourg_wf4ow8.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832452/castrvm/det_HEMIS_0463390ok_fovw1p.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832291/castrvm/MjAxNTAyMjJiMWNmNWU5ZDAzZjcwNzE2NWY0NjhmNTY0ZjM3OTc_eylwfw.jpg"), filename: "castle", content_type: "image/jpg" }
castle_five.photos.attach([file1, file2, file3])
castle_five.save!
puts 'ok'

castle_six = Castle.new(
  description: "Harmonieuse combinaison de château fort et de résidence, Anjony dresse ses quatre tours rondes ornées de toits en poivrière au-dessus des vertes frondaisons de la vallée de la Doire. L'étrange château-donjon, bâti en pierre de lave, se trouva pendant plus de deux siècles au coeur d'une rivalité familiale digne de celle des Montaigu et des Capulet.",
  price_per_day: 1350,
  name: "Anjony",
  subtitle: "Le château de la discorde",
  style: "Tour forte",
  department: "15 - Cantal",
  address: "6010 Le Bourg, 15310 Tournemire",
  user_id: 5,
  number_of_bed: 5,
  number_of_room: 5,
  smokers_welcome: false,
  animals_welcome: true,
  wifi: true,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832466/castrvm/Chateau_de_Combourg_wf4ow8.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832452/castrvm/det_HEMIS_0463390ok_fovw1p.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1658832291/castrvm/MjAxNTAyMjJiMWNmNWU5ZDAzZjcwNzE2NWY0NjhmNTY0ZjM3OTc_eylwfw.jpg"), filename: "castle", content_type: "image/jpg" }
castle_six.photos.attach([file1, file2, file3])
castle_six.save!
puts 'ok'

puts 'castles created'

start_date = Date.today - 1
end_date = Date.today + 1

Booking.create!(
  total_price: Castle.last.price_per_day * (end_date - start_date).to_i,
  start_date: start_date,
  end_date: end_date,
  user_id: User.last.id,
  castle_id: Castle.last.id,
  number_of_guest: 4
)

puts 'Seeds created!'
