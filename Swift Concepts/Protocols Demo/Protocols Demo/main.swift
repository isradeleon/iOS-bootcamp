// Flying things
let eagle = Eagle()
let airplane = Airplane()

// Non flying birds
let penguin = Penguin()
// Penguins can't fly, but they can swim!
penguin.swim()

let museum = FlyingMuseum()
// No penguins allowed for obvious reasons...
museum.showFlyingDemo(flyingObjs: [eagle, airplane])
