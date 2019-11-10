from django.shortcuts import render


# Create your views here.
# 关于我主界面
def about_me(request):
    context = {}
    # return render(request, 'blog/blog_list.html', context)
    return render(request, 'about_me/about_me.html', context)
