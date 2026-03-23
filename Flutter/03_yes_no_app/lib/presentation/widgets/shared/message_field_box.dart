import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode(); // Para mantener el foco en la caja de texto.

    // Obtiene el color scheme del tema actual.
    // final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"', // Mensaje que aparece en la caja de texto.
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.send_outlined),
        // Se ejecuta cuando se presiona el botón de enviar.
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode, // Para mantener el foco en la caja de texto.
      controller: textController, // Para obtener el valor de la caja de texto.
      decoration: inputDecoration, // Para obtener el valor de la caja de texto.
      // Se ejecuta cuando se presiona enter.
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
      // Se ejecuta cuando cambia el valor de la caja de texto.
      // onChanged: (value) {
      //   print('typing value: $value');
      // },
    );
  }
}
