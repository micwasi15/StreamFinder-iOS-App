import SwiftUI

struct FilmView: View {
    @StateObject
    private var vm: FilmViewModel = FilmViewModel()
    
    @EnvironmentObject
    private var appSettings: AppSettings

    let id: Int
    
    var body: some View {
        VStack {
            if vm.isLoading {
                LoadingScreenView(text: "Loading film...")
            } else if let film = vm.film {
                ScrollView {
                    if let trailer = film.trailerURL {
                        YouTubePlayerView(videoURL: trailer)
                            .frame(height: 250)
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

                    VStack(alignment: .center, spacing: 5.0) { 
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
                        
                        Divider()
                            .background(Constants.fgColor)
                            .padding(.bottom, 5.0)
                    
                        HStack(alignment: .center, spacing: 5) { 
                            Text("\(film.year) |")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .frame(alignment: .leading)
                            
                            if let img = Image.fromFolder(named: "imdb") {
                                img
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20, alignment: .leading)
                            }
                            
                            Text((film.imdbRating), format: .number.precision(.fractionLength(1)))
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

                    VStack {
                        StreamingOptionsView(vm: StreamingOptionsViewModel(streamingOptions: film.streamingOptions, appSettings: appSettings))
                            .padding(.vertical, 0)
                        
                        Text(film.description)
                            .font(.body)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 18)
                }
            } else {
                NoInternetView()
            }
        }
        .background(Constants.bgColor)
        .foregroundStyle(Constants.fgColor)
        .onAppear {
            vm.fetchFilm(id: id)
        }
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(id: 100)
            .environmentObject(AppSettings())
    }
}
