from django import template
from django.contrib.contenttypes.models import ContentType
from ..models import Comment

# 实例化了一个 `template.Library` 类
register = template.Library()

@register.simple_tag
def get_comment_count(obj):
    content_type = ContentType.objects.get_for_model(obj)
    return Comment.objects.filter(content_type=content_type, object_id=obj.pk).count()

