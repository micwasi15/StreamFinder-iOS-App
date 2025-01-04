import SwiftUI

struct LoadingScreenView: View {
    @State var text: String?
    
    @State private var rotation1: Double = 0
    @State private var rotation2: Double = 0
    
    @State private var trapezoidOpacity: Double = 1.0

    var body: some View {
        VStack {
            ZStack {
                GeometryReader { geometry in
                    Trapezoid()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.yellow, .clear]),
                            startPoint: .trailing,
                            endPoint: .leading
                        ))
                        .opacity(trapezoidOpacity)
                        .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.09)
                        .position(x: -20, y: 430)
                }
                
                if let img = Image.fromFolder(named: "projector") {
                    img
                        .resizable()
                        .scaledToFit()
                        .position(x: 100, y: 385)
                    
                }
                
                HStack {
                    if let img = Image.fromFolder(named: "tape") {
                        img
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75)
                            .rotationEffect(.degrees(rotation1))
                            .position(x: 75, y: 335)
                    }
                    
                    if let img = Image.fromFolder(named: "tape") {
                        img
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75)
                            .rotationEffect(.degrees(rotation2))
                            .position(x: 50, y: 335)
                    }
                }
            }
            .frame(width: 200)
            .padding(.bottom, 0)
            //.background(Constants.bgColor)
            .onAppear {
                withAnimation(
                    Animation.linear(duration: 10).repeatForever(autoreverses: false)
                ) {
                    rotation1 += 360
                    rotation2 += 360
                }
                
                withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    trapezoidOpacity = 0.5
                }
            }
            
            if let text = text {
                Text(text)
                    .lineLimit(1, reservesSpace: true)
                    .padding(.bottom, 250)
                    .font(.title2)
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
