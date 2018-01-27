//
//  SkillsModel.swift
//  resumeApp
//
//  Created by Alexandre  Vassinievski on 26/01/2018.
//  Copyright © 2018 Vassini. All rights reserved.
//

import Foundation

class SkillModel {
  
  var skills: [Skill] = []
  
  init() {
    skills.append(Skill(name: "C++", percentage: 58))
    skills.append(Skill(name: "Microcontrollers", percentage: 82))
    skills.append(Skill(name: "Swift", percentage: 44))
    skills.append(Skill(name: "Java", percentage: 31))
    skills.append(Skill(name: "Flight Simulators", percentage: 92))
    skills.append(Skill(name: "Rocket Science", percentage: 1))
    skills.append(Skill(name: "Embedded electronics", percentage: 75))
    skills.append(Skill(name: "Dog anoying", percentage: 93))
    skills.append(Skill(name: "Girlfriend anoying", percentage: 57))
    skills.append(Skill(name: "Cooking", percentage: 56))
    skills.append(Skill(name: "Airplane flying", percentage: 3))
    skills.append(Skill(name: "Helicopter flying", percentage: 8))
    skills.append(Skill(name: "Neurosungery", percentage: 0))
    skills.append(Skill(name: "Car engine disassembly", percentage: 38))
    skills.append(Skill(name: "Car engine assembly", percentage: 2))
  }
  
}


class Skill {
  
  var name: String!
  var percentage: Int!
  
  init(name: String, percentage: Int) {
    
    self.name = name
    self.percentage = percentage
    
  }
  
}


