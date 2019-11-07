from django.contrib import admin

from .models import BlogType
from .models import Blog
# from .models import ReadNum


@admin.register(BlogType)
class BlogTypeAdmin(admin.ModelAdmin):
    list_display = ('id', 'type_name')


# 该装饰器作用等价于下面：
# admin.site.register(Blog,BlogAdmin)
@admin.register(Blog)
class BlogAdmin(admin.ModelAdmin):
    # list_display = ('title', 'blog_type', 'author', 'get_read_num', 'created_time', 'last_updated_time')
    list_display = ('id', 'title', 'blog_type', 'author', 'get_read_num', 'created_time', 'last_updated_time')


# @admin.register(ReadNum)
# class ReadNumAdmin(admin.ModelAdmin):
#     list_display = ('read_num', 'blog')
