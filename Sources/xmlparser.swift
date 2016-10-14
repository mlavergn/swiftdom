import Foundation

//
// XMLParser only works on strict formatted HTML
//

class DOM:NSObject, XMLParserDelegate {
  var parser:XMLParser!

  //
  // XMLParser doesn't tolerate anything but strictly formatted HTML.
  // We would have to run through the raw HTML and fix everything before
  // passing it to XMLParser. This is fragile at best.
  //
  func tidyContents(contents:String) -> Data {
    var tidyContents = contents.trimmingCharacters(in:NSCharacterSet.whitespacesAndNewlines)
    
    let index = tidyContents.index(tidyContents.startIndex, offsetBy:"<!doctype html>".characters.count)
    tidyContents = tidyContents.substring(from:index)

    tidyContents = tidyContents.replacingOccurrences(of:"&", with:"&amp;")
    tidyContents = tidyContents.replacingOccurrences(of:"<=", with:"&lt;=")

    let tidyData = tidyContents.data(using:String.Encoding.utf8, allowLossyConversion:true)!
    
    return tidyData
  }

  func setContents(contents:String) {
    let tidyData = self.tidyContents(contents:contents)
    
    parser = XMLParser(data:tidyData)
    parser.delegate = self
    parser.parse()
    
    let error = parser.parserError
    if error != nil {
      print(error, parser.lineNumber, parser.columnNumber)
      print(tidyContents)
    }
  }

  func parserDidStartDocument(_:XMLParser) {
    print("parserDidStartDocument")
  }

  func parser(_:XMLParser, didStartElement elementName:String, namespaceURI:String?, qualifiedName:String?, attributes:[String:String]) {
    print("didStartElement:", elementName)
    // start collecting strings
  }

  func parser(_:XMLParser, foundCharacters:String) {
    print("foundCharacters:", foundCharacters.characters.count)
  }

  func parser(_:XMLParser, didEndElement elementName:String, namespaceURI:String?, qualifiedName qName:String?) {
    print("didEndElement:", elementName)
    // stop collecting strings
  }

  func parserDidEndDocument(_:XMLParser) {
    print("parserDidEndDocument")
  }
}

func xmlParser(contents:String) {
  let dom = DOM()
  dom.setContents(contents:contents)
}