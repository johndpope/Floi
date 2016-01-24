//TODO: Write a function for computeNearestNeighbour


enum Choice {
    case Like
    case Dislike
}

//Computes the manhattan distance between two vectors
func manhattan( vector1:[Double], vector2:[Double] ) -> Double {
    return abs( Array(zip(vector1,vector2)).map({ $0.0 - $0.1 }).reduce(0, combine:+) )
}

//Creates a sorted list of items based on their distances to item
func computeNearestNeighbour( item:String , itemVector:[Double], items:[String:[Double]] ) -> [Double] {
    var distances: [Double] = []
    for (otherItem,vectors) in items {
        if otherItem != item {
            distances.append( manhattan( itemVector, vector2:vectors ) )
        }
    }
    return distances.sort()
}

// func classify( user, itemName, itemVectors )
