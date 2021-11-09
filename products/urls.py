from django.urls import path
from products.views import ProductGroupView

urlpatterns=[
    path('/product/<int:id>', ProductGroupView.as_view())
]