import 'hotel.dart';

class HotelsRepository {
  static List<Hotel> loadHotels() {
    const allHotels = <Hotel> [
      Hotel(
          id: 0,
          name: 'Burj Al Arab, Dubai',
          address: 'Burj Al Arab, Jumeirah Road, Umm Suqeim 3, Dubai, United Arab Emirates',
          imageAddress: 'https://www.skyscanner.com.au/wp-content/uploads/2018/05/burjexterior.jpg?fit=627,470',
          explain: 't’s hard to say what it was about the sail-shaped Burj Al Arab that inspired the phrase 7-star but the all-suite property’s fleet of Rolls-Royce Phantoms and 24-hour butler service might have had something to do with it! The décor at Dubai’s most famous hotel is as blinging as its clientele, with over 21,000 square feet of 24K-gold leaf gracing the property. Helicopter transfers, gold-plated iPads and Caviar facials are standard here, as are 8 attendants for every suite. (It makes you wonder what guests ask of them.)',
          star: 7),
      Hotel(
          id: 1,
          name: 'Emirates Palace Hotel, Abu Dhabi',
          address: ' Emirates Palace Hotel, West Corniche Road, Abu Dhabi, United Arab Emirates',
          imageAddress: 'https://www.skyscanner.com.au/wp-content/uploads/2018/05/emiratespalace.jpg?fit=627,470',
          explain: 'Next door in Abu Dhabi, the Emirates Palace Hotel wins the award for being one of the world’s most expensive hotels. Costing a mind-boggling three billion US dollars to build, the Emirates Palace features 1.3km of private beach, 128 kitchens, 114 domes and marble imported from 13 different countries (we assume the first 12 ran out!). The opulence extends from the grounds to the ceilings with 12 outdoor fountains, over 1000 Swarovski crystal chandeliers and a gold vending machine – for when you’re caught short without enough precious metal! Gold is not just worn at the Emirates Palace but eaten too – everything from camel burgers to the Palace Cappuccino get a dusting.',
          star: 4),
      Hotel(
          id: 2,
          name: 'Signiel Seoul, South Korea',
          address: 'Signiel Seoul, Sincheon-dong, South Korea, Seoul',
          imageAddress: 'https://www.skyscanner.com.au/wp-content/uploads/2018/05/signielseoul.jpg?fit=627,470',
          explain: 'The world’s newest 7-star hotel is also the loftiest. Situated in Lotte World Tower, the fifth highest building in the world, Signiel Seoul has quickly established itself as the most luxurious (and expensive) hotel in South Korea. A stay at Signiel Seoul comes with helicopter transfers, Michelin-starred chefs, the largest champagne bar in Asia and a bill for thousands of dollars!',
          star: 3),
      Hotel(
          id: 3,
          name: 'Pangu 7 Star Hotel, China',
          address: 'Pangu 7 Star Hotel, 27 N 4th Ring Rd Middle, Chaoyang Qu, Beijing Shi, China',
          imageAddress: 'https://www.skyscanner.com.au/wp-content/uploads/2018/05/pangu.jpg?fit=627,470',
          explain: 'Proudly overlooking the Beijing Olympic Park is the dragon-shaped Pangu 7 Star Hotel Beijing. Built by world-renowned Taiwanese architect C.Y. Lee, whose portfolio includes the 508-metre Taipei 101 Tower, the Pangu boasts 234 rooms that fuse Chinese classical tradition with contemporary European glamour while following the principles of feng shui. Standard rooms are a fairly pocket-friendly \$ 320 AUD per night but for the ultimate luxury Beijing experience you need to book the Sky Courtyard, a 2-storey private residence with a rooftop garden, wading pool, electronically retractable glass roof and artwork by Sir David Tang.',
          star: 7),
      Hotel(
          id: 4,
          name: 'Taj Falaknuma Palace, India',
          explain: 'Labelled as India’s only 7-star hotel, the Taj Falaknuma Palace was built in 1884 and was once owned by the Nizam (ruler) of Hyderabad, who was the world’s richest man at the time. An architectural splendour, the palace was built in the shape of a scorpion with two stings spread out as wings in the north and includes a walnut-clad replica of the library at Windsor Castle. Inside this phenomenal palace are a number of priceless artworks, manuscripts and furnishings including Belgian Osler Chandeliers and an extensive jade collection. (Clumsy guests should head somewhere else!) Now managed by Taj Hotels the palace has been restored to its 19th-century glory and offers guests Signature Experiences including arrival in a classic horse-drawn carriage and a welcome of rose petals on the Grand Staircase.',
          address: 'Taj Falaknuma Palace, Engine Bowli, Fatima Nagar, Falaknuma, Hyderabad, India',
          imageAddress: 'https://www.skyscanner.com.au/wp-content/uploads/2018/05/taj-1.jpg?fit=627,470',
          star: 3),
      Hotel(
          id: 5,
          name: 'Seven Stars Galleria, Italy',
          address: ' Seven Stars Galleria, Via Silvio Pellico, 8, 20121 Milano, Italy',
          explain: 'Europe’s only actual 7-star hotel (the owner hired a company to create a European ranking so they could officially take the title) is the Seven Stars Galleria in Milan. With only 20 rooms available it’s the most exclusive hotel on this list and you’ll be pretty lucky to get a room here – especially considering they tailor everything including the bed, meals and ambient music to each guest’s individual preference. This hotel is ‘seventh heaven’ (get it?) for shopaholics as the property’s private lift drops you directly in Galleria Vittorio Emanuele II, Italy’s oldest and grandest shopping arcade.',
          imageAddress: 'https://www.skyscanner.com.au/wp-content/uploads/2018/05/burjexterior.jpg?fit=627,470',
          star: 7),
      Hotel(
          id: 6,
          name: 'Laucala Private Island, Fiji',
          explain: 'The closest 7-star experience to Australia also happens to be the world’s most expensive! Laucala Private Island in Fiji is the largest private island in the Southern Hemisphere and its hefty price tag makes it one of the world’s most exclusive holiday destinations too. Owned by Red Bull co-founder, Dietrich Mateschitz, Laucala is where the likes of Oprah go to holiday away from the prying eyes of the public. The island has 25 private villas for rent, including the owner’s hilltop residence, if you have \$45,000 USD going spare! Activities you can partake in on the island include a paddle in a clear bottom kayak, ride on the resort’s submarine (yes, really) or a round of golf with a resident pro.',
          address: 'Laucala Private Island, Fiji',
          imageAddress: 'https://www.skyscanner.com.au/wp-content/uploads/2018/05/laucalaislandresort.jpg?fit=818,419',
          star: 6),
    ];
    return allHotels;
  }
}