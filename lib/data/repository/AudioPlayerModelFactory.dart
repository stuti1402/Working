import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_meditation/model/AudioPlayerModel.dart';

class AudioPlayerModelFactory {
  static List<AudioPlayerModel> getAudioPlayerModels() {
    return [
      /*AudioPlayerModel(
          id: "1",
          isPlaying: false,
          audio: Audio("assets/audio/meditation_piano.mp3",
              metas: Metas(
                id: "1",
                title: "Forest Birds",
                artist: "Joe Doe",
                album: "Country Album",
                image: MetasImage.asset("assets/country.jpg"),
              ))),*/
      AudioPlayerModel(
          id: "2",
          isPlaying: false,
          audio: Audio.network(
              "https://drive.google.com/uc?export=view&id=1998EymDn7Yup0sun2Fm0Ed6GdEhQCgrS",
              metas: Metas(
                id: "2",
                title: "Creative Minds",
                artist: "Venino",
                album: "Country Album",
                image: MetasImage.network(
                    "https://www.bensound.com/bensound-img/creativeminds.jpg"),
              ))),
      AudioPlayerModel(
          id: "3",
          isPlaying: false,
          audio: Audio.network(
              "https://drive.google.com/uc?export=view&id=1G2MPHYspQlhDWt_vXasy_ufHWO2rGCuV",
              metas: Metas(
                id: "3",
                title: "Ukulele",
                artist: "Benjamin Tissot",
                album: "Feel Good",
                image: MetasImage.network(
                    'https://www.bensound.com/bensound-img/ukulele.jpg'),
              ))),
      AudioPlayerModel(
          id: "4",
          isPlaying: false,
          audio: Audio.network(
              "https://drive.google.com/uc?export=view&id=1oF07Gr-h1Hr3Ef1mhWK9Txt4fAmZZ0RL",
              metas: Metas(
                id: "4",
                title: "A New Beginning",
                artist: "Olga Zakharova",
                album: "Country Album",
                image: MetasImage.network(
                    "https://www.bensound.com/bensound-img/anewbeginning.jpg"),
              ))),
      AudioPlayerModel(
          id: "5",
          isPlaying: false,
          audio: Audio.network(
              "https://drive.google.com/uc?export=view&id=10CNGHvzdVMl9whB7txD9kEoBHItkk--d",
              metas: Metas(
                id: "5",
                title: "Little Idea",
                artist: "Dooder",
                album: "Country Album",
                image: MetasImage.network(
                    "https://www.bensound.com/bensound-img/littleidea.jpg"),
              ))),
      AudioPlayerModel(
          id: "6",
          isPlaying: false,
          audio: Audio.network(
              "https://drive.google.com/uc?export=view&id=14MrxKE6zaK6py-riEnhsNTogX5v0czZ9",
              metas: Metas(
                id: "6",
                title: "Memories",
                artist: "Galyna Andrushko",
                album: "Country Album",
                image: MetasImage.network(
                    "https://www.bensound.com/bensound-img/memories.jpg"),
              ))),
      AudioPlayerModel(
          id: "7",
          isPlaying: false,
          audio: Audio.network(
              "https://drive.google.com/uc?export=view&id=1YZChlIrJolCrcUutjaWafCZHr02FVTIA",
              metas: Metas(
                id: "7",
                title: "Going Higher",
                artist: "Radoman Durkovic",
                album: "Country Album",
                image: MetasImage.network(
                    "https://www.bensound.com/bensound-img/goinghigher.jpg"),
              ))),
      AudioPlayerModel(
          id: "8",
          isPlaying: false,
          audio: Audio("",
              metas: Metas(
                id: "8",
                title: "My Other Country Song",
                artist: "Joe Doe",
                album: "Country Album",
                image: MetasImage.asset(""),
              ))),
    ];
  }
}
