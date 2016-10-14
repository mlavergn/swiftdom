import Foundation

print("starting ...")

let contents = try! String(contentsOf:URL(string:"https://www.google.com")!)

print("\nxmlParser ...")
xmlParser(contents:contents)

let data = contents.data(using:String.Encoding.utf8, allowLossyConversion:true)!

print("\nxmlDocument ...")
xmlDocument(data:data)

print("\nxpath ...")
xpath(data:data)

print("\ndone")
