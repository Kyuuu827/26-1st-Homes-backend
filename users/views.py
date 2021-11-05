import bcrypt, re, json

from django.views import View
from django.http  import JsonResponse
from django.conf  import settings

from .models              import User

class SignUpView(View):
    def post(self, request):
        try:
            data         = json.loads(request.body)
            name         = data["name"]
            email        = data["email"]
            password     = data["password"]
            phone_number = data["phone_number"]
            nickname     = data["nickname"]

            if not re.match('^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$', email):
                return JsonResponse({'message' : 'EMAIL_VALIDATION_ERROR'}, status=400)

            if not re.match("^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$", password):
                return JsonResponse({'message' : 'PASSWORD_VALIDATION_ERROR'}, status=400)

            if not re.match("^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$", phone_number):
                return JsonResponse({'message' : 'PHONE_NUMBER_ERROR'}, status=400)

            if User.objects.filter(email=email).exists():
                return JsonResponse({'message' : 'DUPLICATED EMAIL'}, status=400)

            if User.objects.filter(nickname=nickname).exists():
                return JsonResponse({'message' : 'DUPLICATED NICKNAME'}, status=400)

            hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

            User.objects.create(
                email        = email,
                password     = hashed_password,
                phone_number = phone_number,
                nickname     = nickname,
                name         = name
                )

            return JsonResponse({'message' : 'SUCCESS'}, status = 201)

        except KeyError:
            return JsonResponse({'message' : 'KEY_ERROR'}, status=400)

        except json.decoder.JSONDecodeError:
            return JsonResponse({'message' : 'NO_DATA'}, status=400)
