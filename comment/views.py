from django.shortcuts import render, redirect
from django.contrib.contenttypes.models import ContentType
from django.urls import reverse

from .models import Comment
from .forms import CommentForm

# Create your views here.
# 评论提交
def update_comment(request):
    comment_form = CommentForm(request.POST, user=request.user)    # 实例化forms.py的CommentForm类
    # 返回之前页面
    referer = request.META.get('HTTP_REFERER', reverse('home'))
    if comment_form.is_valid():
        # 检查通过，保存数据至数据库
        # 往模型（即数据库表结构）Comment添加记录值
        comment = Comment()
        comment.user = comment_form.cleaned_data['user']
        comment.text = comment_form.cleaned_data['text']
        comment.content_object = comment_form.cleaned_data['content_object']
        comment.save()
        return redirect(referer)
    else:
        return render(request, 'error.html', {'message': comment_form.errors, 'redirect_to': referer})
