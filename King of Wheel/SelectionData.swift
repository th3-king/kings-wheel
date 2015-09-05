//
//  SelectionData.swift
//  King of Wheel
//
//  Created by Dan Scott on 3/08/2015.
//  Copyright © 2015 TopNotchApps. All rights reserved.
//

import Foundation
import UIKit

struct SelectionData {
    
    //Data for the SelectionViewController
    var choices = [
            ["card": "Ace",
                "word":"SNAKE EYES",
                "description":"You get to pick someone, whoever you pick has snake eyes and until someone gets another ace whoever looks at them has to drink!",
                "hint": "Pick someone hot 😉"],
    
            ["card": "Two",
                "word":"YOU DECIDE",
                "description":"You get to pick one person to drink!"],
    
            ["card": "Three",
                "word":"DRINK",
                "description":"You have to drink!"],
    
            ["card": "Four",
                "word":"WHORE'S!",
                "description":"Incorperate the ladies, all the boys yell 'Whores!' and all the girl have to drink!"],
    
            ["card": "Five",
                "word":"BUST A MOVE",
                "description":"You always wanted to be a dancer, this is your chance to shine. Perform a dance move, the next person has to copy it going clockwise around the cirle, until someone messes up and has to drink!"],
    
            ["card": "Six",
                "word":"DICKS",
                "description":"All the girls yell 'Dicks!' and all the boys have to drink!"],
    
            ["card": "Seven",
                "word":"HEAVEN",
                "description":"Everybody has to reach to the sky, last one to put their hands up has to drink!"],
    
            ["card": "Eight",
                "word":"MATE",
                "description":"Pick someone who has to drink whenever you have to drink! \n \n If someone else gets it the last one cancels out"],
    
            ["card":"Nine",
                "word":"RYHME IN TIME",
                "description":"Whoever picks the card has to say a word, you then have to go around the group and each person has to say a word that rhymes with yours, if they repeat someone else's or take too long they have to drink!"],
    
            ["card": "Ten",
                "word":"CATERGORY",
                "description":"Pick a catergory and going round the group they have to say something that fits the catergory, whoever says something different has to drink!",
                "hint":"Use naughty categories like Sex and liquor"],
    
            ["card": "Jack",
                "word":"NEVER HAVE I EVER",
                "description" : "The whole group puts up 3 fingers, you say a 'never have i ever' and whoever has done it puts a finger down, it goes around the group until someone has no fingers left has to drink!"],
    
            ["card" : "Queen",
                "word" : "QUESTIONS",
                "description" : "The player who just spinned starts by asking someone a question. That player then has to reply to someone with another question. This process continues until someone fails to ask a question and has to drink!"],
    
            ["card": "King",
                "word":"I RULE",
                "description":"Whoever picks the card gets to make a rule, anyone who doesn't follow the rule has to drink. when someone else draws a king the rule is replaced with theirs",
                "Hint": "A popular one is to say 'in bed' after everything say"]
        ]
    
    
    //Colours which match the wheels colours in order from ace to king
    var backgroundColors = [
        UIColor(red: 250/255, green: 250/255, blue: 249/255, alpha: 1),
        UIColor(red: 227/255, green: 63/255, blue: 40/255, alpha: 1),
        UIColor(red: 220/255, green: 40/255, blue: 66/255, alpha: 1),
        UIColor(red: 78/255, green: 192/255, blue: 222/255, alpha: 1),
        UIColor(red: 103/255, green: 228/255, blue: 96/255, alpha: 1),
        UIColor(red: 255/255, green: 144/255, blue: 10/255, alpha: 1),
        UIColor(red: 220/255, green: 61/255, blue: 254/255, alpha: 1),
        UIColor(red: 109/255, green: 248/255, blue: 183/255, alpha: 1),
        UIColor(red: 38/255, green: 103/255, blue: 206/255, alpha: 1),
        UIColor(red: 111/255, green: 47/255, blue: 222/255, alpha: 1),
        UIColor(red: 41/255, green: 89/255, blue: 14/255, alpha: 1),
        UIColor(red: 225/255, green: 39/255, blue: 40/255, alpha: 1),
        UIColor(red: 255/255, green: 255/255, blue: 10/255, alpha: 1)
        ]
    
    let fontColors = [
        //false is white
        false, //ace
        true,  //two
        true, //three
        false, //four
        false, //five
        false, //six
        true,  //seven
        false, //eight
        true,  //nine
        true,  //ten
        true,  //jack
        true,  //queen
        false  //king
    
    ]
    //Created a string which neatly sets out all the rules of the game used in DetailedViewController
    //Could of used a function and choices variable but would could have slowed app
    let rulesAsOne =
    "Ace (SNAKE EYES) \n" +
    "You get to pick someone, whoever you pick has snake eyes and until someone gets another ace whoever looks at them has to drink!\n\n" +
    
    "Two (YOU DECIDE)\n" +
    "You get to pick one person to drink!\n\n" +
    
    "Three (DRINK)\n" +
    "You have to drink!\n\n" +
    
    "Four (WHORE'S!)\n" +
    "Incorperate the ladies, all the boys yell 'Whores!' and all the girl have to drink!\n\n" +
    
    "Five (BUST A MOVE)\n" +
    "You always wanted to be a dancer, this is your chance to shine. Perform a dance move, the next person has to copy it going clockwise around the cirle, until someone messes up and has to drink!\n\n" +
    
    "Six (DICKS)\n" +
    "All the girls yell 'Dicks!' and all the boys have to drink!\n\n" +
    
    "Seven (HEAVEN)\n" +
    "Everybody has to reach to the sky, last one to put their hands up has to drink!\n\n" +
    
    "Eight (MATE)\n" +
    "Pick someone who has to drink whenever you have to drink! If someone else gets it the last one cancels out\n\n" +
    
    "Nine (RYHME IN TIME)\n" +
    "Whoever picks the card has to say a word, you then have to go around the group and each person has to say a word that rhymes with yours, if they repeat someone else's or take too long they have to drink!\n\n" +
    
    "Ten (CATERGORY)\n" +
    "Pick a catergory and going round the group they have to say something that fits the catergory, whoever says something different has to drink!\n\n" +
    
    "Jack (NEVER HAVE I EVER)\n" +
    "The whole group puts up 3 fingers, you say a 'never have i ever' and whoever has done it puts a finger down, it goes around the group until someone has no fingers left has to drink!\n\n" +
    
    "Queen (QUESTIONS)\n" +
    "The player who just spinned starts by asking someone a question. That player then has to reply to someone with another question. This process continues until someone fails to ask a question and has to drink!\n\n" +
    
    "King (I RULE)\n" +
    "Whoever picks the card gets to make a rule, anyone who doesn't follow the rule has to drink. when someone else draws a king the rule is replaced with theirs\n\n"
}