from django.urls import path
from carts.views import CartListView

urlpatterns=[
    path('', CartListView.as_view()),
    path('/delete/<int:id>', CartListView.as_view()),
    path('/patch/<int:id>', CartListView.as_view()),
]