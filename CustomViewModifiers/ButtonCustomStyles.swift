//
//  ButtonCustomStyles.swift
//  CustomViewModifiers
//
//  Created by Venkata harsha Balla on 4/30/23.
//

import SwiftUI

struct ButtonCustomStyles: View {
    // thesee buttons in swift ui by default has higlights in it, so we need to make them custom
    // we also have the default button styles build into swift ui
    var body: some View {
        Button {
            // some action here
        } label: {
            Text("Custom Button").font(.headline).frame(height: 50).opacity(0.4)
        }.padding(40).buttonStyle(CustomButtonModifier())

    }
}

struct ButtonCustomStyles_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCustomStyles()
    }
}


// now lets creqate a custom button style where we return some view here

struct CustomButtonModifier: ButtonStyle {
    
    // we can also pass in a property that we want to customise according ot the view
    
    var buttonForegrounsColor : Color
    
    
    // the same can be done if you want to initialise it and give it a default value
    
    init(buttonForegroundColor: Color = .pink) {
        self.buttonForegrounsColor = buttonForegroundColor
    }
  
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.foregroundColor(Color.blue).brightness(configuration.isPressed ? 0.8 : 1.0).scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}


extension View {
    // we can also add initializer here as well
    func getButtonStyle() -> some View {
        buttonStyle(CustomButtonModifier())
    }
}
