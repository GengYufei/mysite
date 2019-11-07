from django.shortcuts import render
from django.shortcuts import get_object_or_404
from django.core.paginator import Paginator
from django.conf import settings
from django.db.models import Count
from django.contrib.contenttypes.models import ContentType
from django.template.defaultfilters import date

from .models import Blog
from .models import BlogType
from read_statistics.utils import read_statistics_once_read     # 从APP read_statistics的工具模块中，导入类：ReadNum
from comment.models import Comment      # 从APP comment的数据模型中，导出模型类：Comment
from comment.forms import CommentForm   # 从APP comment的forms模块导入CommentForm

# 获取博客视图的通用代码，汇总到一起
def get_blog_list_common_data(request, blogs_all_list):
    # 从settings文件中获取每页的文章数量EACH_PAGE_BLOGS_NUMBER
    paginator = Paginator(blogs_all_list, settings.EACH_PAGE_BLOGS_NUMBER)
    # 获取url的页码参数（GET请求）
    # 'page'相当于字典类型的键，用于获取get请求包里对应的‘页码值’
    # ‘1’，默认值，当‘page’对应的值为空时，默认返回1
    # 返回值为‘int’
    page_num = request.GET.get('page', 1)
    # print(type(page_num))
    page_of_blogs = paginator.get_page(page_num)    # 获取相应页面
    current_page_num = page_of_blogs.number     # 获取当前页码

    # 页码优化(获取当前页码后各2页的页码范围)
    page_range = list(range(max(current_page_num - 2, 1), current_page_num)) + \
                 list(range(current_page_num, min(current_page_num + 2, paginator.num_pages) + 1))

    # 加上省略页码标记
    if page_range[0] - 1 >= 2:
        page_range.insert(0, '...')
    if paginator.num_pages - page_range[-1] >= 2:
        page_range.append('...')

    # 加上首页和尾页
    if page_range[0] != 1:
        page_range.insert(0, 1)  # 如果第一个元素不是页码1，则在列表首部添加1
    if page_range[-1] != paginator.num_pages:
        page_range.append(paginator.num_pages)      # 如果最后一个元素不是总页码数，则在列表最后添加总页码数

    # 获取对应分类的博客文章数量
    '''
    方法1：
    # 获取博客分类的对应博客数量(调用annotate方法)
    # Count是Django的一个统计数量的方法
    # 'blog'对应BlogType表外联到Blog表的小写，这是Count方法要求的参数
    # 该方法，直接解析为数据库query语句，增加blog_count属性（字段）
    BlogType.objects.annotate(blog_count=Count('blog'))
    '''
    '''
    方法2：
    下面这个方法，会占用服务器内存资源，增加服务器负担，不建议使用
    blog_types = BlogType.objects.all()     # 获取博客类型的所有实例对象
    blog_types_list = []
    for blog_type in blog_types:
        blog_type.blog_count = Blog.objects.filter(blog_type=blog_type).count()     # blog_type实例，增加blog_count属性
        blog_types_list.append(blog_type)   # 将实例blog_type，保存到列表中
    '''

    # 获取日期归档对应的博客数量
    blog_dates = Blog.objects.dates('created_time', 'month', order='DESC')
    blog_dates_dict = {}
    for blog_date in blog_dates:
        blog_count = Blog.objects.filter(created_time__year=blog_date.year,
                                         created_time__month=blog_date.month).count()
        blog_dates_dict[blog_date] = blog_count

    context = {}
    context['page_of_blogs'] = page_of_blogs    # 获取当前页的文章的实例对象（Blog()
    context['page_range'] = page_range  # 提供当前页码及周围的前后2页码
    context['blog_dates'] = blog_dates_dict   # 按月份降序，获取博客对象集合
    # 获取博客类型对象集合，临时增加了数量统计字段（blog_count）
    # annotate的学习网址（很全面）：https://blog.csdn.net/qq_25046261/article/details/79178462
    context['blog_types'] = BlogType.objects.annotate(blog_count=Count('blog'))
    return context

# 博客列表
def blog_list(request):
    blogs_all_list = Blog.objects.all()     # 从数据库获取‘博客表结构的所有记录’，返回一个列表
    context = get_blog_list_common_data(request, blogs_all_list)
    return render(request, 'blog/blog_list.html', context)

# 博客详细内容
def blog_detail(request, blog_pk):
    blog = get_object_or_404(Blog, pk=blog_pk)
    read_cookie_key = read_statistics_once_read(request, blog)
    # 作用：评论区展示评论内容
    blog_content_type = ContentType.objects.get_for_model(blog)     # 获取博客的content_type类型
    # 得到相关评论内容(从数据库取数据)
    comments = Comment.objects.filter(content_type=blog_content_type, object_id=blog.pk, parent=None)

    # 依据创建时间，获取比当前博客创建时间晚的相邻的第一条博客列表
    context = {}
    context['previous_blog'] = Blog.objects.filter(created_time__gt=blog.created_time).last()
    # 依据创建时间，获取比当前博客创建时间早的相邻的第一条博客列表
    context['next_blog'] = Blog.objects.filter(created_time__lt=blog.created_time).first()
    context['blog'] = blog
    context['comments'] = comments.order_by('-comment_time')  # 返回评论内容到前端页面
    # 评论表单类实例化
    context['comment_form'] = CommentForm(initial={'content_type': blog_content_type.model,
                                                   'object_id': blog_pk,
                                                   'reply_comment_id': 0})
    response = render(request, 'blog/blog_detail.html', context)     # 响应
    response.set_cookie(read_cookie_key, 'true')   # 设置cookie，博客阅读统计
    return response

# 根据博客类型分类
def blogs_with_type(request, blog_type_pk):
    blog_type = get_object_or_404(BlogType, pk=blog_type_pk)
    blogs_all_list = Blog.objects.filter(blog_type=blog_type)   # 此处修改：只获取该分类下的博客对象

    context = get_blog_list_common_data(request, blogs_all_list)
    context['blog_type'] = blog_type  # 获取文章类型
    return render(request, 'blog/blogs_with_type.html', context)


# 根据创建日期进行分类
def blogs_with_date(request, year, month):
    # 根据年月获取博客列表
    blogs_all_list = Blog.objects.filter(created_time__year=year, created_time__month=month)
    context = get_blog_list_common_data(request, blogs_all_list)
    context['blogs_with_date'] = "%s年%s月" % (year, month)
    return render(request, 'blog/blogs_with_date.html', context)











# 原始未精炼过的代码，方便后期维护
# def blog_list(request):
#     blogs_all_list = Blog.objects.all()
#     # 从settings文件中获取每页的文章数量EACH_PAGE_BLOGS_NUMBER
#     paginator = Paginator(blogs_all_list, settings.EACH_PAGE_BLOGS_NUMBER)
#     page_num = request.GET.get('page', 1)   # 获取url的页码参数（GET请求）
#     page_of_blogs = paginator.get_page(page_num)    # 获取相应页面
#     current_page_num = page_of_blogs.number     # 获取当前页码
#
#
#     # 提供当前页码周围的页码 (存在-1 0 等页码)
#     # page_range = [current_page_num - 2, current_page_num - 1, current_page_num,
#     #               current_page_num + 1, current_page_num + 2]
#
#     # 页码优化(获取当前页码后各2页的页码范围)
#     page_range = list(range(max(current_page_num - 2, 1), current_page_num)) + \
#                  list(range(current_page_num, min(current_page_num + 2, paginator.num_pages) + 1))
#
#     # 加上省略页码标记
#     if page_range[0] - 1 >= 2:
#         page_range.insert(0, '...')
#     if paginator.num_pages - page_range[-1] >= 2:
#         page_range.append('...')
#
#     # 加上首页和尾页
#     if page_range[0] != 1:
#         page_range.insert(0,1)  # 如果第一个元素不是页码1，则在列表首部添加1
#     if page_range[-1] != paginator.num_pages:
#         page_range.append(paginator.num_pages)      # 如果最后一个元素不是总页码数，则在列表最后添加总页码数
#
#     context = {}
#     # context['blogs'] = page_of_blogs.object_list    # 获取单个页面的文章内容（object_list是一个方法）
#     context['page_of_blogs'] = page_of_blogs    #   获取当前页的文章的实例对象（Blog()）
#     context['page_range'] = page_range  # 提供当前页码及周围的前后2页码
#     # context['blogs_count'] = Blog.objects.all().count()
#     context['blog_dates'] = Blog.objects.dates('created_time', 'month', order='DESC')
#     context['blog_types'] = BlogType.objects.all()
#     return render(request, 'blog/blog_list.html', context)
#
# def blog_detail(request, blog_pk):
#     context = {}
#     blog = get_object_or_404(Blog, pk=blog_pk)
#     # 依据创建时间，获取比当前博客创建时间晚的相邻的第一条博客列表
#     context['previous_blog'] = Blog.objects.filter(created_time__gt=blog.created_time).last()
#     # 依据创建时间，获取比当前博客创建时间早的相邻的第一条博客列表
#     context['next_blog'] = Blog.objects.filter(created_time__lt=blog.created_time).first()
#     context['blog'] = blog
#     return render(request, 'blog/blog_detail.html', context)
#
# def blogs_with_type(request, blog_type_pk):
#     # 原内容
#     # context = {}
#     # blog_type = get_object_or_404(BlogType, pk=blog_type_pk)
#     # context['blogs'] = Blog.objects.filter(blog_type=blog_type)     # 过滤器，获取指定类型的博客文章
#     # context['blog_type'] = blog_type    # 获取文章类型
#     # context['blog_types'] = BlogType.objects.all()
#
#     # 以下代码：从blog_list方法中复制过来
#     blog_type = get_object_or_404(BlogType, pk=blog_type_pk)
#     blogs_all_list = Blog.objects.filter(blog_type=blog_type)   # 此处修改：只获取该分类下的博客对象
#     # 从settings文件中获取每页的文章数量EACH_PAGE_BLOGS_NUMBER
#     paginator = Paginator(blogs_all_list, settings.EACH_PAGE_BLOGS_NUMBER)
#     page_num = request.GET.get('page', 1)   # 获取url的页码参数（GET请求）
#     page_of_blogs = paginator.get_page(page_num)    # 获取相应页面
#     print('测试 type：', page_of_blogs)
#     current_page_num = page_of_blogs.number     # 获取当前页码
#
#     # 页码优化(获取当前页码后各2页的页码范围)
#     page_range = list(range(max(current_page_num - 2, 1), current_page_num)) + \
#                  list(range(current_page_num, min(current_page_num + 2, paginator.num_pages) + 1))
#
#     # 加上省略页码标记
#     if page_range[0] - 1 >= 2:
#         page_range.insert(0, '...')
#     if paginator.num_pages - page_range[-1] >= 2:
#         page_range.append('...')
#
#     # 加上首页和尾页
#     if page_range[0] != 1:
#         page_range.insert(0,1)  # 如果第一个元素不是页码1，则在列表首部添加1
#     if page_range[-1] != paginator.num_pages:
#         page_range.append(paginator.num_pages)      # 如果最后一个元素不是总页码数，则在列表最后添加总页码数
#
#     context = {}
#     context['page_of_blogs'] = page_of_blogs    # 获取当前页的文章的实例对象（Blog()）
#     context['blog_type'] = blog_type  # 获取文章类型
#     context['page_range'] = page_range  # 提供当前页码及周围的前后2页码
#     context['blog_types'] = BlogType.objects.all()
#     context['blog_dates'] = Blog.objects.dates('created_time', 'month', order='DESC')
#     return render(request, 'blog/blogs_with_type.html', context)
#
# def blogs_with_date(request, year, month):
#     context = {}
#     # 根据年月获取博客列表
#     blogs_all_list = Blog.objects.filter(created_time__year=year, created_time__month=month)
#     # 从settings文件中获取每页的文章数量EACH_PAGE_BLOGS_NUMBER
#     paginator = Paginator(blogs_all_list, settings.EACH_PAGE_BLOGS_NUMBER)
#     page_num = request.GET.get('page', 1)  # 获取url的页码参数（GET请求）
#     page_of_blogs = paginator.get_page(page_num)  # 获取相应页面
#     print("测试：", page_of_blogs)
#     current_page_num = page_of_blogs.number  # 获取当前页码
#
#     # 页码优化(获取当前页码后各2页的页码范围)
#     page_range = list(range(max(current_page_num - 2, 1), current_page_num)) + \
#                  list(range(current_page_num, min(current_page_num + 2, paginator.num_pages) + 1))
#
#     # 加上省略页码标记
#     if page_range[0] - 1 >= 2:
#         page_range.insert(0, '...')
#     if paginator.num_pages - page_range[-1] >= 2:
#         page_range.append('...')
#
#     # 加上首页和尾页
#     if page_range[0] != 1:
#         page_range.insert(0, 1)  # 如果第一个元素不是页码1，则在列表首部添加1
#     if page_range[-1] != paginator.num_pages:
#         page_range.append(paginator.num_pages)  # 如果最后一个元素不是总页码数，则在列表最后添加总页码数
#
#     context['blogs_with_date'] = "%s年%s月" % (year, month)
#     context['page_of_blogs'] = page_of_blogs  # 获取当前页的文章的实例对象（Blog()）
#     context['page_range'] = page_range  # 提供当前页码及周围的前后2页码
#     context['blog_types'] = BlogType.objects.all()
#     context['blog_dates'] = Blog.objects.dates('created_time', 'month', order='DESC')
#     return render(request, 'blog/blogs_with_date.html', context)