import SwiftUI

struct RotatingImagesView: View {
    // Przechowujemy kąt obrotu dla obu obrazków
    @State private var rotation1: Double = 0
    @State private var rotation2: Double = 0

    var body: some View {
        ZStack {
            // Tło
            if let img = Image.fromIconsFolder(named: "projector") {
                img
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }

            VStack {
                if let img = Image.fromIconsFolder(named: "tape") {
                    img
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .position(x: 150, y: 200)
                }

                if let img = Image.fromIconsFolder(named: "tape") {
                    img
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .position(x: 300, y: 400)
                }
                // Obrazek 1 obracający się
                // Image("image1") // Zastąp "image1" swoim obrazkiem
                //     .resizable()
                //     .scaledToFit()
                //     .frame(width: 100, height: 100)
                //     .rotationEffect(.degrees(rotation1)) // Rotacja dla pierwszego obrazka
                //     .position(x: 150, y: 200) // Pozycja pierwszego obrazka na ekranie

                // // Obrazek 2 obracający się
                // Image("image2") // Zastąp "image2" swoim obrazkiem
                //     .resizable()
                //     .scaledToFit()
                //     .frame(width: 100, height: 100)
                //     .rotationEffect(.degrees(rotation2)) // Rotacja dla drugiego obrazka
                //     .position(x: 300, y: 400) // Pozycja drugiego obrazka na ekranie
            }
        }
        .onAppear {
            // Animacja, która obraca oba obrazki
            withAnimation(
                Animation.linear(duration: 5).repeatForever(autoreverses: false)
            ) {
                rotation1 += 150
                rotation2 += 150
            }
        }
    }
}

struct RotatingImagesView_Previews: PreviewProvider {
    static var previews: some View {
        RotatingImagesView()
    }
}
