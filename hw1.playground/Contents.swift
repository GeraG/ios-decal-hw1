//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?

//: They're slightly different. The values passed into the init function are of type 
//: optional string, the instance variables are of type optional string implicity unwrapped.
//: Variables of type optional string implicity unwrapped can be assigned to another
//: variable of type String, of type Optional String, or of type Optional String implicity
//: unwrapped. Although assigning it to another variable without an explicit type will not
//: unwrap it and will assign Optional String type.


//: ## Q2: Variable Types and Function Types
    class func arePalindromes(_ words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reversed())}
        let numElements = words.count
        
        for i in 0 ..< numElements {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
//: ### Why does the compiler dislike the **for loop**? Fix it.
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: There was nothing wrong with the for loop itself, but there was a missing return statement after the for loop and Bool is the expected value to be returned. The other issue was that the method was defined as an instance method, meaning it could only be called by instances of the class, not by the class itself. In our code it's being called by the class itself and needs to be defined as a class method for this to work.


//: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters: [Character : Int] = [:] //Line X
        var lenA = self.wordA.characters.count
        var lenB = self.wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
//: ### What is the problem with declaring **countLetters** as we do in **Line X**,
//: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: countLetters was used in Line Y before being intialized in Line X so we there was
//: no dictionary to look in. Initializing it to an empty dictionary fixed it.
//: The other thing that's wrong is isAnagram() was being called by an instance object
//: of the class, but isAnagram() is a class method. To fix, remove the class keyword
//: to make it an instance method. The final thing wrong is that the function never
//: returned a true boolean value. Instead, it returned nil which is not of type Bool.
//: This was fixed by returning true instead of nil.
    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(["hih", "racecar", "mom", "wow"])
Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
