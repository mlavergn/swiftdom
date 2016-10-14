import Foundation
import libxml2

//
// XPath requires a C bridge from Swift but is available on all platforms
//

func xpath(data:Data) {
  data.withUnsafeBytes {(bytes: UnsafePointer<CChar>)->Void in  
    let doc = libxml2.htmlReadMemory(bytes, Int32(data.count), "", nil, Int32(HTML_PARSE_NOWARNING.rawValue | HTML_PARSE_NOERROR.rawValue))
    print(doc)
  }    
}

