from django.db import models
from django.db.models.fields import IntegerField

from core.models     import Timestamp
from users.models    import User
from products.models import Product
# Create your models here.
class Cart(Timestamp):
    user       = models.ForeignKey(User, on_delete=models.CASCADE)
    product    = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity   = models.IntegerField(default=0)

    class Meta:
        db_table = 'carts'