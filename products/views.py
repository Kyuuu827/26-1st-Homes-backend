from django.http      import JsonResponse
from django.views     import View
from django.db.models import Avg, F

from products.models  import ProductGroup

class ProductGroupView(View):
    def get(self, request, id):
        try:

            product_groups   = ProductGroup.objects.prefetch_related('product_set').select_related('delivery').annotate(
                star_ranking     = Avg('review__star_rate'),
                discounted_price = F('displayed_price') - F('displayed_price')  * (F('discount_price')/100)
            ).get(id=id)

            product_group = {
                'id'                : product_groups.id,
                'name'              : product_groups.name,
                'displayed_price'   : float(product_groups.displayed_price),
                'discount_rate'     : float(product_groups.discount_price),
                'discounted_price'  : float(round(product_groups.discounted_price,0)),
                'star_rate'         : float(round((product_groups.star_ranking),1)),
                'image'             : [product.image_url for product in product_groups.productimage_set.all()],
                'company'           : product_groups.company,
                'delivery_type'     : product_groups.delivery.delivery_type,
                'payment_type'      : product_groups.delivery.payment_type,
                'delivery_fee'      : float(product_groups.delivery.delivery_fee),
                'product'           : [
                    {
                        'id' : product.id,
                        'name' : product.name,
                        'price' : product.price,
                    } for product in product_groups.product_set.all()
                ],
                'color' : list(product_groups.product_set.all()[0].colors.values("name","id"))
            }

            return JsonResponse({'product_group' : product_group}, status=200)
        
        except ProductGroup.DoesNotExist:
            return JsonResponse({'message' : 'INVALID_PRODUCT'}, status=404)