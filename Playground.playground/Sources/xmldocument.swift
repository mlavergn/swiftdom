import Foundation

//
// XMLDocument is only available on MacOS
//

public class XDDOMNode: NSObject {
	var tag :String?
	var attributes :[String: String]?
	var text :String?
	var parent :XDDOMNode?
	var childrent :[XDDOMNode]?
}

public class XDDOM: NSObject {
	public typealias NodeAttributes = [String: String]
	public typealias JSONDict = [String: Any]

	public var _contents :String?
	public var document :XMLDocument?
	public var root :XMLNode?
	public var nodes :[String: [XDDOMNode]]?

	public func contents() -> (String) {
		return _contents!
	}

	public func contentSize() -> (Int) {
		return _contents!.characters.count
	}

	public func setContents(html:String) {
		_contents = html
		let data = html.data(using:String.Encoding.utf8, allowLossyConversion:true)!

		document = try! XMLDocument(data:data, options:Int(XMLNode.Options.documentTidyHTML.rawValue))
		root = document!.rootElement()!
	}

	public func find(tag:String, attributes:NodeAttributes?) -> [XDDOMNode]? {
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
