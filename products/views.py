import json

from django.http.response import JsonResponse
from django.views         import View
from django.db.models     import Q, Avg, Count

from products.models      import *

class CategoryView(View):
    def get(self, request):
        category_data = [{
            'menu_id'   : menu.id,
            'menu_name' : menu.name,
            'image_url' : menu.image_url,
            'category'  : [{
                'category_id'   : category.id,
                'category_name' : category.name,
                'subcategory'   : [{
                    'subcategory_id'   : subcategory.id,
                    'subcategory_name' : subcategory.name,
                } for subcategory in category.subcategory_set.all()],
            } for category in menu.category_set.all()],
        } for menu in Menu.objects.all()]

        return JsonResponse({'category':category_data}, status = 200)


class ProductListView(View):
    def get(self, request):
        type = request.GET.get("type")
        sort = request.GET.get("sort")

        q = Q()

        if type:
            q.add(Q(sub_category_id=type), q.AND)

        products = ProductGroup.objects.filter(q)

        if sort == 'best_ranking':
            products = products.annotate(star_ranking=Avg('review__star_rate')).order_by('-star_ranking')[0:10]

        if sort == 'ranking':
            products = products.annotate(star_ranking=Avg('review__star_rate')).order_by('-star_ranking')

        if sort == 'new':
            products = products.order_by('created_at')

        if sort == 'low_price':
            products = products.order_by('displayed_price')
        
        if sort == 'high_price':
            products = products.order_by('-displayed_price')

        if sort == 'review':
            products = products.annotate(review_count=Count('review')).order_by('-review_count')
        
        results = [
            {
            'id'               : product.id,
            'price'            : product.displayed_price,
            'discount_rate'    : product.discount_price,
            'discounted_price' : float(product.displayed_price) * (float(product.discount_price)*0.01),
            }for product in products]

        return JsonResponse({'products':results}, status = 200)