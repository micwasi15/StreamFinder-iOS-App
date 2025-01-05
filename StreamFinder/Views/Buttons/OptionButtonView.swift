import SwiftUI

struct OptionButtonView: View {
    let title: String
    let systemImage: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .font(.title2)
            Text(title)
                .font(.headline)
            Spacer()
        }
        .frame(maxHeight: 25)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Constants.secBgColor)
        )
        .shadow(radius: 1)
    }
}

struct OptionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OptionButtonView(title: "Change preffered country", systemImage: "globe")
    }
}