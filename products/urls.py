from django.urls import path

from products.views import MenuListView, ProductGroupView

urlpatterns = [
	path('/menus', MenuListView.as_view()), 
    path('/products', ProductGroupView.as_view()),
]