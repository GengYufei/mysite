from django import forms  # 引入Django自带的登录表单
from django.contrib.auth import authenticate  # 引入用户模块(作用：判断用户输入的账号密码是否有效)
from django.contrib.auth.models import User



class LoginForm(forms.Form):
    username = forms.CharField(label='用户名',
                               widget=forms.TextInput(attrs={'class': 'form-control',
                                                             'placeholder': '请输入用户名'}))
    # attrs是form表单的属性集合（字典类型），为了借用bootstraps样式，通过'class': 'form-control'设置成功
    password = forms.CharField(label='密码', widget=forms.PasswordInput(attrs={'class': 'form-control',
                                                                               'placeholder': '请输入密码'}))
    # 验证用户名、密码是否正确
    def clean(self):
        username = self.cleaned_data['username']
        password = self.cleaned_data['password']
        # 通过authenticate方法判断用户输入的用户名跟密码是否可用，若可用返回user对象，否则返回None
        user = authenticate(username=username, password=password)
        # 如果user不为None
        if user is None:
            raise forms.ValidationError('用户名或密码不正确！')
        else:
            self.cleaned_data['user'] = user
        return self.cleaned_data


class RegForm(forms.Form):
    username = forms.CharField(label='用户名', max_length=20, min_length=3,
                               widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': '请输入用户名（3-20位）'}))
    email = forms.EmailField(label='邮箱',
                             widget=forms.EmailInput(attrs={'class': 'form-control', 'placeholder': '请输入邮箱'}))
    password = forms.CharField(label='密码', max_length=20, min_length=6,
                               widget=forms.PasswordInput(attrs={'class': 'form-control',
                                                                 'placeholder': '请输入密码（6-20位）'}))
    password_again = forms.CharField(label='密码', max_length=20, min_length=6,
                               widget=forms.PasswordInput(attrs={'class': 'form-control',
                                                                 'placeholder': '请再次输入密码（6-20位）'}))

    def clean_username(self):
        username = self.cleaned_data['username']
        if User.objects.filter(username=username).exists():
            raise forms.ValidationError('用户名已存在')
        return username

    def clean_email(self):
        email = self.cleaned_data['email']
        if User.objects.filter(username=email).exists():
            raise forms.ValidationError('邮箱账号已存在')
        return email

    def clean_password_again(self):
        password = self.cleaned_data['password']
        password_again = self.cleaned_data['password_again']
        if password != password_again:
            raise forms.ValidationError('两次输入的密码不一致')
        return password_again

