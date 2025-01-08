import SwiftUI

struct LoadingScreenView: View {
    @State var text: String?
    
    @State private var rotation1: Double = 0
    @State private var rotation2: Double = 0
    
    @State private var trapezoidOpacity: Double = 1.0
    
    let imageColor: Color = Color(white: 0.7)

    var body: some View {
        VStack {
            ZStack {
                Trapezoid()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.yellow, .clear]),
                            startPoint: .trailing,
                            endPoint: .leading
                        )
                    )
                    .opacity(trapezoidOpacity)
                    .frame(width: 80, height: 50)
                    .offset(x: -110, y: 36)
                
                if let img = Image.fromFolder(named: "projector") {
                    img
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .colorMultiply(imageColor)
                }
                
                HStack(spacing: 10) {
                    if let img = Image.fromFolder(named: "tape") {
                        img
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                            .rotationEffect(.degrees(rotation1))
                            .colorMultiply(imageColor)
                            .offset(x: 15)
                    }
                    
                    if let img = Image.fromFolder(named: "tape") {
                        img
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                            .rotationEffect(.degrees(rotation2))
                            .colorMultiply(imageColor)
                            .offset(x: 10)
                    }
                }
                .offset(y: -40)
            }
            
            if let text = text {
                Text(text)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Constants.bgColor)
        .foregroundStyle(Constants.fgColor)
        .onAppear {
            withAnimation(
                Animation.linear(duration: 10).repeatForever(autoreverses: false)
            ) {
                rotation1 += 360
                rotation2 += 360
            }
            
            withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                trapezoidOpacity = 0.3
            }
        }
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let inset: CGFloat = rect.width * 0.2

        path.move(to: CGPoint(x: rect.minX, y: rect.minY - inset))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - inset))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}

struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView(text: "Preview is loading")
    }
}
