from django.http      import JsonResponse
from django.views     import View
from django.db.models import Avg

class ProductGroupView(View):
    def get(self, request, id):
        try:
            product_group = ProductGroup.objects.get(id=id)

            products = {
                ### 주석 처리된 부분은 product_group list code review 부분 동일하게 반영해주세요. ###

                #'id'                : product_group.id,
                #'name'              : product_group.name,
                #'displayed_price'   : float(product_group.displayed_price),
                #'discount_rate'     : float(product_group.discount_price),
                #'discounted_price'  : round(float(product_group.displayed_price) * (100 - float(product_group.discount_price))*0.01,0),
                #'star_rate'         : round(product_group.review_set.aggregate(Avg('star_rate'))['star_rate__avg'],1),
                
                # db hit 검사 및 최적화 필요
                'image'             : [product.image_url for product in product_group.productimage_set.all()],
                #'company'           : product_group.company,
                'delivery_type'     : product_group.delivery.delivery_type,
                'payment_type'      : product_group.delivery.payment_type,
                'delivery_fee'      : float(product_group.delivery.delivery_fee),

                # db hit 검사 및 최적화 필요
                # values_list 과연 효율적인가?? 꼭 써야되는가?
                'products'           : [
                    {
                      'id'    : product.id,
                      'name'  : product.name,
                      'price' : product.price,
                      'color' : list(product.colors.values_list('name', flat=True))
                    } for product in product_group.product_set.all()
                ]
            }

            return JsonResponse({'products' : products}, status=200)

        except ProductGroup.DoesNotExist:
            return JsonResponse({'message' : 'INVAILD_PRODUCT'}, status=404)
