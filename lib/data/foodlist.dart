List<Map<String, dynamic>> foodList = [
  {
    'id': 1,
    'name': 'Pizza',
    'description': 'Delicious pizza with various toppings',
    'price': 12.99,
    'image': 'https://media.gettyimages.com/id/938742222/photo/cheesy-pepperoni-pizza.jpg?s=612x612&w=gi&k=20&c=xzn3CpUBUV5Sa1UFftWFoSz1W_mp6fEN1G4_bQlDxZU=',
    'time': '30 minutes',
     'additive':  [ {'id':1, 'title':'Bacon', },
     {'id':1, 'title':'mushrooms', },
      {'id':1, 'title':'pepperoni', },
      {'id':1, 'title':'Extra cheese', },

    ] ,
    'rating': 4.5,
  },
  {
    'id': 2,
    'name': 'Burger',
    'description': 'Juicy burger with cheese and vegetables',
    'price': 8.99,
    'image': 'https://media.gettyimages.com/id/1452748723/photo/close-up-of-burger-on-table-indonesia.jpg?s=612x612&w=0&k=20&c=3bgvj-4UjF4I6cBQf2rn_i6FOTiLRBUzl0pwCg7XegU=',
    'time': '20 minutes',
    'additive':  [ {'id':1, 'title':'Bacon', },
     {'id':1, 'title':'mushrooms', },
      {'id':1, 'title':'pepperoni', },
      {'id':1, 'title':'Extra cheese', },

    ] ,
    'rating': 4.2,
  },
  // Add more food items with the modified "additive" field here
];