import SwiftUI

struct FilmView: View {
    let vm: FilmViewModel
    
    var body: some View {
        VStack {
            YoutubePlayer(path: vm.film.trailer)
                .frame(height: 300)

            VStack(alignment: .center, spacing: 10) { 
                HStack(alignment: .center) {
                // Space Between
                Text(vm.film.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                // Alternative Views and Spacers
                View()
                }
                .padding(.leading, 0)
                .padding(.trailing, 5)
                .padding(.top, 0)
                .padding(.bottom, 3)
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay(
                Rectangle()
                    .inset(by: 0.17)
                    .stroke(Constants.MiscellaneousFloatingTabPillFill, lineWidth: 0.33333)
                )

                HStack(alignment: .center, spacing: 5) { 
                    Text("\(vm.film.year) |")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Image.fromIconsFolder(named: "imdb")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20, alignment: .center)

                    Text("\(vm.film.imdbRating)")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 0)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 0)
            .frame(alignment: .top)

            StreamingOptionsView(vm: StreamingOptionsViewModel(streamingOptions: vm.film.streamingOptions))
                .padding(.horizontal, 18)
                .padding(.vertical, 0)
                .frame(alignment: .top)

            ScrollView {
                Text(vm.film.description)
                    .font(.body)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .navigationTitle(film.title)
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(film: MockData.films[0])
    }
}
