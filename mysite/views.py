import datetime

from django.shortcuts import render
from django.shortcuts import redirect  # 引入页面跳转方法
from django.contrib.contenttypes.models import ContentType
from django.urls import reverse  # 引入地址反向解析
from django.utils import timezone
from django.core.cache import cache  # 缓存
from django.db.models import Sum
from django.contrib.auth.models import User  # 用户注册
from django.contrib.auth import login  # 用户登录
from django.contrib.auth import authenticate  # 用户登录

from read_statistics.utils import get_seven_days_read_data
from read_statistics.utils import get_today_hot_data
from read_statistics.utils import get_yesterday_hot_data
from blog.models import Blog
from .forms import LoginForm, RegForm


def get_7_days_hot_blogs():
    today = timezone.now().date()  # 获取今天的日期
    date = today - datetime.timedelta(days=7)
    blogs = Blog.objects \
        .filter(read_details__date__lt=today, read_details__date__gte=date) \
        .values('id', 'title') \
        .annotate(read_num_sum=Sum('read_details__read_num')).order_by('-read_num_sum')
    return blogs[0:4]


def home(request):
    blog_content_type = ContentType.objects.get_for_model(Blog)
    dates, read_nums = get_seven_days_read_data(blog_content_type)

    # 获取7天热门博客的缓存数据
    hot_blogs_for_7_days = cache.get('hot_blogs_for_7_days')
    if hot_blogs_for_7_days is None:
        hot_blogs_for_7_days = get_7_days_hot_blogs()
        cache.set('hot_blogs_for_7_days', hot_blogs_for_7_days, 3600)

    context = {}
    context['dates'] = dates
    context['read_nums'] = read_nums
    context['today_hot_data'] = get_today_hot_data(blog_content_type)
    context['yesterday_hot_data'] = get_yesterday_hot_data(blog_content_type)
    context['hot_blogs_for_7_days'] = get_7_days_hot_blogs()
    return render(request, 'home.html', context)


# 创建用户登录界面
def login_(request):
    if request.method == 'POST':
        login_form = LoginForm(request.POST)
        if login_form.is_valid():  # is_valid可用的，即代表：用户输入的用户名、密码符合格式要求，进行下一步验证
            user = login_form.cleaned_data['user']
            login(request, user)  # 调用login方法，登录该用户
            # 通过request的GET方法获取在此之前的一个页面的地址URL，
            # 如果没有，则返回HOME主页面的URL，reverse地址反向解析
            return redirect(request.GET.get('from', reverse('home')))
    else:
        login_form = LoginForm()  # Django Form表单类的实例化
    context = { }
    context['login_form'] = login_form
    return render(request, 'login.html', context)


# 创建用户注册界面
def register(request):
    if request.method == 'POST':
        reg_form = RegForm(request.POST)
        if reg_form.is_valid():
            username = reg_form.cleaned_data['username']
            password = reg_form.cleaned_data['password_again']
            email = reg_form.cleaned_data['email']
            # 创建用户
            user = User.objects.create_user(username, email, password)
            user.save()
            # 登录用户
            user = authenticate(username=username, password=password)
            login(request, user)
            # 通过request的GET方法获取在此之前的一个页面的地址URL，
            # 如果没有，则返回HOME主页面的URL，reverse地址反向解析
            return redirect(request.GET.get('from', reverse('home')))
    else:
        reg_form = RegForm()  # Django Form表单类的实例化
    context = {}
    context['reg_form'] = reg_form
    return render(request, 'register.html', context)
