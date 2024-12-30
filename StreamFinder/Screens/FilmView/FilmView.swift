import SwiftUI

struct FilmView: View {
    @StateObject
    private var vm: FilmViewModel = FilmViewModel()

    let id: Int
    
    var body: some View {
        VStack {
            if vm.isLoading {
                ProgressView("Loading film...")
            } else if let film = vm.film {
                if let trailer = film.trailerURL {
                    YoutubePlayer(path: trailer)
                } else {
                    AsyncImage(url: URL(string: film.posterURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8.0)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                    }
                }

                VStack(alignment: .center, spacing: 10) { 
                    HStack(alignment: .center) {
                    // Space Between
                    Text(film.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    // Alternative Views and Spacers
                    //View()
                    }
                    .padding(.leading, 0)
                    .padding(.trailing, 5)
                    .padding(.top, 0)
                    .padding(.bottom, 3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                    HStack(alignment: .center, spacing: 5) { 
                        Text("\(film.year) |")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                            .frame(alignment: .leading)
                        
                        if let img = Image.fromIconsFolder(named: "imdb") {
                            img
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20, alignment: .leading)
                        }
                        
                        //format 1 place
                        Text("\(film.imdbRating)")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 0)
                .frame(alignment: .top)

                StreamingOptionsView(vm: StreamingOptionsViewModel())
                    .padding(.horizontal, 18)
                    .padding(.vertical, 0)
                    .frame(alignment: .top)

                ScrollView {
                    Text(film.description)
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(.horizontal, 18)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .onAppear {
            vm.getFilm(id: id)
        }
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(id: 100)
    }
}
