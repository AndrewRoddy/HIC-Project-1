// Setup
#set document(
  title: "HIC Project 1 Report",
  author: ("Tatiana Tkacheva", "Andrew Roddy", "Savar Shrestha", "Michael Bonanno")
)
#set page(
  paper: "us-letter",
  margin: (x: 2.5cm, y:2.5cm)
) 

// Title
#align(center)[
  #text(size: 20pt, weight: "bold")[HIC Project 1 Report] \
  #v(0.5em)
  Tatiana Tkacheva, Andrew Roddy, Savar Shrestha, Michael Bonanno \
  #datetime.today().display("[month repr:long] [day], [year]")
]

= Introduction
The app that we created is Bagl. This is an application that lets users purchase bagels and earn rewards! It also features hotkeys and an order history page so user's and view their previous orders.

= Home Page
#figure(
  image("img/home.png"),
  caption: "The home page."
)
When the user first opens the application they are taken to the home page

= Order Page
#figure(
  image("img/order.png"),
  caption: "The order page."
)
...

= Rewards Page
#figure(
  image("img/rewards.png"),
  caption: "The rewards page."
)
...

= Cart Page
#figure(
  image("img/cart.png"),
  caption: "The cart page."
)
...

= Checkout Page
#figure(
  image("img/checkout.png"),
  caption: "The checkout page."
)
...

= History Page
#figure(
  image("img/history.png"),
  caption: "The history page."
)
...

= Hotkeys
#figure(
  image("img/hotkeys.png"),
  caption: "The hotkeys dropdown acccessed by pressing Alt/Option."
)
...
