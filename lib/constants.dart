import 'package:flutter/material.dart';

import 'core/utils/functions/hive_service.dart';

const kPrimaryColor = Color(0xff3E2723);
const kTranstionDuration = Duration(milliseconds: 250);
const kGtSectraFine = 'GT Sectra Fine';
const kFeaturedBox = 'featured_box';
const kNewestBox = 'newest_box';
const kSimilarBox = 'similar_box';
const kSearchedBox = 'searched_box';
var selectingBooks = myBox!.get("selectingBooks");
var mainBooks = myBox!.get("mainBooks");
