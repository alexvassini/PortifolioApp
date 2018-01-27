//
//  achievementsModel.swift
//  resumeApp
//
//  Created by Alexandre  Vassinievski on 26/01/2018.
//  Copyright © 2018 Vassini. All rights reserved.
//

import Foundation

class AchievementsModel {
  
  var achievements: [Achievement] = []
  
  init() {
    achievements.append(Achievement(name: "Useless Superpower", description: "Dobrar lençol com elastico com maestria e precisão"))
    achievements.append(Achievement(name: "Top Gun 1", description: "Pilotou um avião e sobreviveu"))
    achievements.append(Achievement(name: "Top Gun 2", description: "Pilotou um helicoptero e sobreviveu"))
    achievements.append(Achievement(name: "Mental Sanity", description: "Concluiu a graduação e não surtou"))
    achievements.append(Achievement(name: "Mental Sanity 2", description: "Concluiu a primeira Pós Graduação"))
    achievements.append(Achievement(name: "Rodrigo Hilbert", description: "Lava, passa e cozinha, só falta ser bonito"))
    achievements.append(Achievement(name: "Turn the table", description: "Trocou de carreira e virou programador"))
    achievements.append(Achievement(name: "Scholarship Award 2017", description: "Weeeeeeeeee"))
    achievements.append(Achievement(name: "Texas Ranger", description: "Passou pela alfandega falando ingles com um texano"))
  }
  
}


class Achievement {
  
  var name: String!
  var description: String!
  
  init(name: String, description: String) {
    
    self.name = name
    self.description = description
    
  }
  
}


