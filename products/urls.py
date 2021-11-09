from django.urls import path

from products.views import MenuListView, ProductGroupsView, ProductGroupView

urlpatterns = [
	path('/menus', MenuListView.as_view()), 
    path('/products', ProductGroupsView.as_view()),
    path('/product/<int:id>', ProductGroupView.as_view()),
]