import 'package:exlpore_egypt/chatbotcubit/chatbot_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit() : super(InitState());

  static ChatBotCubit get(context) => BlocProvider.of(context);

  List<String> messages = [];
  void insertMessage(String message) {
    messages.add(message);
    controller.clear();
    if (messages.length > 3) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent * 2);
    }
    emit(InsertMessage());
  }

  ScrollController scrollController = ScrollController();

  TextEditingController controller = TextEditingController();

  Map<String, String> questions = {
    'what is the capital of egypt': 'cairo',
    'cairo': 'capital of egypt',
    'Hi| hi there': 'Hello, how can i help you?',
    'ok':'do you have any questions? ',
    'Hello| hello there': 'Hello, how can i help you?',
    'my name is': 'Hello , Pleasure to meet you',
    'Iam good': 'Okey ,How can i help you?',
    'Iam fine': 'Okey , How can i help you?',
    'how are you': 'Iam fine ,Thank you for asking?',
    'Iam fine , what about you': 'Iam fine , How can i help you?',
    "you are amazing": 'Thanks',
    "you are genius": 'Thanks',
    "you are helpful": 'Thanks',
    "you are great": 'Thanks',
    "you are useful": 'Thanks',
    "this is was useful": 'So happy that you are satisfied',
    "this is was helpful": 'So happy that you are satisfied',
    "thanks,this is was useful": 'So happy that you are satisfied',
    "thanks,this is was helpful": 'So happy that you are satisfied',
    "thanks": "you are welcome",
    'What is the official weekend in Egypt': 'official weekend in Egypt Thursday and Friday',
    'How can i know the weather': 'There is a weather feature in the app list ,It is called weather and it has a cloud ion beside it',
    'How can i know which famous places to visit in Egypt': 'There is a screen in this app tells you the most recommended places to visit while you are in Egypt ,It is name is Places',
    ' is beautiful': '  beautiful, Do you want me to tell you about other places with the same vibes?',
    ' is fun':
        'indeed fun, Do you want me to tell you about other places with the same vibes?',
    ' created you':
        'I was created by a Team of students in factully of Computer Science& Artificial Intelligence ,Benha University',
    'what is your name ?':
        'I do not have an actual name but i prefer to be called Kemet',
    'what does it mean kemet ?': 'It is ancient Egypt name',
    'I think iam lost':
        'It is okey do not panic , There is a GPS in the application,You can use it',
    'i want to go to (.*)': 'There is a GPS in the application,You can use it',
    'where is the pyramids':
        'The most famous Egyptian pyramids are those found at Giza, on the outskirts of Cairo, There is a GPS in the application,It will help you get there safely',
    'where is the pyramids located':
        'The most famous Egyptian pyramids are those found at Giza, on the outskirts of Cairo, There is a GPS in the application,It will help you get there safely',
    'how to go to the pyramids':
        'The most famous Egyptian pyramids are those found at Giza, on the outskirts of Cairo, There is a GPS in the application,It will help you get there safely',
    'i want to go to the pyramids':
        'The most famous Egyptian pyramids are those found at Giza, on the outskirts of Cairo, There is a GPS in the application,It will help you get there safely',
    '(.*) to the pyramids':
        'The most famous Egyptian pyramids are those found at Giza, on the outskirts of Cairo, There is a GPS in the application,It will help you get there safely',
    'where is the philae temple located':
        'The temple of Isis from Philae at its current location on Agilkia Island in Lake Nasser in Aswan ,There is a GPS in the application,It will help you get there safely',
    'where is the philae temple':
        'The temple of Isis from Philae at its current location on Agilkia Island in Lake Nasser in Aswan ,There is a GPS in the application,It will help you get there safely',
    'how to go to phila temple':
        'The temple of Isis from Philae at its current location on Agilkia Island in Lake Nasser in Aswan ,There is a GPS in the application,It will help you get there safely',
    '(.*) to phila temple':
        'The temple of Isis from Philae at its current location on Agilkia Island in Lake Nasser in Aswan ,There is a GPS in the application,It will help you get there safely',
    'Is Egypt safe to visit?':
        'Egypt is very safe to visit and the police, tourist police, and army are in prominence wherever you go, giving you a feel of being in secure surroundings. Egypt prides itself on its high safety record for tourists and will do all it can to maintain this.',
    'How do I get my tourist visa?':
        'Usually, you need to apply to your local Egyptian Embassy or Consulate General for a pre-entry tourist visa but if you are from North America, Western Europe, Australia/New Zealand, Brazil/Argentina or Hong Kong/Japan/Macau/Malaysia or Singapore you can get your tourist visa upon arrival in Egypt.',
    'Where do I get the bus in Luxor ?':
        'The bus station in Luxor is situated behind the Luxor Temple.',
    'How do I get to Abu Simbel?':
        'Abu Simbel can be reached by flight, which is the easiest and most convenient method taking about 4 hours for the round trip and visit, or there are 2 police controlled bus convoys that leave Aswan at 0400 and 1130 that take about 9 hours for the round trip and visit.',
    'Is it safe to drink the water in Egypt?':
        'Yes, but not advised! Egyptian water has a high chlorine level in it which can upset the microbes in your stomach, causing diarrhea. For drinking purposes it is far safer to stick with bottled water, ensuring the seal is intact before drinking it.',
    'What voltage does Egypt have, and what kind of plugs?':
        'Egypt has a voltage supply of 220V and the plugs are the 2 round pin type that is common throughout Europe (except the UK).',
    'What is the legal drinking age in Egypt?': 'The legal drinking age is 21',
    'Are there restrictions about bringing alcohol into the country?':
        'Yes, you are only allowed to bring in 2 liters with you.',
    'Economy economy':
        'Egypt has a mixed economy that relies heavily on tourism, agriculture, and natural gas exports. The country has faced economic challenges in recent years, including high unemployment rates and inflation. However, it continues to attract tourists from around the world who are drawn to its ancient history, beautiful beaches, and vibrant culture.',
    'Luxor luxor':
        'Located on the east bank of the Nile River, Luxor is home to some of Egypt\'s most impressive ancient ruins, including the Karnak and Luxor temples, and the Valley of the Kings, which is where many pharaohs were buried.',
    'Siwa Oasis siwa':
        'Located in the western part of Egypt near the Libyan border, the Siwa Oasis is a tranquil and remote destination that features natural hot springs, salt lakes, and palm groves. It is also home to the ancient Temple of the Oracle, which was dedicated to the god Amun.',
    'Dahab dahab':
        'Located on the Sinai Peninsula, Dahab is a popular destination for scuba diving and snorkeling enthusiasts. The area is known for its beautiful coral reefs and crystal-clear waters, and visitors can also enjoy camel rides and hikes in the nearby desert.',
    'Alexandria alex alexandria':
        'Founded by Alexander the Great in 331 BC, Alexandria is a coastal city that is rich in history and culture. Visitors can explore the Bibliotheca Alexandrina, which is a modern library built to replace the ancient Library of Alexandria, or wander through the city\'s colorful markets and bazaars.',
    'Aswan aswan':
        'Another city located along the Nile River, Aswan is famous for its stunning sunsets and picturesque scenery. Visitors can take a boat ride to see the nearby Philae Temple, or explore the Nubian villages located on the outskirts of the city.',
    'What is Giza giza ?':
        'Giza is the location of the Great Pyramids of Egypt.',
    'Who were the pharaohs of Ancient Egypt?':
        'The pharaohs were the rulers of Ancient Egypt who held absolute power over the kingdom.',
    'What is the significance of the Nile River to Egypt?':
        'The Nile River is the lifeblood of Egypt, providing water for irrigation, transportation, and daily use.',
    'What is the official language of Egypt?':
    'The currency of Egypt is the Egyptian pound.',
    'What is the currency of Egypt?':
        'The currency of Egypt is the Egyptian pound.',
  };

   List<String> removeWords=['what','I','am','when','in','i','is','it','we','want','about','you','how','ara','can'];
  void replyToMessage(String message) {
    if(message.isNotEmpty)
    {
      insertMessage(message);
      List<String> token1 = message.split(' ');
      List<String>token=[];
      int count1=0;
      for(String l in token1)
        {
          count1=0;
          for(String o in removeWords)
            {
              if(o==l)
                {
                  count1++;
                }
            }
          if(count1==0)
            {
              if(l!='')
              {
                token.add(l);
              }
            }
        }
      print(token);
      int count = 0;
      int max = 0;
      String an = "";
      for (String i in questions.keys)
      {
        count = 0;
        for (String j in i.split(' ')) {
          for (String k in token) {
            if (j == k) {
              count++;
            }
          }
        }
        if (max < count) {
          max = count;
          an = i;
        }
      }
      if (an.isEmpty) {
        insertMessage('how can i help you ? ');
      } else {
        insertMessage(questions[an]!);
      }
    }
  }
}
