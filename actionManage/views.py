from django.shortcuts import render

# Create your views here.
# 主菜单
def actionManage_index(request):
    context = {}
    return render(request, 'actionManage/actionHome.html', context)

# 基本信息之人员信息
def actionManage_employ(request):
    context = {}
    return render(request, 'actionManage/actionBaseInfo_employ.html', context)

# 基本信息之手术衣信息
def actionManage_clothes(request):
    context = {}
    return render(request, 'actionManage/actionBaseInfo_clothes.html', context)


# 基本信息之手术鞋信息
def actionManage_shoes(request):
    context = {}
    return render(request, 'actionManage/actionBaseInfo_shoes.html', context)



# 基本信息之更衣柜信息
def actionManage_cabinet(request):
    context = {}
    return render(request, 'actionManage/actionBaseInfo_cabinet.html', context)

# 追溯管理
def actionManage_traces(request):
    context = {}
    return render(request, 'actionManage/actionTraces.html', context)


# 库存管理
def actionManage_stock(request):
    context = {}
    return render(request, 'actionManage/actionStock.html', context)


# 库存管理
def actionManage_system(request):
    context = {}
    return render(request, 'actionManage/actionSystem.html', context)