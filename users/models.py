from django.db import models

from core.models import Timestamp
# Create your models here.
class User(Timestamp):
    email        = models.CharField(max_length=100, unique=True)
    user_name    = models.CharField(max_length=100, null=True)
    password     = models.CharField(max_length=200)
    phone_number = models.CharField(max_length=50, null=True)
    nickname     = models.CharField(max_length=100, null=True)

    class Meta:
        db_table = 'users'

class Address(Timestamp):
    user    = models.ForeignKey("User", on_delete=models.CASCADE)
    address = models.CharField(max_length=100)

    class Meta:
        db_table = 'addresses'