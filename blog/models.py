from django.db import models
from django.contrib.auth.models import User
from ckeditor_uploader.fields import RichTextUploadingField  # 富文本编辑的字段(增加图片上传功能)
from django.contrib.contenttypes.fields import GenericRelation  # 关联外部模型

from read_statistics.models import ReadNumExpandMethod
from read_statistics.models import ReadDetail

class BlogType(models.Model):
    '''
    博文类型：
    '''
    type_name = models.CharField(max_length=15)  # 博文类型

    def __str__(self):  # 显示字符内容
        return self.type_name

    # class Meta做为嵌套类，主要目的是给上级类添加一些功能，或者指定一些标准
    class Meta:
        # 通过verbose_name来指定对应的model在admin后台的显示名称，这里verbose_name_plural
        # 用来表示多篇文章时的复数显示形式。英语中，如果有多篇文章，就会显示为Posts，表示复数，
        # 中文没有复数表现形式，所以定义为和verbose_name一样。
        # verbose_name = '博客类型'
        # verbose_name_plural = verbose_name
        pass


class Blog(models.Model, ReadNumExpandMethod):
    '''
    博文模型：文章标题、文章内容、作者、创建时间、更新时间
    '''
    title = models.CharField(max_length=50)  # 文章标题
    blog_type = models.ForeignKey(BlogType, on_delete=models.CASCADE)  # 博文分类，连接外键
    content = RichTextUploadingField()  # 文章内容(调用了Django自带的富文本编辑器)
    author = models.ForeignKey(User, on_delete=models.CASCADE)  # 文章作者，创建外键，关联Django自带的作者模型

    created_time = models.DateTimeField(auto_now_add=True)  # 设置文章创建时间
    last_updated_time = models.DateTimeField(auto_now=True)  # 设置文章更新时间

    read_details = GenericRelation(ReadDetail)  # 关联到APP（read_statistics）下的模型（ReadDetail）


    def __str__(self):
        return '<Blog:%s>' % self.title
        # return self.title

    # class Meta做为嵌套类，主要目的是给上级类添加一些功能，或者指定一些标准
    class Meta:
        ordering = ['-created_time']  # 设置数据库，根据创建时间排序，‘-’代表倒序（最新的时间）

        # 通过verbose_name来指定对应的model在admin后台的显示名称，这里verbose_name_plural
        # 用来表示多篇文章时的复数显示形式。英语中，如果有多篇文章，就会显示为Posts，表示复数，
        # 中文没有复数表现形式，所以定义为和verbose_name一样。
        # verbose_name = '博客'
        # verbose_name_plural = verbose_name

