//
//  TryGesture.swift
//  FlashZilla
//
//  Created by Weerawut Chaiyasomboon on 18/11/2567 BE.
//

import SwiftUI

struct TryGesture: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onLongPressGesture(minimumDuration: 1) {
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                print("In progress: \(inProgress)!")
            }
    }
}

#Preview {
    //    TryGesture()
//    CombinedGestureView()
//    RotationGestureView()
//    MagnifyGestureView()
//    DisableUserInteractionView()
    ContentShapeView()
}

struct CombinedGestureView: View {
    // how far the circle has been dragged
    @State private var offset = CGSize.zero
    
    // whether it is currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        // a long press gesture that enables isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        // a combined gesture that forces the user to long press then drag
        let combined = pressGesture.sequenced(before: dragGesture)
        
        // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

struct RotationGestureView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        Text("Hello, World!")
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        currentAmount = value.rotation
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = .zero
                    }
            )
    }
}

struct MagnifyGestureView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0

    var body: some View {
        Text("Hello, World!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

struct DisableUserInteractionView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }

            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped!")
                }
                .allowsHitTesting(false)
        }
    }
}

struct ContentShapeView: View {
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(.rect)
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}
