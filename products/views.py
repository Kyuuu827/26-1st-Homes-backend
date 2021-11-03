import json

from django.shortcuts import render
from django.http.response import JsonResponse
from django.views import View

from products.models import *

# Create your views here.
# class MenuView(View):
#     def get(self, request):
#         try:
#             data = json.loads(request.body)
#             menu_name = data['name']
#             image_url = data['image_url']



# class CategoryView(View):

