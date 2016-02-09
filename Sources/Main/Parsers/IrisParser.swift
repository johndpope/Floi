import Foundation

class IrisParser: DataParser {

    func parseFile( filename:String ) -> [(classification:String, vector:[Double], ignore:[String])] {
        if let contentsOfFile = readFile(filename) {
            let lines: [String] = contentsOfFile.componentsSeparatedByString("\n").filter({ $0 != "" });
            var contents : [[String]] = lines.map({ $0.componentsSeparatedByString("\t") })

            let format = contents[0];
            return parseData( Array(contents[1..<contents.count]) , format: format );
        }else{
            print("Failed to read File.  Program Complete");
            return [];
        }
    }

    func parseData( contents:[[String]], format:[String] ) -> [(classification:String, vector:[Double], ignore:[String])] {
        var data: [(classification:String, vector:[Double], ignore:[String])] = []
        for line in contents {
            var dataEntry = (classification:"", vector:[Double](), ignore:[String]())
            for i in 0..<line.count {
                switch format[i] {
                    case "num":
                        dataEntry.vector.append( Double(line[i])! );
                    case "comment":
                        dataEntry.ignore.append( line[i] )
                    case "class":
                        dataEntry.classification = line[i]
                    default:
                        break;
                }
            }
            data.append( dataEntry );
        }
        return data;
    }


}