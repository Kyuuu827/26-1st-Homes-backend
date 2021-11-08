from products.models      import (
    Menu, 
    Category, 
    SubCategory, 
    ProductGroup
)

class MenuListView(View):
    def get(self, request):
        menus = Menu.objects.prefetch_related('category_set', 'category_set__subcategory_set')

        results = [{
            'menu_id'   : menu.id,
            'menu_name' : menu.name,
            'image_url' : menu.image_url,
            'categories'  : [{
                'id'   : category.id,
                'name' : category.name,
                'subcategories'   : [{
                    'id'   : sub_category.id,
                    'name' : sub_category.name,
                } for sub_category in category.subcategory_set.all()],
            } for category in menu.category_set.all()],
        } for menu in menus]

        return JsonResponse({'menus': results}, status = 200)


class ProductGroupsView(View):
    def get(self, request):
        sub_category_id = request.GET.get("SubCategoryId")
        ordering        = request.GET.get("ordering", "id")
        offset        
        limit 

        product_groups = ProductGroup.objects.filter(categoriy_id = sub_category_id).annotate(
            star_ranking     = Avg('review__star_rate'),
            review_count     = Count('review'),
            review_star_rate = Avg('star_rate'),
            discounted_price = F('displayed_price') - F(displayed_price  * discount_rate * 0.01)
        ).order_by(ordering).filter(**filter_set)
        
        results = [
            {
                did'               : product.id,
                'company'          : product.company,
                'product_name'     : product.name,
                'price'            : product.displayed_price,
                'image_url'        : product.productimage_set.all()[0].image_url,
                'discount_rate'    : product.discount_rate,
                'discounted_price' : product.discounted_price,
                'star_rate'        : product.review_star_rate,
                'review'           : product.review_count
        } for product_group in product_groups]

        return JsonResponse({'product_groups' : product_groups}, status = 200)
