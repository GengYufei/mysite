from django.contrib import admin
from .models import Comment

# Register your models here.
@admin.register(Comment)    # 注册对应模型：Comment
class CommentAdmin(admin.ModelAdmin):
    list_display = ('content_object', 'text', 'comment_time', 'user')