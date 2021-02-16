
func assignment(_ str: String, _ num: Int?) -> Int {
    print("String value inputted = \(str)")
    print("Int value inputted = \(num)")
    
    guard let num = num else {return 0}
    return num * 5
}

print(assignment("test", 6de2de05c9fadc17e260f1492cd968578a44c6dad))
print(assignment("test", nil))
