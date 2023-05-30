//
//  ContentView.swift
//  did-you-just-fall Watch App
//
//  Created by Tweizh on 2023/5/30.
//

import SwiftUI
import SlideButton

struct ContentView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let styling = SlideButton.Styling(
        indicatorSize: 50,
        indicatorSpacing: 5,
        indicatorColor: .red,
        backgroundColor: .accentColor.opacity(0.3),
        textColor: .red,
        indicatorSystemName: "phone.fill",
        indicatorDisabledSystemName: "xmark",
        textAlignment: .center,
        textFadesOpacity: true,
        textHiddenBehindIndicator: true,
        textShimmers: false
    )
    
    var body: some View {
        VStack {
            Text("您似乎摔死了。")
                .font(.headline)
            SlideButton("立即聯絡火葬場", styling: styling, callback: sliderCallback)
                .font(.headline)
                .padding()
            Button("亂講，我沒死") {
                dismiss()
            }
            .background(.green)
            .foregroundColor(.black)
            .font(.headline)
            .cornerRadius(30)
            .frame(width: 180)
        }
        .frame(width: 200)
    }
}

private func sliderCallback() async {
    if #available(watchOS 9.0, *) {
        try? await Task.sleep(for: .seconds(2))
    } else {
        // Fallback on earlier versions
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
