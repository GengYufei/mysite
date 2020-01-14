from django.urls import path
from . import views

# start with blog
urlpatterns = [
    path('', views.actionManage_index, name='actionManage_index'),
    path('employ/', views.actionManage_employ, name='actionManage_employ'),
    path('clothes/', views.actionManage_clothes, name='actionManage_clothes'),
    path('shoes/', views.actionManage_shoes, name='actionManage_shoes'),
    path('cabinet/', views.actionManage_cabinet, name='actionManage_cabinet'),
    path('traces/', views.actionManage_traces, name='actionManage_traces'),
    path('stock/', views.actionManage_stock, name='actionManage_stock'),
    path('system/', views.actionManage_system, name='actionManage_system'),
    path('system/addEmploy/', views.actionManage_system_addEmploy, name='actionManage_system_addEmploy'),
]
