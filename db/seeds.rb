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
  id: 1,
  first_name: "Sylvie",
  last_name: "Nolan",
  email: "sylvie.nolan@laposte.net",
  password: "sylviiie",
)
User.create(
  id: 2,
  first_name: "Georges",
  last_name: "Bondel",
  email: "georges.bondel@yahoo.fr",
  password: "georgio",
)
User.create(
  id: 3,
  first_name: "Caroline",
  last_name: "Dupont",
  email: "caroline.dpt@gmail.com",
  password: "azerty",
)
User.create(
  id: 4,
  first_name: "Etienne",
  last_name: "Lemarchand",
  email: "etiennelmd@gmail.com",
  password: "123456",
)
User.create(
  id: 5,
  first_name: "Alexandre",
  last_name: "Duverneuil",
  email: "alexdvn@gmail.com",
  password: "123456",
)
User.create(
  id: 6,
  first_name: "Kevin",
  last_name: "Machin",
  email: "kevdev@gmail.com",
  password: "123456",
)
User.create(
  id: 7,
  first_name: "Jean-Michel",
  last_name: "Cantal",
  email: "jean-michel.cantal@gmail.com",
  password: "123456",
)
User.create(
  id: 8,
  first_name: "Emma",
  last_name: "Proust",
  email: "emmaproust@gmail.com",
  password: "123456",
)
User.create(
  id: 9,
  first_name: "Brigitte",
  last_name: "Durand",
  email: "bdurand@gmail.com",
  password: "123456",
)
User.create(
  id: 10,
  first_name: "Elodie",
  last_name: "Roland",
  email: "elo@gmail.com",
  password: "123456",
)
User.create(
  id: 11,
  first_name: "Jacques-Antoine",
  last_name: "de Cugnac",
  email: "ja.dc@gmail.com",
  password: "moviefinder",
)

puts 'Users created'

puts 'Creating castles'


castle_one = Castle.new(
  description: "Situé en Bretagne, entre Fougères et Dinan, Combourg, hautaine forteresse féodale, domine un étang mélancolique encombré de roseaux, dans un paysage austère de landes et de bois. Ces lieux ont profondément marqué Chateaubriand, l'un des précurseurs du romantisme en France, qui y passa toute son enfance. \"C\'est dans les bois de Combourg que je suis devenu ce que je suis, que j\'ai commencé à sentir la première atteinte de cet ennui que j\'ai traîné toute ma vie, de cette tristesse qui a fait mon tourment et ma félicité.\" Edifié au XIe siècle, le château est complètement rénové au XIXe.",
  price_per_day: 1500,
  name: "Combourg",
  subtitle: "Un château au cœur des lettres françaises",
  department: "35 - Ille-et-Vilaine",
  address: "23 Rue des Princes, 35270 Combourg",
  user_id: 1,
  number_of_bed: 7,
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
  department: "64 - Pyrénées-Atlantiques",
  address: "Rte de la Corniche, 64700 Hendaye",
  user_id: 2,
  number_of_bed: 9,
  smokers_welcome: true,
  animals_welcome: true,
  wifi: true,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659029742/castrvm/Abbadia-2021-2-2_to0b0l.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659029752/castrvm/Abbadia_-_Nord_wp6hwu.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659029754/castrvm/qtZoXCWzemHovSFdrHcu0mSJEoI_xgvy3w.jpg"), filename: "castle", content_type: "image/jpg" }
file4 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659029762/castrvm/interieur-chateau-observatoire-abbadia-hendaye_gxceqp.jpg"), filename: "castle", content_type: "image/jpg" }
file5 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659029767/castrvm/14_sdxlel.jpg"), filename: "castle", content_type: "image/jpg" }
castle_two.photos.attach([file1, file2, file3, file4, file5])
castle_two.save!
puts 'ok'

castle_three = Castle.new(
  description: "Edifié au sommet d'une falaise qui surplombe la Dordogne, le château de Beynac constituait un post idéal pour surveiller la rivière et sa vallée. De la fière forteresse médiévale érigée au XIIe siècle subsiste une partie des murs d'enceinte, le donjon et la partie centrale du logis seigneurial, que vinrent compléter trois nouveau corps d'habitation au siècle suivant.",
  price_per_day: 1000,
  name: "Beynac",
  subtitle: "Un balcon sur la Dordogne",
  department: "24 - Dordogne",
  address: "Route du château, 24220 Beynac-et-Cazenac",
  user_id: 11,
  number_of_bed: 5,
  smokers_welcome: true,
  animals_welcome: true,
  wifi: false,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659029332/castrvm/Beynac_plaquette_ciel_sansnuage-copie_tocrp8.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659029341/castrvm/Ch%C3%A2teau_de_Beynac__Dordogne_e2ut3h.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659029417/castrvm/le-chateau-de-beynac-vue-2_ljst9m.jpg"), filename: "castle", content_type: "image/jpg" }
file4 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659029518/castrvm/chateau-beynac-1102057_pymdcn.jpg"), filename: "castle", content_type: "image/jpg" }
castle_three.photos.attach([file1, file2, file3, file4])
castle_three.save!
puts 'ok'

castle_four = Castle.new(
  description: "Ces ruines imposantes qui s'élèvent sur un éperon rocheux entre les vallées de la Thèze et de la Lémance, à la frontière du Quercy, sont celles du tout dernier château fort féodal élevé en terre de France. Illustrant magnifiquement l'évolution des techniques de défense du Moyen Âge à la Renaissance, le château de Bonaguil, qui n'eut à subir aucun asssaut, fut en définitive démantelé à la Révolution.",
  price_per_day: 800,
  name: "Bonaguil",
  subtitle: "La dernière forteresse féodale",
  department: "47 - Lot-et-Garonne",
  address: "Château de Bonaguil, 47500 Saint-Front-sur-Lémance",
  user_id: 3,
  number_of_bed: 4,
  smokers_welcome: true,
  animals_welcome: true,
  wifi: true,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030010/castrvm/jerome_morel_-_bonaguil_nfgabw.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030036/castrvm/273271214_10158670443060737_1696220543563524887_n_dd5cag.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030038/castrvm/bonaguil--1-_azqma2.jpg"), filename: "castle", content_type: "image/jpg" }
file4 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030043/castrvm/interieur-bonaguil_wgygqf.jpg"), filename: "castle", content_type: "image/jpg" }
castle_four.photos.attach([file1, file2, file3, file4])
castle_four.save!
puts 'ok'

castle_five = Castle.new(
  description: "Située aux confins du Nivernais et du Morvan, la forteresse médiévale de Bazoches conserve de ses origines défensives une allure massive de place forte et un plan en forme de quadrilatère irrégulier. De ses propriétaires successifs se détache la figure de l'illustre Vauban : c'est à Bazoches que l'ingénieur militaire de Louis XIV travailla aux plans de plus de trois cents ouvrages fortifiés.",
  price_per_day: 3500,
  name: "Bazoches",
  subtitle: "Une forteresse qui en vit naître beaucoup d'autres",
  department: "58 - Nièvre",
  address: "58190 Château de Bazoches",
  user_id: 4,
  number_of_bed: 7,
  smokers_welcome: false,
  animals_welcome: false,
  wifi: true,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030266/castrvm/Bazoches-ch%C3%A2teau-1_jnwr4b.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030270/castrvm/vue-aerienne-chateau-de-bazoches-copyright_zipoe2.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030277/castrvm/chateau-de-bazoches_i3jk56.jpg"), filename: "castle", content_type: "image/jpg" }
file4 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030287/castrvm/2000004517749_lblat1.webp"), filename: "castle", content_type: "image/jpg" }
file5 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030297/castrvm/25016484138_0d4380176a_b_gmusrv.jpg"), filename: "castle", content_type: "image/jpg" }
file6 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030303/castrvm/ec992689062999054ac2f656eab11ca3-alain_doire__bourgogne-franche-comte_tourisme-bfc_0012668a4-890x0-6ef846609f5ffe818695c2f6aa6ab987_thurls.jpg"), filename: "castle", content_type: "image/jpg" }
castle_five.photos.attach([file1, file2, file3, file4, file5, file6])
castle_five.save!
puts 'ok'

castle_six = Castle.new(
  description: "Harmonieuse combinaison de château fort et de résidence, Anjony dresse ses quatre tours rondes ornées de toits en poivrière au-dessus des vertes frondaisons de la vallée de la Doire. L'étrange château-donjon, bâti en pierre de lave, se trouva pendant plus de deux siècles au cœur d'une rivalité familiale digne de celle des Montaigu et des Capulet.",
  price_per_day: 1350,
  name: "Anjony",
  subtitle: "Le château de la discorde",
  department: "15 - Cantal",
  address: "Château d'Anjony, 15310 Tournemire",
  user_id: 5,
  number_of_bed: 5,
  smokers_welcome: false,
  animals_welcome: true,
  wifi: true,
  indexed: true
)
file1 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030520/castrvm/det_15_-_Tournemire_xctwkb.jpg"), filename: "castle", content_type: "image/jpg" }
file2 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030530/castrvm/Anjony_1_nmndg8.jpg"), filename: "castle", content_type: "image/jpg" }
file3 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030542/castrvm/13398157-diaporama_xpmwjj.jpg"), filename: "castle", content_type: "image/jpg" }
file4 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030553/castrvm/b6ed60c9cabd5751e2116376c8b8cfd4_dpaab2.jpg"), filename: "castle", content_type: "image/jpg" }
file5 = { io: URI.open("https://res.cloudinary.com/djyykxv2u/image/upload/v1659030668/castrvm/454812-551258_gov8r8.jpg"), filename: "castle", content_type: "image/jpg" }
castle_six.photos.attach([file1, file2, file3, file4, file5])
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
