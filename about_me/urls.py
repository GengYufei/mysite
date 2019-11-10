from django.urls import path
from . import views

# start with blog
urlpatterns = [
    path('', views.about_me, name='about_me'),
]
