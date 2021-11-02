from django.db import models

from core.models     import Timestamp
from users.models    import User

# Create your models here.
class Menu(Timestamp):
    menu_name   = models.CharField(max_length=100)
    menu_image  = models.CharField(max_length=100)
    
    class Meta:
        db_table = 'menus'

class Category(Timestamp):
    category_name = models.CharField(max_length=100)
    menu          = models.ForeignKey('Menu', on_delete=models.CASCADE)

    class Meta:
        db_table = 'categories'

class Sub_category(Timestamp):
    sub_category_name = models.CharField(max_length=100)
    category          = models.ForeignKey('Category', on_delete=models.CASCADE)

    class Meta:
        db_table = 'sub_categories'

class Product_group(Timestamp):
    group_name      = models.CharField(max_length=50)
    displayed_price = models.DecimalField(max_digits=10, decimal_places=3)
    discount_price  = models.DecimalField(max_digits=5, decimal_places=3)
    sub_category    = models.ForeignKey('Sub_category', on_delete=models.CASCADE)

    class Meta:
        db_table = 'product_groups'

class Product(Timestamp):
    company          = models.CharField(max_length=50)
    name_size        = models.CharField(max_length=50)
    price            = models.DecimalField(max_digits=10, decimal_places=3)
    product_group    = models.ForeignKey('Product_group', on_delete=models.CASCADE)

    class Meta:
        db_table = 'products'

class Product_image(Timestamp):
    product_image    = models.CharField(max_length=200)
    product_group    = models.ForeignKey('Product_group', on_delete=models.CASCADE)

    class Meta:
        db_table = 'product_images'

class Color(Timestamp):
    color_name = models.CharField(max_length=50)
    product    = models.ForeignKey('Product', on_delete=models.CASCADE)

    class Meta:
        db_table = 'colors'

class Review(Timestamp):
    user           = models.ForeignKey(User, on_delete=models.CASCADE)
    content        = models.CharField(max_length=500)
    star_rate      = models.DecimalField(max_digits=3, decimal_places=2)
    product_group  = models.ForeignKey('Product_group', on_delete=models.CASCADE)

    class Meta:
        db_table = 'reviews'

class Review_image(Timestamp):
    review_image = models.CharField(max_length=200)
    review       = models.ForeignKey("Review", on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'review_images'

class Delivery(Timestamp):
    delivery_type = models.CharField(max_length=50)
    payment_type  = models.CharField(max_length=50)
    delivery_fee  = models.DecimalField(max_digits=10, decimal_places=3)
    product_group = models.ForeignKey("Product_group", on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'deliveries'

















