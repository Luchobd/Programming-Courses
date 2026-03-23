import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_asnswer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola amor!!!', fromWho: FromWho.me),
    Message(text: 'Ya llegaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return; // Si el texto está vacío, no se envía el mensaje.

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReplay();
    }

    notifyListeners(); // Notifica a los widgets que están escuchando el provider que ha habido un cambio.
    moveScrollToBottom(); // Mueve el scroll a la parte inferior de la lista.
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    
    moveScrollToBottom();
  }

  // Método para mover el scroll a la parte inferior de la lista.
  void moveScrollToBottom() async {
    await Future.delayed(
      Duration(milliseconds: 100),
    ); // Espera 100 mili-segundos para que el mensaje se agregue a la lista.

    chatScrollController.animateTo(
      chatScrollController
          .position
          .maxScrollExtent, // Posición máxima del scroll.
      duration: Duration(milliseconds: 300), // Duración de la animación.
      curve: Curves.easeOut, // Curva de animación suave.
    );
  }
}
