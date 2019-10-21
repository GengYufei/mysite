from django.shortcuts import render, redirect
from django.contrib.contenttypes.models import ContentType
from django.urls import reverse

from .models import Comment

# Create your views here.
# 评论提交
def update_comment(request):
    # 获取请求内容：request请求头包含相关内容（blog_detail.html提交的评论表单form）
    user = request.user
    text = request.POST.get('text', '')     # 若text为空值，则返回''，即空值
    content_type = request.POST.get('content_type', '')     # form表单中input包含的键content_type
    object_id = int(request.POST.get('object_id', ''))      # form表单中input包含的键object_id
    model_class = ContentType.objects.get(model=content_type).model_class()
    model_obj = model_class.objects.get(pk=object_id)

    # 往模型（即数据库表结构）Comment添加记录值
    comment = Comment()
    comment.user = user
    comment.text = text
    comment.content_object = model_obj
    comment.save()

    referer = request.META.get('HTTP_REFERER', reverse('home'))
    return redirect(referer)
