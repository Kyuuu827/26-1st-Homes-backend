from django.urls import path

from products.views import MenuListView, ProductGroupsView

urlpatterns = [
	path('/menus', MenuListView.as_view()), 
    path('/products', ProductGroupsView.as_view()),
]