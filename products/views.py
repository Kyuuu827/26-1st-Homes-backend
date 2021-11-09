import json

from django.http.response import JsonResponse
from django.views         import View
from django.db.models     import Avg, Count, F

from products.models      import (
    Menu, Category, SubCategory, ProductGroup, Product, 
    Review, Color, ProductImage, ProductColor
)

class MenuListView(View):
    def get(self, request):
        menus = Menu.objects.prefetch_related('category_set', 'category_set__subcategory_set')

        menu_data = [{
            'menu_id'   : menu.id,
            'menu_name' : menu.name,
            'image_url' : menu.image_url,
            'categories'  : [{
                'id'   : category.id,
                'name' : category.name,
                'subcategories'   : [{
                    'id'   : subcategory.id,
                    'name' : subcategory.name,
                } for subcategory in category.subcategory_set.all()],
            } for category in menu.category_set.all()],
        } for menu in menus]

        return JsonResponse({'menus':menu_data}, status = 200)


class ProductGroupsView(View):
    def get(self, request):
        sub_category_id = request.GET.get("SubCategoryId")
        ordering        = request.GET.get("ordering")
        OFFSET          = int(request.GET.get("offset", 0))
        LIMIT           = int(request.GET.get("limit", 16))

        product_groups = ProductGroup.objects.filter(sub_category_id = sub_category_id).annotate(
            best_ranking     = Avg('review__star_rate'),
            review_count     = Count('review'),
            review_star_rate = Avg('review__star_rate'),
            discounted_price = F('displayed_price') - F('displayed_price') * (F('discount_rate')/100),
            latest_update    = F('created_at')
        ).order_by(ordering)[OFFSET:OFFSET+LIMIT]
        
        results = [
            {
            'id'               : product_group.id,
            'company'          : product_group.company,
            'product_name'     : product_group.name,
            'price'            : float(product_group.displayed_price),
            'image_url'        : product_group.productimage_set.all()[0].image_url,
            'discount_rate'    : float(product_group.discount_rate),
            'discounted_price' : float(round(product_group.discounted_price,0)),
            'star_rate'        : float(product_group.review_star_rate),
            'review'           : product_group.review_count
            }for product_group in product_groups]

        return JsonResponse({'product_groups':results}, status = 200)