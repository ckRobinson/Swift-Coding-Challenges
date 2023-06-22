import UIKit

func fib(input: Int, count: Int) -> [Int] {
    
    // Simple base case. Values < 0 are not part of Fib sequence.
    if(input < 0) {
        return [];
    }
    
    var map: Dictionary<Int, Int> = Dictionary();
    func fibInner(_ fibIndex: Int) -> Int {
        
        if let value = map[fibIndex] {
            return value
        }
        
        if fibIndex <= 1 {
            return fibIndex;
        }
        
        let calculated = fibInner(fibIndex - 1) + fibInner(fibIndex - 2);
        map[fibIndex] = calculated;

        return calculated
    }
    
    /**
     * Find either, our input value's Fib index, or the first Fib value larger than our input value.
     */
    var startingIndex = 0;
    while true {
        
        let fibValue = fibInner(startingIndex);
        if(fibValue == input) {
            break;
        }
        
        if(fibValue > input) {
            return [];
        }
        
        startingIndex += 1;
    }

    // Iterate over our range starting from the first value.
    let endIndex = startingIndex + count
    var result: [Int] = []
    for i in startingIndex..<endIndex {
        result.append(fibInner(i))
    }

    return result
}

print(fib(input: 3, count: 2));
print(fib(input: 5, count: 3));
print(fib(input: 4, count: 4));
