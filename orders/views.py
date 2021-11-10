import json

from django.views     import View
from django.http      import JsonResponse
from django.db        import transaction
from django.db.models import Sum, F

from orders.models    import Order, OrderItem, OrderStatus
from products.models  import Product, ProductImage
from users.models  import User, Address
from core.utils       import signin_decorator

class OrderItemView(View):
    @signin_decorator
    def post(self, request):
        try:            
            data = json.loads(request.body)
            user_id           = request.user.id 
            product_id        = data['product_id']
            color_id          = data['color_id']
            purchase_quantity = data['quantity']

            if not Product.objects.filter(id = product_id).exists():
                return JsonResponse({'MESSAGE' : 'DOES NOT EXIST'}, status = 400)

            with transaction.atomic():    
                user   = User.objects.get(id=user_id)
                status = OrderStatus.objects.get(id=1)

                order = Order.objects.create(
                    user_id = user_id,
                    address = user.address_set.all()[0],
                    status  = status
                    )
                
                order.save()

                orderitem = OrderItem.objects.create(
                    order_id   = order.id,
                    product_id = product_id, 
                    color_id   = color_id,
                    quantity   = purchase_quantity
                    )
                
                orderitem.save()

                return JsonResponse({'MESSAGE' : 'CREATED'}, status = 201)

        except KeyError:
            return JsonResponse({'MESSAGE' : 'KEY ERROR'}, status = 400)


    @signin_decorator
    def get(self, request):
        current_user_id = request.user.id
        
        order_histories = OrderItem.objects.select_related('product', 'product__product_group').prefetch_related('product__product_group__productimage_set').filter(order__user_id=current_user_id)

        if not order_histories.exists():
            return JsonResponse( {'MESSAGE' : 'EMPTY'}, status = 404)

        results = [
            {
                "product_img"  : order_history.product.product_group.productimage_set.first().image_url,
                "price"        : order_history.product.price,
                "name"         : order_history.product.name,
                "quantity"     : order_history.quantity
            } for order_history in order_histories]
        
        return JsonResponse( {'MESSAGE' : results}, status = 201)


    @signin_decorator
    def patch(self, request, id):
        try:
            data = json.loads(request.body)
            product_id = data['product_id']
            color_id   = data['color_id']
            quantity   = data['quantity']

            order_item = OrderItem.objects.filter(order__user_id=request.user.id).get(id=id)

            order_item.product_id = product_id
            order_item.color_id   = color_id
            order_item.quantity   = quantity

            order_item.save()

            return JsonResponse({'MESSAGE' : 'ORDER INFORMATION UPDATED'}, status = 201)

        except KeyError:
            return JsonResponse({'MESSAGE' : 'KEY ERROR'}, status = 400)


    @signin_decorator
    def delete(self, request, id):
        OrderItem.objects.filter(order__user_id=request.user.id).get(id=id).delete()

        return JsonResponse({'MESSAGE' : 'ORDER INFORMATION DELETED'}, status = 201)