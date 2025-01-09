import SwiftUI

struct SeriesView: View {
    @StateObject private var vm: SeriesViewModel = SeriesViewModel()
    @EnvironmentObject private var userViewModel: UserViewModel

    let id: Int
    
    var body: some View {
        VStack {
            if vm.isLoading {
                LoadingScreenView(text: "Series is loading...")
            } else if let series = vm.series {
                ScrollView {
                    if let trailer = series.trailerURL {
                        YouTubePlayerView(videoURL: trailer)
                            .frame(height: 250)
                    } else {
                        AsyncImage(url: URL(string: series.posterURL)) { image in
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
                        Text(series.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        FavoritesButtonView(apiId: id, userViewModel: userViewModel)
                            .frame(height: 40)
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
                            Text("\(series.year) |")
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
                            
                            Text((series.imdbRating), format: .number.precision(.fractionLength(1)))
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

                    if series.seasons.count > 0 {
                        ZStack() {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(white: 0.3))
                            .stroke(.black, lineWidth: 1)
                            HStack {
                                Text("Season")
                                
                                Spacer()
                                
                                Picker("Seasons", selection: $vm.selectedSeason) {
                                    ForEach(series.seasons) { season in
                                        Text(season.title)
                                            .scaledToFill()
                                            .tag(season)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .accentColor(Color(white: 0.85))
                            }
                            .padding(.horizontal)
                        }
                        .padding(.horizontal)

                        if let selectedSeason = vm.selectedSeason {
                            if selectedSeason.episodes.isEmpty {
                                Text("No streaming options available")
                                    .multilineTextAlignment(.leading)
                                    .padding()
                            }
                            ForEach(selectedSeason.episodes) { episode in
                                EpisodeView(episode: episode)
                                    .padding(.vertical)
                                    .listRowSeparatorTint(Constants.fgColor)
                                Divider()
                                    .background(.white)
                            }
                        }
                    } else {
                        Text("No seasons available")
                            .padding()
                    }
                }
            } else {
                NoInternetView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .foregroundStyle(Constants.fgColor)
        .background(Constants.bgColor)
        .onAppear {
            vm.fetchSeries(id: id)
        }
    }
    
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(id: 1040)
            .environmentObject(AppSettings())
            .environmentObject(UserViewModelPreview() as UserViewModel)
    }
}
