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

= Best Implementation
The page or feature that best implements each golden rule.
1. All pages, as the design is consistent across the application
2. The Keyboard Shortcuts popup activated when the user presses 'Alt/Option'
3. Order Page
4. Checkout Page
5. Rewards Page
6. Cart Page
7. Cart Page
8. History Page

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
The order pag shows all of our different bagel options. The user can easily click on any of the bagels to add one of them to their cart. Once they click on one of the bagels, they are taken to the Bagel Info page to increase or decrease their bagel count.

This page implementes golden rule eight as it has the bagel image, name, and price on every card, reducing the short term memory load needed by the user. It also pops out each bagel, and highlights on hover, as informative feedback for the user implementing golden rule three.

= Bagel Info Page
#figure(
  image("img/bagel-info.png"),
  caption: "The bagel info page."
)
#figure(
  image("img/bagel-info-more.png"),
  caption: "The bagel info page after pressing 'Add to Cart'."
)
After clicking on a bagel the user is taken to the Bagel Info Page. This allows the user to see the calorie information relating to each bagel and allows them to confirm that they would like to add the bagel to the cart. Once the bagel is added to the cart the user can then increase or decrease the number of bagels that they would like to purchase. If they decide against purchasing the bagel they can easily press the `Delete` button. The cost in the cart also updates live as the number of bagels in the cart increases and decreases.

This page offers informative feedback as pressing add to cart quickly becomes the quantity controls. The cost of the entire purchase also updating in the navbar as the user adds and subtracts amounts adds to this informative feedback implementing the third golden rule. We offer simple error handling as we disable the minus button at 1 bagel. This prevents the user from having 0 or negative bagels, implementing rule five. We also allow the user to undo their actions as `Delete` removes the bagel from the cart and the minus button allows the user to undo accidentally adding an extra bagel. This implements rule six. We also reduce short term memory load as the user can see exactly how many of that bagel are in their cart in between the plus and minus, and the total cost of the transaction easily in the top right. This reduction of short term memory load helps to implement rule eight.

= Cart Page
#figure(
  image("img/cart.png"),
  caption: "The cart page."
)
The cart page allows the user to see what bagels they are preparing to purchase. It allows us as users to 


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
Anddrew Roddy created the repository and initial README. He setup the structure of the SvelteKit project and organized the routes to navigate through the website. Then, he added all 11 of the bagel images that you see in the repository, made and styled the bagel card components in the order page. He continued to improve the CSS for the order page by adding a hover element.

Savar Shrestha created the discord chat and organized the group to have a total of 4 members. He tested out the javascript framework by loading bagel images 

Tatiana Tkacheva 

Michael Bonanno


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
