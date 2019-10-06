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


class Blog(models.Model, ReadNumExpandMethod):
    '''
    博文模型：文章标题、文章内容、作者、创建时间、更新时间
    '''
    title = models.CharField(max_length=50)  # 文章标题
    blog_type = models.ForeignKey(BlogType, on_delete=models.DO_NOTHING)  # 博文分类，连接外键
    content = RichTextUploadingField()  # 文章内容(调用了Django自带的富文本编辑器)
    author = models.ForeignKey(User, on_delete=models.DO_NOTHING)  # 文章作者，创建外键，关联Django自带的作者模型

    created_time = models.DateTimeField(auto_now_add=True)  # 设置文章创建时间
    last_updated_time = models.DateTimeField(auto_now=True)  # 设置文章更新时间

    read_details = GenericRelation(ReadDetail)  # 关联到APP（read_statistics）下的模型（ReadDetail）


    def __str__(self):
        return '<Blog:%s>' % self.title
        # return self.title

    # 排序规则定义
    class Meta:
        ordering = ['-created_time']  # 根据创建时间排序，‘-’代表倒序（最新的时间）

