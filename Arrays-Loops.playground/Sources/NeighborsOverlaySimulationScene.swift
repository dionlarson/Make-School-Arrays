//
//  NeighborsOverlaySimulationScene.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 3/7/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public class NeighborsOverlaySimulationScene: SimulationScene {
    
    let neighborsSim: NeighborsSimulation
    
    let correctColor = UIColor.greenColor()
    let incorrectColor = UIColor.redColor()
    
    public init(sim: NeighborsSimulation, palette: [Character?], size: CGSize) {
        self.neighborsSim = sim
        super.init(sim: sim, palette: palette, size: size)
        checkNeighbors()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func timerUpdate() {
        super.timerUpdate()
        checkNeighbors()
    }
    
    func checkNeighbors() {
        for i in 0..<sim.grid.count {
            for j in 0..<sim.grid[i].count {
                let solutionCount = countNeighbors(sim.grid, column: i, row: j)
                let count = neighborsSim.countNeighbors(sim.grid, column: i, row: j)
                let color = solutionCount == count ? correctColor : incorrectColor
                grid.setOverlayText(i, j, text: String(count), color: color)
            }
        }
    }
    
    func countNeighbors(map: [[Character?]], column i: Int, row j: Int) -> Int {
        var count = 0
        count += isCellAlive(map, column: i-1, row: j)
        count += isCellAlive(map, column: i+1, row: j)
        count += isCellAlive(map, column: i, row: j-1)
        count += isCellAlive(map, column: i, row: j+1)
        count += isCellAlive(map, column: i-1, row: j-1)
        count += isCellAlive(map, column: i-1, row: j+1)
        count += isCellAlive(map, column: i+1, row: j-1)
        count += isCellAlive(map, column: i+1, row: j+1)
        return count
    }
    
    func isCellAlive(map: [[Character?]], column i: Int, row j: Int) -> Int {
        if i < 0 || map.count <= i {
            return 0
        }
        if j < 0 || map[0].count <= j {
            return 0
        }
        return map[i][j] != nil ? 1 : 0
    }
}