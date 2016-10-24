import Foundation
import libxml2

//
// XPath requires a C bridge from Swift but is available on all platforms
//

class DOM:NSObject {
  var doc : htmlDocPtr?

  func setData(data:Data) {
    data.withUnsafeBytes {(bytes: UnsafePointer<CChar>)->Void in  
      doc = libxml2.htmlReadMemory(bytes, Int32(data.count), "", nil, Int32(HTML_PARSE_NOWARNING.rawValue | HTML_PARSE_NOERROR.rawValue))
      print(doc)
    }    
  }

  func find(query:String) {
    let xpathCtx = libxml2.xmlXPathNewContext(doc)
    // let xpathObj = libxml2.xmlXPathEvalExpression((xmlChar *)[query cStringUsingEncoding:NSUTF8StringEncoding], xpathCtx)
  }
}

func xpath(data:Data) {
  let dom = DOM()
  dom.setData(data:data)
}