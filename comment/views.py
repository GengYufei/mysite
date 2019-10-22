from django.shortcuts import render, redirect
from django.contrib.contenttypes.models import ContentType
from django.urls import reverse

from .models import Comment

# Create your views here.
# 评论提交
def update_comment(request):
    # 返回之前页面
    referer = request.META.get('HTTP_REFERER', reverse('home'))

    '''数据检查'''
    # 获取请求内容：request请求头包含相关内容（blog_detail.html提交的评论表单form）
    user = request.user
    if not user.is_authenticated:
        return render(request, 'error.html', {'message': '用户未登录', 'redirect_to': referer})
    text = request.POST.get('text', '').strip()     # 若text为空值，则返回''，即空值;strip，去掉字符串前后端多余空格
    # 对评论内容text进行判断，如果为空，则返回错误页面
    if text == '':
        return render(request, 'error.html', {'message': '评论内容为空', 'redirect_to': referer})

    try:
        content_type = request.POST.get('content_type', '')  # form表单中input包含的键content_type
        object_id = int(request.POST.get('object_id', ''))  # form表单中input包含的键object_id
        model_class = ContentType.objects.get(model=content_type).model_class()
        model_obj = model_class.objects.get(pk=object_id)
    except Exception as e:
        return render(request, 'error.html', {'message': '评论对象不存在', 'redirect_to': referer})


    '''检查通过，保存数据至数据库'''
    # 往模型（即数据库表结构）Comment添加记录值
    comment = Comment()
    comment.user = user
    comment.text = text
    comment.content_object = model_obj
    comment.save()
    return redirect(referer)
