[
  User,
  Event,
  Comment,
  Invitation,
  Friendship
].each(&:delete_all)


alice = User.new(
  name: "Alice Anderson" ,
  username: "alice",
  role: "admin",
  bio: "Live in London, enjoy going out.",
  email: "alice@alice.com",
  password: "password"
)

bob = User.new(
  name: "Bob Byron",
  username: "bob",
  role: "admin",
  bio: "Live in London, enjoy going out.",
  email: "bob@bob.com",
  password: "password"
)

charlotte = User.new(
  name: "Charlotte Clarke",
  username: "charlotte",
  role: "user",
  bio: "Live in London, enjoy going out.",
  email: "charlotte@charlotte.com",
  password: "password"
)

dan = User.new(
  name: "Dan Davids",
  username: "dan",
  role: "user",
  bio: "Live in London, enjoy going out.",
  email: "dan@dan.com",
  password: "password"
)

ed = User.new(
  name: "Ed Erlandson",
  username: "ed",
  role: "user",
  bio: "Live in London, enjoy going out.",
  email: "ed@ed.com",
  password: "password"
)

fran = User.new(
  name: "Fran Frank",
  username: "fran",
  role: "user",
  bio: "Live in London, enjoy going out.",
  email: "fran@fran.com",
  password: "password"
)

gary = User.new(
  name: "Gary Greaves",
  username: "gary",
  role: "user",
  bio: "Live in London, enjoy going out.",
  email: "gary@gary.com",
  password: "password"
)

hilda = User.new(
  name: "Hilda Hodge",
  username: "hilda",
  role: "user",
  bio: "Live in London, enjoy going out.",
  email: "hilda@hilda.com",
  password: "password"
)

ida = User.new(
  name: "Ida Ilks",
  username: "ida",
  bio: "Live in London, enjoy going out.",
  email: "ida@ida.com",
  password: "password"
)

jack = User.new(
  name: "Jack Jones",
  username: "jack",
  bio: "Live in London, enjoy going out.",
  email: "jack@jack.com",
  password: "password"
)

[alice, bob, charlotte, dan, ed, fran, gary, hilda, ida, jack].each(&:skip_confirmation!).each(&:save!)

Event.create!(
  title: "Bye Bye Jack",
  description: "Jack's going away bash",
  address: "The Crown Tavern, 43 Clerkenwell Green",
  postcode: "EC1R 0EG",
  date: "21-08-2014",
  host_id: 1
)

Event.create!(
  title: "Get together",
  description: "Knees up",
  address: "90 Walton St, Oxford",
  postcode: "OX2 6EB",
  date: "14-10-2014",
  host_id: 5
)

Event.create!(
  title: "Let's meet up",
  description: "Shindig",
  address: "The Clerk And Well, 156 Clerkenwell Rd, London",
  postcode: "EC1R 5DU",
  date: "21-07-2014",
  host_id: 5
)

Event.create!(
  title: "Charlotte's birthday",
  description: "Charlotte's birthday do.",
  address: "The Fishes, North Hinksey Village, Oxford",
  postcode: "OX2 0NA",
  date: "24-07-2014",
  host_id: 4
)

Event.create!(
  title: "GA drinks",
  description: "Shindig",
  address: "9 Back Hill",
  postcode: "EC1R 5EN",
  date: "15-07-2014",
  host_id: 1
)

Event.create!(
  title: "Bye Bye Hilda",
  description: "Hilda's going away party",
  address: "The Crown Tavern, 43 Clerkenwell Green",
  postcode: "EC1R 0EG",
  date: "21-08-2014",
  host_id: 1
)

Event.create!(
  title: "Get together",
  description: "Knees up",
  address: "90 Walton St, Oxford",
  postcode: "OX2 6EB",
  date: "14-10-2014",
  host_id: 5
)

Event.create!(
  title: "Let's meet up",
  description: "Shindig",
  address: "The Clerk And Well, 156 Clerkenwell Rd, London",
  postcode: "EC1R 5DU",
  date: "21-07-2014",
  host_id: 2
)

Event.create!(
  title: "Ida's birthday",
  description: "Ida's birthday do.",
  address: "The Fishes, North Hinksey Village, Oxford",
  postcode: "OX2 0NA",
  date: "24-07-2014",
  host_id: 3
)

Event.create!(
  title: "GA drinks",
  description: "Shindig",
  address: "9 Back Hill",
  postcode: "EC1R 5EN",
  date: "15-07-2014",
  host_id: 1
)

Event.create!(
  title: "Bye Bye Jack",
  description: "Jack's going away bash",
  address: "The Crown Tavern, 43 Clerkenwell Green",
  postcode: "EC1R 0EG",
  date: "21-08-2014",
  host_id: 1
)

Event.create!(
  title: "Get together",
  description: "Knees up",
  address: "90 Walton St, Oxford",
  postcode: "OX2 6EB",
  date: "14-10-2014",
  host_id: 5
)

Event.create!(
  title: "Let's meet up",
  description: "Shindig",
  address: "The Clerk And Well, 156 Clerkenwell Rd, London",
  postcode: "EC1R 5DU",
  date: "21-07-2014",
  host_id: 5
)

Event.create!(
  title: "Charlotte's birthday",
  description: "Charlotte's birthday do.",
  address: "The Fishes, North Hinksey Village, Oxford",
  postcode: "OX2 0NA",
  date: "24-07-2014",
  host_id: 4
)

Event.create!(
  title: "GA drinks",
  description: "Shindig",
  address: "9 Back Hill",
  postcode: "EC1R 5EN",
  date: "15-07-2014",
  host_id: 1
)

Event.create!(
  title: "Bye Bye Hilda",
  description: "Hilda's going away party",
  address: "The Crown Tavern, 43 Clerkenwell Green",
  postcode: "EC1R 0EG",
  date: "21-08-2014",
  host_id: 1
)

Event.create!(
  title: "Get together",
  description: "Knees up",
  address: "90 Walton St, Oxford",
  postcode: "OX2 6EB",
  date: "14-10-2014",
  host_id: 5
)

Event.create!(
  title: "Let's meet up",
  description: "Shindig",
  address: "The Clerk And Well, 156 Clerkenwell Rd, London",
  postcode: "EC1R 5DU",
  date: "21-07-2014",
  host_id: 6
)

Event.create!(
  title: "Ida's birthday",
  description: "Ida's birthday do.",
  address: "The Fishes, North Hinksey Village, Oxford",
  postcode: "OX2 0NA",
  date: "24-07-2014",
  host_id: 7
)

Event.create!(
  title: "GA drinks",
  description: "Shindig",
  address: "9 Back Hill",
  postcode: "EC1R 5EN",
  date: "15-07-2014",
  host_id: 8
)


