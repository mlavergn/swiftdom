//: Playground - noun: a place where people can play

import Foundation
//import XDDom

let contents = try! String(contentsOf:URL(string:"https://www.google.com")!)
var dom :XDDOM = XDDOM()
dom.setContents(html:contents)

print(dom.find(tag:"link", attributes:nil))
