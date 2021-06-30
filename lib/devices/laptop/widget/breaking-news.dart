// import 'package:actu_complet/devices/laptop/widget/show-article-dialog-laptop.dart';
import 'package:actu/models/article-model.dart';
import 'package:flutter/material.dart';

breakingNew(BuildContext context, Size size, Article article) =>
    GestureDetector(
      onTap: () {
        // showDialogArtile(article: article, context: context);
      },
      child: Container(
        width: size.width,
        child: Row(
          children: [
            Spacer(),
            Container(
              // width: size.width * .2,
              child: Text(
                article.tag,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              width: size.width * .6,
              child: Text(
                '${article.titre}',
                // maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300
                    // letterSpacing: 3,
                    ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
