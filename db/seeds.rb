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

castles = [
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: 2,
    name: "Grand lit en bois de hêtre",
    department: "01 - Ain",
    address: "11 rue de Rivoli, Paris",
    user_id: 1,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 1,
    name: "Canapé en cuir 2 places",
    department: "01 - Ain",
    address: "140 boulevard du Montparnasse, Paris",
    user_id: 1,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: 1,
    name: "Lot de 2 chaises d'école rouges",
    department: "01 - Ain",
    address: "53 avenue des Champs Elysées, Paris",
    user_id: 2,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: 2,
    name: "Table basse en verre",
    department: "01 - Ain",
    address: "25 rue Caulaincourt, Paris",
    user_id: 3,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 3,
    name: "Table en bois 6 places",
    department: "01 - Ain",
    address: "13 bis avenue de la Motte-Picquet, Paris",
    user_id: 4,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 1,
    name: "Canapé gris confortable",
    department: "01 - Ain",
    address: "11 rue Malar, Paris",
    user_id: 5,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 2,
    name: "Tabouret haut de bar",
    department: "01 - Ain",
    address: "25 avenue de la République, Montrouge",
    user_id: 6,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "Sleeper sofa offers around-the-clock comfort. The adjustable back allows you to sit during the day, lean back in the evening and lie down at night. The Vissle gray cover fits in just about anywhere.",
    price_per_day: 3,
    name: "Armoire en chêne massif",
    department: "01 - Ain",
    address: "2 rue Boissonade, Paris",
    user_id: 7,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "A clean expression that fits right in, in the bedroom or wherever you place it. Smooth-running drawers and in a choice of finishes – pick your favorite. Psst! Please attach to the wall.",
    price_per_day: 2,
    name: "Lit 2 places avec tête de lit",
    department: "01 - Ain",
    address: "10 rue Daguerre, Paris",
    user_id: 8,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 4,
    name: "Fauteuil Louis XV très bon état",
    department: "01 - Ain",
    address: "5 rue Boulard, Paris",
    user_id: 8,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 1,
    name: "Lampe d'architecte",
    department: "01 - Ain",
    address: "1 place de la Contrescarpe, Paris",
    user_id: 7,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "This table for 4 blends a warm wood expression with sturdy metal in a slim design that’s pleasing to the eye even in smaller spaces. Pair it with SANDSBERG chair to create a welcoming and coordinated look.",
    price_per_day: 2,
    name: "Lampe de chevet led",
    department: "01 - Ain",
    address: "65 rue de Turbigo, Paris",
    user_id: 6,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: 4,
    name: "Bureau moderne et design",
    department: "01 - Ain",
    address: "194 rue de Javel, Paris",
    user_id: 9,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 4,
    name: "Lot de 2 tables de chevet identiques",
    department: "01 - Ain",
    address: "3 rue Messine, Paris",
    user_id: 10,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "You know the feeling when you sit, lie down or hang out in a sofa, rather than on it. That’s how embracing the deep and generous UPPLAND sofa is – your new favorite place for cozy evenings and lazy days!",
    price_per_day: 5,
    name: "Tapis en peau d'ours",
    department: "01 - Ain",
    address: "6 rue de la Soif, Paris",
    user_id: 10,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "A clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful.",
    price_per_day: 1,
    name: "Meuble TV ordinaire",
    department: "01 - Ain",
    address: "4 rue Madame, Paris",
    user_id: 10,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "This table for 4 blends a warm wood expression with sturdy metal in a slim design that’s pleasing to the eye even in smaller spaces. Pair it with SANDSBERG chair to create a welcoming and coordinated look.",
    price_per_day: 5,
    name: "Bibliothèque XVIIIe vernie",
    department: "01 - Ain",
    address: "16 villa Gaudelet, Paris",
    user_id: 9,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "Comfy seating throughout the home gives a relaxed feel – and with airy PELLO armchair you can easily create your comfort zones everywhere. The secrets are good back support and a slightly resilient frame!",
    price_per_day: 3,
    name: "Commode Empire",
    department: "01 - Ain",
    address: "15 avenue du général Leclerc, Paris",
    user_id: 1,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "Sleeper sofa offers around-the-clock comfort. The adjustable back allows you to sit during the day, lean back in the evening and lie down at night. The Vissle gray cover fits in just about anywhere.",
    price_per_day: 1,
    name: "Matelas une place",
    department: "01 - Ain",
    address: "3 place Vendôme, Paris",
    user_id: 2,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "This stackable, 3-legged stool with bent legs and triangular-shaped seat is a great little accent that’s comes in handy when you need extra seating for guests or a place to unload your cup of coffee or tea!",
    price_per_day: 2,
    name: "Four",
    department: "01 - Ain",
    address: "30 avenue Denfert-Rochereau, Paris",
    user_id: 3,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "A clean design with solid wood veneer. Place the bed on its own or with the headboard against a wall. If you need space for extra bedding, add MALM bed storage boxes on casters.",
    price_per_day: 1,
    name: "Fauteuil en osier",
    department: "01 - Ain",
    address: "112 avenue Daumesnil, Paris",
    user_id: 4,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "The black stainless steel and space-saving design set the tone in the kitchen. There are many options to tailor the space inside for easy access and a good overview, putting an end to food waste at home.",
    price_per_day: 5,
    name: "Lit king size",
    department: "01 - Ain",
    address: "64 boulevard Saint-Germain, Paris",
    user_id: 5,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  },
  {
    description: "This oven offers all the basic functions you need, including the convenience of self-clean. A look that fits right in and a smooth surface for easy cleaning.",
    price_per_day: 6,
    name: "Table marquetée XVIIe",
    department: "01 - Ain",
    address: "16 rue de Tanger, Paris",
    user_id: 5,
    number_of_bed: 4,
    number_of_room: 2,
    smokers_welcome: false,
    animals_welcome: true,
    wifi: true,
    favorite: false
  }
]

castles.each do |castle|
  cas = Castle.new(castle)
  file1 = { io: URI.open("https://source.unsplash.com/random/?chair"), filename: "castle", content_type: "image/png" }
  file2 = { io: URI.open("https://source.unsplash.com/random/?table"), filename: "castle", content_type: "image/png" }
  file3 = { io: URI.open("https://source.unsplash.com/random/?couch"), filename: "castle", content_type: "image/png" }
  cas.photos.attach([file1, file2, file3])
  cas.save!
  puts 'ok'
end

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
