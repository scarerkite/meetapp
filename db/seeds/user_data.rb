
User.delete_all


#Users

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
  role: "user",
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
  role: "user",
  bio: "Live in London, enjoy going out.",
  email: "ida@ida.com",
  password: "password"
)

jack = User.new(
  name: "Jack Jones",
  username: "jack",
  role: "user",
  bio: "Live in London, enjoy going out.",
  email: "jack@jack.com",
  password: "password"
)

#[alice, bob, charlotte, dan, ed, fran, gary, hilda, ida, jack].each(&:skip_confirmation!).each(&:save!)

[alice, bob, charlotte, dan, ed, fran, gary, hilda, ida, jack].each(&:save!)







