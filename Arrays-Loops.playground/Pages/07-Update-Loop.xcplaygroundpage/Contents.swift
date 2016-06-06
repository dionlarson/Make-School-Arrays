class MySimulation: NeighborsSolutionSimulation {
//: [Previous](@previous)
/*:
 
 # The Update Loop
     
 ## The final touch

 We're almost there! Now it's time to write the update loop for Game of Life, so that the cells evolve according to the rules. To recap, the rules of Conway's Game of Life are:

 - Count the alive neighbors the cell has (diagonals included).
 - If the cell is alive:
    - It dies of underpopulation if it has _less than_ 2 neighbors
    - It stays alive if it has 2 or 3 neighbors
    - It dies of overpopulation if it has more than 3 neighbors
 - If the cell is dead:
    - If the dead cell has _exactly_ 3 neighbors, it becomes a live cell, via reproduction!

 Since we've already written the code that counts the neighbors of each cell, we can use our accumulated knowledge to iterate through each cell in the grid, and update the value accordingly!
     
 We'll use this Character "👾" in order to denote alive cells. This is stored into a variable entitled `liveChar` for your convenience. If cells are dead, they are set to `nil`. If they are alive, they are set to `liveChar`.
     
*/
    
    let liveChar: Character = "👾"
  
/*:
     
 This is the `update` function that will get called on each step of the simulation. Here, you're responsible for accessing `grid`, and updating its values.
     
 - Iterate through each row and column using bounds `grid.count` and `grid[0].count`
 - Get the neighbor count for each, using `countNeighbors(grid, column: x, row: y)`
 - Use `if` statements to check if cells are alive and count the living neighbors
 - Set the cell to its new state using the rules above!
    
 - note: Every time you make a change, your code will automatically run. A red overlay on some cells means that that cell value is incorrect.

 - callout(Plan your code): Think carefully about what you're doing when you set array elements as you iterate through them.
     
     - Is there a chance that some neighbors get counted using their "new" cell values instead of the old ones?
     - How could you fix this?
     
*/
    
    override func update() {
        // Student code here!
        grid // this contains your 2D grid! Update this value.
    }

/*:
     
 - callout(Hint): If you're having trouble, create a second grid to hold the next step's values. At the end of the update function, set `grid` = `newGrid`. Plan out your approach with a neighbor if you need to. This simple game is challenging to implement right on your first shot!
     
 ## Got it working?

 Congratulations! You've now completed this lengthy introduction to Arrays in Swift, _and_ you've created your very own implementation of Conway's Game of Life! In the next exercise we'll transfer your code into a full Xcode project so you can run it on your iPhone. Then we'll simulate s
     
*/

//: [Next](@next)







    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
/*:
Don't worry about this code. It handles the display.
*/
}
import XCPlayground
import SpriteKit
let size = CGSize(width: 320, height: 568)
let path = NSBundle.mainBundle().pathForResource("map01", ofType: "txt")!
let sim = MySimulation(file: path)!
let comparisonSim = GOLSolutionSimulation(other: sim)
let scene = SolutionOverlaySimulationScene(sim: sim, palette: defaultPalette(), solutionSim: comparisonSim, solutionPalette: defaultPalette(), size: size)
let sceneView = SKView(frame: CGRect(origin: CGPointZero, size: size))
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView

let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
dispatch_after(delayTime, dispatch_get_main_queue()) {
    scene.play()
}
