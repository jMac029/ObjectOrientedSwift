let x1 = 0
let y1 = 0

let coordinated1: (x: Int, y: Int) = (0,0)
coordinated1.x

/*Term Defintions

 struct (Structures)
    name: Use upper Camelcase
    structure of data or object
    inclosed properties inside of the fields
    “Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.”
 
        Excerpt From: Apple Inc. “The Swift Programming Language (Swift 2.2).” iBooks. https://itun.es/us/jEUH0.l
 
*/

struct Point {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func surroundingPoints(withRange range: Int = 1) -> [Point] {
        var results: [Point] = []
        for xCoord in (x-range)...(x+range) {
            for yCoord in (y-range)...(y+range) {
                let coordinatePoint = Point(x: xCoord, y: yCoord)
                results.append(coordinatePoint)
            }
        }
        return results
    }
}

let coordinatePoint = Point(x: 2, y: 2)
coordinatePoint.surroundingPoints()


class Enemy {
    var life: Int = 2
    let position: Point
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    func decreaseHealth(factor: Int) {
        life -= factor
    }
}

class Tower {
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    func fireAtEnemy(enemy: Enemy) {
        if inRange(self.position, range: self.range, target: enemy.position) {
            while enemy.life > 0 {
                enemy.decreaseHealth(self.strength)
                print("Enemy vanquished")
            }
        } else {
            print("Darn! the enemy is out of range!")
        }
    }
    
    func inRange(poistion: Point, range: Int, target: Point) -> Bool {
        
        let availablePositions = position.surroundingPoints(withRange: range)
        for point in availablePositions {
            if (point.x == target.x) && (point.y == target.y) {
                return true
            }
        }
        
        return false
        
    }
}

//Overriding Init

class SuperEnemy: Enemy {
    let isSuper: Bool = true
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.life = 50
    }
}

//Overriding Methods

class LaserTower: Tower {
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.range = 100
        self.strength = 100
    }
    
    override func fireAtEnemy(enemy: Enemy) {
        while enemy.life >= 0 {
            enemy.decreaseHealth(strength)
        }
        print("Enemy Vanquished!")
    }
}

//Instances of classes above

let tower1 = Tower(x: 0, y: 0)
let enemy1 = Enemy(x: 1, y: 1)
let enemy2 = Enemy(x: 4, y: 4)
let tower2 = Tower(x: 2, y: 2)
let superEnemy = SuperEnemy(x: 20, y: 20)
let laserTower = LaserTower(x: 0, y: 0)
laserTower.fireAtEnemy(superEnemy)

    
tower1.fireAtEnemy(enemy1)
tower2.fireAtEnemy(enemy2)





