from django.db import models
from django.db.models.fields import IntegerField

from core.models     import Timestamp
from users.models    import User, Address
from products.models import Product
# Create your models here.
class Order(Timestamp):
    user         = models.ForeignKey(User, on_delete=models.CASCADE)
    address      = models.ForeignKey(Address, on_delete=models.CASCADE)
    order_status = models.ForeignKey("Order_status", on_delete=models.CASCADE)

    class Meta:
        db_table = 'orders'

class Order_item(Timestamp):
    order        = models.ForeignKey("Order", on_delete=models.CASCADE)
    product      = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity     = models.IntegerField(default=0)
    items_status = models.CharField(max_length=30)

    class Meta:
        db_table = 'order_items'

class Order_status(Timestamp):
    order_status_description = models.CharField(max_length=50)
    
    class Meta:
        db_table = 'order_statuses'

class Shipment(Timestamp):
    order_items              = models.ForeignKey("Order_item", on_delete=models.CASCADE)
    shipment_tracking_number = models.IntegerField(default=0)
    shipment_date            = models.DateField(auto_now=True)

    class Meta:
        db_table = 'shipments'