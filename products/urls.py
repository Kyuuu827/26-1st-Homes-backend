from django.urls import path
from products.views import ProductGroupView

urlpatterns=[
    path('/product', ProductGroupView.as_view())
]