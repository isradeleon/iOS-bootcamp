struct Town {
    let name: String
    var citizens: [String]
    var statistics: [String: Int]
    
    init(name: String, citizens: [String], statistics: [String : Int]) {
        self.name = name
        self.citizens = citizens
        self.statistics = statistics
    }
    
    func collectTaxes() {
        print("Collecting taxes now...")
        for citizen in citizens {
            let paidTaxes = Int.random(in: 100...10_000)
            print("\(citizen) paid \(paidTaxes)")
        }
    }
}

let myTown = Town(
    name: "Gothic City",
    citizens: ["Batman", "Joker"],
    statistics: ["Gold": 100, "Silver": 1_000, "Sheep": 30_000, "Wool": 100_000]
)

myTown.collectTaxes()
