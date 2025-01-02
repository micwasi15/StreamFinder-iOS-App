import SwiftUI

struct SimpleButtonView: View {
    let text: String
    let bgColor: Color
    let fgColor: Color = Constants.fgColor
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(fgColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .cornerRadius(8.0)
            .padding(.horizontal, 20)
    }
}
