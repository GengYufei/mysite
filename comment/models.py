from django.db import models
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from django.contrib.auth.models import User

# Create your models here.
class Comment(models.Model):
    # 创建‘评论对象’
    # 下面语句：通过调用导入的包ContentType，去关联相应的blog APP中的模型
    content_type = models.ForeignKey(ContentType, on_delete=models.DO_NOTHING)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    # 创建评论内容
    text = models.TextField()   # models.TextField，该字段类型不限字数

    # 创建评论时间
    comment_time = models.DateTimeField(auto_now_add=True)  # 自动添加当前时间

    # 创建评论者
    # 关联到Django自带的用户管理系统,需要引用模型：from django.contrib.auth.models import User
    # 外键关联到‘User’
    # on_delete=models.DO_NOTHING：当删除本表结构的user时，对Django自带用户管理数据不做任何操作
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING)

    class Meta:
        # 排序设置：倒序排序
        ordering = ['-comment_time']    # 根据创建评论时间，倒序排序

