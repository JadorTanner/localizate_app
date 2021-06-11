import 'package:flutter/material.dart';

Padding parte_arriba_producto(BuildContext context, producto) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Codigo de producto', style: TextStyle(color: Colors.white)),
        Text(producto['name'],
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
              width: 50,
            ),
            Expanded(
                child: Image.asset(
              producto['img'],
              fit: BoxFit.fill,
            ))
          ],
        )
      ],
    ),
  );
}
