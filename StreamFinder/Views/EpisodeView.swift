import SwiftUI 

struct EpisodeView: View {
    let episode: Episode

    var body: some View {
        Text(episode.title)
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            .padding(.horizontal, 18)
            .padding(.top, 0)
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, alignment: .leading)

        StreamingOptionsView(vm: StreamingOptionsViewModel(streamingOptions: episode.streamingOptions, appSettings: appSettings))
            .padding(.horizontal, 18)
            .padding(.vertical, 0)
            .frame(alignment: .top)

        Text(episode.description)
            .font(.body)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
            .padding(.horizontal, 18)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(episode: MockData.episodes[0])
        .foregroundStyle(Constants.fgColor)
        .background(Constants.bgColor)
    }
}