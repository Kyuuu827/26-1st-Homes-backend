from django.urls import path

from orders.views import OrderItemView

urlpatterns = [
	path('', OrderItemView.as_view()),
	path('/patch/<int:id>', OrderItemView.as_view()),
	path('/delete/<int:id>', OrderItemView.as_view()), 
]