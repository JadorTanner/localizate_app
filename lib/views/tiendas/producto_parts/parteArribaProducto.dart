import 'package:flutter/material.dart';
import 'package:localizate/utils/capitalize.dart';

Padding parteArribaProducto(BuildContext context, producto) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Codigo de producto', style: TextStyle(color: Colors.white)),
        Text(capitalize(producto['name'], all: true),
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "Precio\n"),
              TextSpan(
                  text: "\$${producto['price']}",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ])),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            Expanded(
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      producto['img'],
                      fit: BoxFit.fill,
                    )))
          ],
        )
      ],
    ),
  );
}
