import 'package:newwz/models/categoryModel.dart';

//CategoryModel _categoryModel = new CategoryModel();
//Map<int, CategoryModel> categories =
//{
//  1:       ('Business',
//    CategoryModel().imageUrl =
//        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.thestatesman.com%2Fbusiness%2Fphysics-and-business-the-science-of-the-start-1502745782.html&psig=AOvVaw2UBU2kRwWgoWTg_Y0dda-Z&ust=1598344463712000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNix0KO3s-sCFQAAAAAdAAAAABAD'
//)
//};
List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  //1
  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl =
      'https://www.thestatesman.com/wp-content/uploads/2019/04/Physics-and-business.jpg';
  category.add(categoryModel);
  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl =
      'https://image.shutterstock.com/image-photo/grand-sports-collage-soccer-basketball-260nw-1071589835.jpg';
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS3eP9k2bW-d3xGmfI8kUq8Yayd7X1NqKsDmw&usqp=CAU';
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSV5xCKSzevuoBVfPZgpkrZXmqnqEF0mqinKw&usqp=CAU';
  category.add(categoryModel);

  //5
//  categoryModel = new CategoryModel();
//  categoryModel.categoryName = 'General';
//  categoryModel.imageUrl = '';
//  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSnTvKsmX9y0jBzCU8IMzzTL5FuPos62QjkQA&usqp=CAU';
  category.add(categoryModel);

  //7
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ14zyyMnG2Yiief_OBussnlhDlbC6cVsmqJg&usqp=CAU';
  category.add(categoryModel);

  return category;
}
