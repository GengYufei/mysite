import datetime

from django.contrib.contenttypes.models import ContentType
from django.utils import timezone
from django.db.models import Sum

from .models import ReadNum
from .models import ReadDetail


def read_statistics_once_read(request, obj):
    ct = ContentType.objects.get_for_model(obj)
    key = '%s_%s_read' % (ct.model, obj.pk)
    if not request.COOKIES.get(key):  # 如果不存在该键值，则执行+1操作
        # 总阅读数+1
        # 利用get_or_create方法，判断是否存在该条记录，存在则返回一个元祖：实例化对象（object）和是否被创建的bool值（created）
        # 不存在，则创建实例化对象，同样返回一个元祖（obj，created）
        readnum, created = ReadNum.objects.get_or_create(content_type=ct, object_id=obj.pk)
        readnum.read_num += 1
        readnum.save()

        # # 上面三个语句，为此注释的优化后代码
        # # 触发该视图函数，对应的文章的阅读数自增1
        # if ReadNum.objects.filter(content_type=ct, object_id=obj.pk).count():
        #     # 存在记录
        #     # 上面已经导入.models.py 中的ReadNum模型
        #     # 下面语句，通过blog=blog关键参数，获取对应的一条记录，并赋值给局部变量readnum
        #     readnum = ReadNum.objects.get(content_type=ct, object_id=obj.pk)
        # else:
        #     # 不存在对应的记录
        #     # 下面语句，通过blog=blog关键参数，实例化创建对应的一条记录，并赋值给局部变量readnum
        #     readnum = ReadNum(content_type=ct, object_id=obj.pk)
        #
        # # 在模型ReadNum 的数据库模型中，无论是否存在该条记录，只要cookies中没有记录，则需要执行阅读数+1操作，并保存
        # readnum.read_num += 1
        # readnum.save()
        ''''''
        # 每天的阅读数
        date = timezone.now().date()
        # if ReadDetail.objects.filter(content_type=ct, object_id=obj.pk, date=date).count():
        #     readDetail = ReadDetail.objects.get(content_type=ct, object_id=obj.pk, date=date)
        # else:
        #     readDetail = ReadDetail(content_type=ct, object_id=obj.pk, date=date)
        readDetail, created = ReadDetail.objects.get_or_create(content_type=ct, object_id=obj.pk, date=date)
        readDetail.read_num += 1
        readDetail.save()
    return key


def get_seven_days_read_data(content_type):
    today = timezone.now().date()  # 获取今天的日期
    read_nums = []  # 保存阅读数
    dates = []  # 保存日期
    for i in range(7, 0, -1):
        # datetime python内置模块，方法timedelta，提供日期差（根据days参数的设置）
        # 下面这条语句，获得最近7天的日期
        date = today - datetime.timedelta(days=i)

        dates.append(date.strftime('%m/%d'))
        read_details = ReadDetail.objects.filter(content_type=content_type, date=date)
        # aggregate聚合函数（对数据库），返回值：字典{'read_num_sum':6}
        result = read_details.aggregate(read_num_sum=Sum('read_num'))
        read_nums.append(result['read_num_sum'] or 0)  # 常用逻辑判断，如果为FALSE，则取0
    return dates, read_nums


def get_today_hot_data(content_type):
    today = timezone.now().date()  # 获取今天的日期
    read_details = ReadDetail.objects.filter(content_type=content_type, date=today).order_by('-read_num')
    return read_details[:7]


def get_yesterday_hot_data(content_type):
    today = timezone.now().date()  # 获取今天的日期
    yesterday = today - datetime.timedelta(days=1)

    read_details = ReadDetail.objects.filter(content_type=content_type, date=yesterday).order_by('-read_num')
    return read_details[:7]

