import Foundation

//
// XMLDocument is only available on MacOS
//

typealias NodeAttributes = [String: String]
typealias JSONDict = [String: Any]

class XDDOMNode:NSObject {
  var tag :String?
  var attributes :[String: String]?
  var text :String?
  var parent :XDDOMNode?
  var childrent :[XDDOMNode]?
}

class XDDOM:NSObject {
  var _contents :String?
  var document :XMLDocument?
  var root :XMLNode?
  var nodes :[String: [XDDOMNode]]?

  func contents() -> (String) {
    return _contents!
  }

  func contentSize() -> (Int) {
    return _contents!.characters.count
  }

  func setContents(html:String) {
    _contents = html
    let data = html.data(using:String.Encoding.utf8, allowLossyConversion:true)!

    document = try! XMLDocument(data:data, options:Int(XMLNode.Options.documentTidyHTML.rawValue))
    root = document!.rootElement()!
  }

  func find(tag:String, attributes:NodeAttributes?) -> [XDDOMNode]? {
    if nodes != nil && nodes![tag]!.count > 0 {
      return nodes![tag]!
    }
    
    if nodes == nil {
      nodes = [:]
      nodes![tag] = []
    }

    let xnodes = try! root!.nodes(forXPath:"//\(tag)") as! [XMLElement]
    print(xnodes)

    for node in xnodes {
      let x = XDDOMNode()
      x.tag = tag
      nodes![tag]!.append(x)

      print(node.name) 
      print(node.attribute(forName:"href"))
      print(node.stringValue)
    }

    return nil
  }
}

func xmlDocumentTest() {
  let contents = try! String(contentsOf:URL(string:"https://www.google.com")!)
  let dom = XDDOM()
  dom.setContents(html:contents)
  
  print(dom.find(tag:"link", attributes:nil))
}

xmlDocumentTest()