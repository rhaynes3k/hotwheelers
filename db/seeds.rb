rommel = Hotwheeler.create(name: "Rommel", age: "49", fav: "nil", username: "rom1", password: "rom1")
alexandria = Hotwheeler.create(name: "Alexandria", age: "11", fav: "nil", username: "alex1", password: "alex1")
jurnee = Hotwheeler.create(name: "Jurnee", age: "9", fav: "nil", username: "jur1", password: "jur1")
angie = Hotwheeler.create(name: "Angie", age: "45", fav: "nil", username: "ang1", password: "ang1")


rommel.cars.build(year: "2001", make: "Chevy", model: "Cavalier", color: "Brown", rank: "5", hotwheeler_id: 1)
rommel.save
alex.cars.build(year: "2005", make: "Honda", model: "Civic", color: "Orange", rank: "2", hotwheeler_id: 2)
alex.save
jurnee.cars.build(year: "2010", make: "Dodge", model: "Durango", color: "Purple", rank: "4", hotwheeler_id: 3)
jurnee.save
angie.cars.build(year: "2015", make: "Pontiac", model: "Bonneville", color: "Green", rank: "3", hotwheeler_id: 4)
angie.save
rommel.cars.build(year: "2020", make: "Cadillac", model: "CTS", color: "Blue", rank: "1", hotwheeler_id: 2)
rommel.save
