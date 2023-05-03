//
//  AnyTransition.swift
//  CustomViewModifiers
//
//  Created by Venkata harsha Balla on 5/2/23.
//

import SwiftUI

struct AnyTransitions: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            // lets show the rectangle only if it true here
            if showRectangle  {
                // to add transition, we just have to see the transition here
                // transition also has any transitions so u can customise it here
                RoundedRectangle(cornerRadius: 40.0).frame(width: 50, height: 70, alignment: .center).frame(maxWidth: .infinity, maxHeight: .infinity).transition(AnyTransition.asymmetric(insertion: .rotating, removal: .assymetricRotation()))
                    //.transition(.rotating)
                    //.transition(AnyTransition.scale.animation(.easeIn))
                   // .transition(.move(edge: .trailing))
                // we can also do transition like any transition
                // we can also do assymetriuc transitions where we can have 1 transition on start and other on end
            }
            Spacer()
            // then we add a text click here
            Text("Custom Transition Click here").padding(.horizontal).onTapGesture {
                withAnimation(.easeInOut) {
                    showRectangle.toggle()
                }
            }
        }
    }
}

struct AnyTransition_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitions()
    }
}


// we can also customise the transition as they are just views

struct CustomTransitions : ViewModifier {
    
    // to make this even better, lets just add a property here
    
    var rotation: Double = 10.0
    
    func body(content: Content) -> some View {
        content.rotationEffect(Angle(degrees: rotation)).offset(x: rotation != 20 ? 15.0 : 30.0, y: rotation > 4 ? 40.0 : 80.2)
    }
}


// we can also write extesnions of any transitions

extension AnyTransition {
    
    // in this property active rotation is the state where we have the click action tapped and the identity is the state after the view transition finishes
    static var rotating: AnyTransition {
        return AnyTransition.modifier(active: CustomTransitions(rotation: 40.0), identity: CustomTransitions(rotation: 50.0))
    }
    
    static func assymetricRotation() -> AnyTransition {
        return AnyTransition.modifier(active: CustomTransitions(rotation: 140.0), identity: CustomTransitions(rotation: 140.0))
    }
}
