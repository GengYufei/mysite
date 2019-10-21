"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from .import views

urlpatterns = [
    path('', views.home, name='home'),
    path('admin/', admin.site.urls),
    path('ckeditor', include('ckeditor_uploader.urls')),    # 增加图片上传功能相关URL
    path('blog/', include('blog.urls')),                    # 添加blog APP的URL
    path('comment/', include('comment.urls')),              # 添加comment APP的URL
    path('login/', views.login_, name='login'),             # 用户登录地址
    path('register/', views.register, name='register'),     # 用户注册地址

]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)