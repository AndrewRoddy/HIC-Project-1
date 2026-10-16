// Setup
#set document(
  title: "HIC Project 1 Report",
  author: ("Tatiana Tkacheva", "Andrew Roddy", "Savar Shrestha", "Michael Bonanno")
)
#set page(
  paper: "us-letter",
  margin: (x: 2.5cm, y:2.5cm)
) 
// Makes links look right
#show link: set text(fill: rgb("#1a5fb4"))

// Title
#align(center)[
  #text(size: 20pt, weight: "bold")[HIC Project 1 Report] \
  #v(0.5em)
  Tatiana Tkacheva, Andrew Roddy, Savar Shrestha, Michael Bonanno \
  #datetime.today().display("[month repr:long] [day], [year]")
]

= Introduction
The app that we created is Bagl. This is an application that lets users purchase bagels and earn rewards! It also features hotkeys and an order history page so user's and view their previous orders.

We created an application with the goal of fully implementing Schneiderman's 8 golden rules.

= 8 Golden Rules
Schneiderman's 8 golden rules are:
1. Strive for Consistency
2. Enable Frequent Users to Use Shortcuts
3. Offer Informative Feedback
4. Design Dialogue to Yield Closure
5. Offer Simple Error Handling
6. Permit Easy Reversal of Actions
7. Support Internal Locus of Control
8. Reduce Short Term Memory Load

= Golden Rule Guide
This part lists the golden rule and what pages implement it.
1. All, Home, Order, Cart, History, Rewards
2. 
3. 
4. 
5. 
6. 
7. 
8. 


= Home Page
#figure(
  image("img/home.png"),
  caption: "The home page."
)
When the user first opens the application they are taken to the home page. This page shows the user our rewards and explains the website. It also features buttons that suggest the next actions the user will likely take. The buttons allow the user to quickly place an order or become a member.

The entire application applies the first golden rule of consistency. All of the applications have the same navbar, footer, and color pallette. They share the same accent color of \#ff922f orange, our company color.
On this home page, the two buttons at the bottom allow the user to be fully in control applying by allowing them to easily choose to either order now or join the rewards program, applying the seventh golden rule. 
For keyboard users we also feature a visible outline on all of our navbar buttons and also our 'Order Now' and 'Become a Member' buttons, this applies the 2nd golden rule of universal usability. 



= Order Page
#figure(
  image("img/order.png"),
  caption: "The order page."
)
The order pag shows all of our different bagel options. The user can easily click on any of the bagels to add one of them to their cart.

= Bagel Info Page
#figure(
  image("img/bagel-info.png"),
  caption: "The bagel info page."
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

= Rewards Page
#figure(
  image("img/rewards.png"),
  caption: "The rewards page."
)
...

= Hotkeys
#figure(
  image("img/hotkeys.png"),
  caption: "The hotkeys dropdown acccessed by pressing Alt/Option."
)
...

= Group Contributions
= Running the application
You can check out the application at: https://bagl-pi.vercel.app/

If you would like to run the application locally,
First run

```
npm install
```

Then to run the application use

```
npm run dev
```
