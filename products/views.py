from django.http import JsonResponse
from django.views    import View
from django.db.models import Avg

from products.models import ProductGroup

class ProductDetailView(View):
    def get(self, request, id):
        if not ProductGroup.objects.filter(id=id).exists():
            return JsonResponse({'message' : 'INVAILD_PRODUCT'}, status=401)

        product_group = ProductGroup.objects.get(id=id)

        products = {
            'id'                : product_group.id,
            'name'              : product_group.name,
            'displayed_price'   : float(product_group.displayed_price),
            'discount_rate'     : float(product_group.discount_price),
            'discounted_price'  : round(float(product_group.displayed_price) * (100 - float(product_group.discount_price))*0.01,0),
            'star_rate'         : round(product_group.review_set.aggregate(Avg('star_rate'))['star_rate__avg'],1),
            'image'             : [product.image_url for product in product_group.productimage_set.all()],
            'company'           : product_group.company,
            'delivery_type'     : product_group.delivery.delivery_type,
            'payment_type'      : product_group.delivery.payment_type,
            'delivery_fee'      : float(product_group.delivery.delivery_fee),
            'product'           : [
                                      {
                                          'id' : product.id,
                                          'name' : product.name,
                                          'price' : product.price,
                                          'color' : list(product.colors.values_list('name', flat=True))
                                  } for product in product_group.product_set.all()
            ]
        }

        return JsonResponse({'products' : products}, status=200)