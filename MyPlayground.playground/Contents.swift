import UIKit

struct Queue<T> {
    var internalArrey = [T]()
    var count: Int{
        return internalArrey.count
    }
    mutating func add(_item: T){
        internalArrey.append(_item)
    }
    mutating func add(_item: [T]){
        self.internalArrey.append(contentsOf: _item)
    }
    mutating func remove() -> T?{
        if internalArrey.count > 0 {
            return internalArrey.removeFirst()
        } else {
            return nil
        }
    }
    
    public func filter(array: [T], predicateSomeClosure: (T) -> Bool) -> [T]{
        var tmpArray = [T]()
        for element in array{
            if predicateSomeClosure(element){
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
    
    subscript(index: Int) -> T?{
        if index > internalArrey.count || index < 0{
            return nil
        }else{
            return internalArrey[index]
        }
    }
}
var queue = Queue<Int>()
queue.add([1,2,3,4,5,6,7,8,9])
print(queue)
let filterQueue = queue.filter(array: queue.internalArrey) {
    (i: Int) -> Bool in return i % 2 == 1
}
print(filterQueue)
queue.count

