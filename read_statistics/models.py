from django.db import models
from django.db.models.fields import exceptions
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from django.utils import timezone


class ReadNum(models.Model):
    read_num = models.IntegerField(default=0)

    # 下面语句：通过调用导入的包ContentType，去关联相应的blog APP中的模型
    content_type = models.ForeignKey(ContentType, on_delete=models.DO_NOTHING)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')


class ReadNumExpandMethod():
    def get_read_num(self):
        try:
            ct = ContentType.objects.get_for_model(self)    # 获取Blog 类型
            readnum = ReadNum.objects.get(content_type=ct, object_id=self.pk)   # 实例化ReadNum
            return readnum.read_num     # 调用readnum 对象的实例属性：read_num
        except exceptions.ObjectDoesNotExist:
            return 0


class ReadDetail(models.Model):
    date = models.DateField(default=timezone.now)
    read_num = models.IntegerField(default=0)
    # 下面语句：通过调用导入的包ContentType，去关联相应的blog APP中的模型
    content_type = models.ForeignKey(ContentType, on_delete=models.DO_NOTHING)

    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')