//
//  ViewModifierReusable.swift
//  CustomViewModifiers
//
//  Created by Venkata harsha Balla on 4/29/23.
//

import SwiftUI

struct ViewModifierReusable: View {
    var body: some View {
        VStack {
            // all we need to do is add it as a modifier and then the custom class to reuse it anywhere
            Text("view modifier stack text").modifier(DefaultTextModifier(fontAssigned: .callout, backGroundColor: .red))
            //  you can also use the extension function to access the attributes
            
            // also something to keep in mind is that we can also just use the properties that we want that are different and implement them
            
            // for instance like the clipped - same as adding corner radius
            Text("second text with view extension").giveDefaultTextAttributes().cornerRadius(10.0)
        }
    }
}

struct ViewModifierReusable_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierReusable()
    }
}


// now we can have a custom modifier here so we can reuse them everywhere

struct DefaultTextModifier: ViewModifier {
    
    // an interesting way to solve the custom property allocation is to use a propert injection
    
    // the properties also overe ride so we can inject them or use just the default
    
    var fontAssigned : Font? = .headline
    
    var backGroundColor : Color? = Color.brown
    
    
    // this always needs to return some vview
    // we can pretty much make this for any UI element and then reuse it anywhere
    
    func body(content: Content) -> some View {
        content.font(fontAssigned).foregroundColor(Color.red).background(backGroundColor).padding()
    }
}



extension View {
    // we can also write an extension of the view so that we do not even have to write a modifier in the view
    
    // lets just return that view here
    
    func giveDefaultTextAttributes() -> some View {
        // the difference to swift and swift UI here is that u dont even need to write a return function here
        modifier(DefaultTextModifier())
    }
}
