import json

from django.http import JsonResponse
from django.views import View
from django.db.models import Sum

from users.models    import User
from products.models import Product, ProductGroup
from .models         import Cart
from core.utils      import signin_decorator

class CartListView(View):
    @signin_decorator
    def post(self, request):
        try :
            data = json.loads(request.body)
            product_id = data['ProductId']
            quantity = data['quantity']
            color_id = data['ColorId']

            if not Cart.objects.filter(product_id=product_id, color_id=color_id).exists():
                Cart.objects.create(
                    product_id = product_id,
                    quantity = quantity,
                    user_id = request.user.id,
                    color_id = color_id
                )
            else:
                cart = Cart.objects.filter(product_id=product_id).get(color_id=color_id)
                cart.quantity += quantity
                cart.save()
            return JsonResponse({'message' : 'SUCCESS'}, status = 201)

        except KeyError:
            return JsonResponse({'message' : 'KEY_ERROR'}, status=400)

        except json.decoder.JSONDecodeError:
            return JsonResponse({'message' : 'NO_DATA'}, status=400)

    @signin_decorator
    def get(self, request):
        try:
            carts= Cart.objects.select_related('product','color','product__product_group', 'product__product_group__delivery').prefetch_related('product__product_group__productimage_set').filter(user_id = request.user.id)

            cart_items =[{
                'product_name'           : cart.product.name,
                'quantity'               : cart.quantity,
                'price'                  : cart.product.price,
                'color'                  : cart.color.name,
                'product_image'          : cart.product.product_group.productimage_set.all()[0].image_url,
                'cart_id'                : cart.id,
                'company'                : cart.product.product_group.company,
                'delivery_payment_type'  : cart.product.product_group.delivery.payment_type,
                'delivery_fee'           : cart.product.product_group.delivery.delivery_fee
            }for cart in carts]

            total_product_price = sum([cart.product.price*cart.quantity for cart in carts])
            prepayment_delivery_fee = sum([cart.product.product_group.delivery.delivery_fee for cart in carts if cart.product.product_group.delivery.payment_type == '선불'])
            total_price = total_product_price + prepayment_delivery_fee

            return JsonResponse({'cart_items' : cart_items, 'total_product_price' :total_product_price, 'prepayment_delivery_fee' : prepayment_delivery_fee, 'total_price' : total_price }, status=200)

        except Cart.DoesNotExist:
            return JsonResponse({'message' : 'INVALID_CART'})

    @signin_decorator
    def delete(self, request, id):
        Cart.objects.get(id=id).delete()

        return JsonResponse({'message' : 'SUCCESS'}, status=201)

    @signin_decorator
    def patch(self, request, id):
        data = json.loads(request.body)
        quantity = data['quantity']
        cart =Cart.objects.get(id=id)
        cart.quantity += quantity
        cart.save()

        return JsonResponse({'message' : 'SUCCESS'}, status=201)