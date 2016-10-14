import Foundation

//
// XMLDocument is only available on MacOS
//

func xmlDocument(data:Data) {
  let doc = try! XMLDocument(data:data, options:Int(XMLNode.Options.documentTidyHTML.rawValue))
  let root = doc.rootElement()!
  // print(root)

  //let nodes = try! root.nodes(forXPath:"//link/@href")
  let nodes = try! root.nodes(forXPath:"//link")
  print(nodes)

  for node in nodes {
  	print(type(of:node))
  	print(node.attributeKeys)
  	print(node.children)
    print(node.child(at:0))
  	// print(node.attribute(withName:"href"))
  }
}